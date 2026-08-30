#!/bin/bash

sudo sed -i '/^\#\[multilib\]/,/^\#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /etc/pacman.conf
yay -Syu

base_packages="/opt/my-archy/install/pre-boot/base.packages"
extra_packages="/opt/my-archy/install/pre-boot/extra.packages"

yay -S --noconfirm --needed - < "$base_packages"
yay -S --noconfirm --needed - < "$extra_packages"
