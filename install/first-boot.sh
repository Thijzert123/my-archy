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

runuser -u "$USERNAME" -- /opt/my-archy/install/user-setup.sh

systemctl disable my-archy-first-boot.service
