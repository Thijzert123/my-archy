#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

ARCHINSTALL_CONFIG_URL=""

archinstall --config-url "$ARCHINSTALL_CONFIG_URL"

mkdir -p /mnt/usr/local/libexec/my-archy
mkdir -p /mnt/var/lib/my-archy

curl https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/firstboot.sh -o /mnt/usr/local/libexec/my-archy-firstboot.sh
curl https://github.com/Thijzert123/my-archy/raw/refs/heads/main/install/user-setup.sh -o /mnt/usr/local/libexec/my-archy-user-setup.sh
chmod +x /mnt/usr/local/libexec/my-archy-firstboot.sh /mnt/usr/local/libexec/my-archy-user-setup.sh

cat > "/mnt/etc/systemd/system/my-archy-firstboot.service" <<'EOF'
[Unit]
Description=my-archy firstboot setup
Wants=network-online.target
After=network-online.target
ConditionPathExists=!/var/lib/my-archy/firstboot-done

[Service]
Type=oneshot
ExecStart=/usr/local/libexec/my-archy-firstboot.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --root=/mnt my-archy-firstboot.service
