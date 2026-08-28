#!/bin/bash

sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay

OLDPWD=$PWD
cd /tmp/yay
makepkg -si
cd $OLDPWD
