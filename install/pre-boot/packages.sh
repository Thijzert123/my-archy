#!/bin/bash

base_packages="/tmp/my-archy/install/pre-boot/base.packages"
extra_packages="/tmp/my-archy/install/pre-boot/extra.packages"

yay -S --noconfirm --needed - < "$base_packages"
yay -S --noconfirm --needed - < "$extra_packages"
