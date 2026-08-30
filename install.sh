#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

export MOUNTPOINT="/mnt"

archinstall --config-url "https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/archinstall-config.json"

mkdir -p "$MOUNTPOINT/usr/local/libexec/my-archy"
mkdir -p "$MOUNTPOINT/var/lib/my-archy"

git clone https://github.com/Thijzert123/my-archy.git /tmp/my-archy
cp /tmp/my-archy/install/first-boot.sh "$MOUNTPOINT/usr/local/libexec/my-archy-first-boot.sh"
cp /tmp/my-archy/install/user-setup.sh "$MOUNTPOINT/usr/local/libexec/my-archy-user-setup.sh"
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

cp -r /tmp/my-archy "$MOUNTPOINT/tmp/my-archy"

arch-chroot "$MOUNTPOINT" /tmp/my-archy/install/pre-boot.sh
