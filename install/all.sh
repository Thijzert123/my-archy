#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

sudo -v

# To have -y onece more just to be sure (if this script directly gets called)
sudo pacman -Syu --noconfirm

export INSTALL_DIR="/tmp/my-archy/install"

source "$INSTALL_DIR/packages/all.sh"
source "$INSTALL_DIR/config/all.sh"
