#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

sudo -v

echo "Updating system and installing git..."
sudo pacman -Syu --noconfirm --needed git

echo -e "\nCloning my-archy repository..."
git clone https://github.com/Thijzert123/my-archy.git ~/.local/share/my-archy

echo -e "\nStarting installation..."
source ~/.local/share/my-archy/install/all.sh
