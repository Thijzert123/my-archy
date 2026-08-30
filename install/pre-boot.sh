#!/bin/bash

USERNAME="$(
    getent passwd |
        awk -F: '
            $3 >= 1000 &&
            $3 < 60000 &&
            $1 != "nobody" {
                print $1
                exit
            }
        '
)"

TEMP_SUDO="/etc/sudoers.d/my-archy-temp"

cleanup() {
    rm -f "$TEMP_SUDO"
}

trap cleanup EXIT

printf '%s ALL=(ALL:ALL) NOPASSWD: ALL\n' "$USERNAME" \
    > "$TEMP_SUDO"

chmod 0440 "$TEMP_SUDO"

# Verify sudoers file
visudo -cf "$TEMP_SUDO"

runuser -u "$USERNAME" -- "/opt/my-archy/install/pre-boot/yay.sh"
runuser -u "$USERNAME" -- "/opt/my-archy/install/pre-boot/packages.sh"
runuser -u "$USERNAME" -- "/opt/my-archy/install/pre-boot/rust.sh"
