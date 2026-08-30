#!/bin/bash

TEMP_SUDO="/etc/sudoers.d/my-archy-temp"

cleanup() {
    rm -f "$TEMP_SUDO"
}

trap cleanup EXIT

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

runuser -u "$USERNAME" -- "/opt/my-archy/install/pre-boot/yay.sh"
runuser -u "$USERNAME" -- "/opt/my-archy/install/pre-boot/packages.sh"
runuser -u "$USERNAME" -- "/opt/my-archy/install/pre-boot/rust.sh"
