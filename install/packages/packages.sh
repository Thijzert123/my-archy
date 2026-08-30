#!/bin/bash

base_packages="$INSTALL_DIR/packages/base.packages"
extra_packages="$INSTALL_DIR/packages/extra.packages"

yay -S --needed - < "$base_packages"
yay -S --needed - < "$extra_packages"
