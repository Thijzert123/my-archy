#!/bin/bash

base_packages="$INSTALL_DIR/packages/base.packages"
extra_packages="$INSTALL_DIR/packages/extra.packages"

yay -S --noconfirm --needed - < "$base_packages"
yay -S --noconfirm --needed - < "$extra_packages"
