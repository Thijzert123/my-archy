#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

export MOUNTPOINT="/mnt"

archinstall --config-url "https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/archinstall-config.json"

mkdir -p "$MOUNTPOINT/usr/local/libexec/my-archy"
mkdir -p "$MOUNTPOINT/var/lib/my-archy"

curl https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/first-boot.sh -o "$MOUNTPOINT/usr/local/libexec/my-archy-first-boot.sh"
curl https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/user-setup.sh -o "$MOUNTPOINT/mnt/usr/local/libexec/my-archy-user-setup.sh"
chmod +x "$MOUNTPOINT/usr/local/libexec/my-archy-first-boot.sh" "$MOUNTPOINT/mnt/usr/local/libexec/my-archy-user-setup.sh"

cat > "/mnt/etc/systemd/system/my-archy-first-boot.service" <<'EOF'
[Unit]
Description=my-archy first boot setup
Wants=network-online.target
After=network-online.target
ConditionPathExists=!/var/lib/my-archy/first-boot-done

[Service]
Type=oneshot
ExecStart=/usr/local/libexec/my-archy-first-boot.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --root="$MOUNTPOINT" my-archy-first-boot.service
