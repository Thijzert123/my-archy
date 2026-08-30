#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

export MOUNTPOINT="/mnt"

pacman -Sy --noconfirm --needed git
git clone https://github.com/Thijzert123/my-archy.git /tmp/my-archy

script -q /dev/null -c 'archinstall --config /tmp/my-archy/install/archinstall-config.json'

cp -r /tmp/my-archy "$MOUNTPOINT/opt/my-archy"

cat > "$MOUNTPOINT/etc/systemd/system/my-archy-first-boot.service" <<'EOF'
[Unit]
Description=my-archy first boot setup
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/opt/my-archy/install/first-boot.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --root="$MOUNTPOINT" my-archy-first-boot.service

arch-chroot "$MOUNTPOINT" /opt/my-archy/install/pre-boot.sh
