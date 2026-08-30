#!/bin/bash

# Loop all normal users to install their setup
getent passwd |
    awk -F: '$3 >= 1000 && $3 < 60000 && $1 != "nobody" { print $1 }' |
    while IFS= read -r USERNAME; do
        runuser -u "$USERNAME" -- /opt/my-archy/install/user-setup.sh
    done

systemctl disable my-archy-first-boot.service
