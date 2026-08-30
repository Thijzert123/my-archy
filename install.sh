#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

archinstall --config-url "https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/archinstall-config.json"

mkdir -p /mnt/usr/local/libexec/my-archy
mkdir -p /mnt/var/lib/my-archy

curl https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/first-boot.sh -o /mnt/usr/local/libexec/my-archy-first-boot.sh
curl https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/user-setup.sh -o /mnt/usr/local/libexec/my-archy-user-setup.sh
chmod +x /mnt/usr/local/libexec/my-archy-first-boot.sh /mnt/usr/local/libexec/my-archy-user-setup.sh

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

systemctl enable --root=/mnt my-archy-first-boot.service
