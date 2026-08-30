#!/bin/bash

sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin

OLDPWD=$PWD
cd /tmp/yay-bin
makepkg -si --noconfirm --needed
cd $OLDPWD
