#!/bin/bash

# Stop script when errors occur
set -eEo pipefail

sudo -v

export INSTALL_DIR="~/.local/share/my-archy/install"

source "$INSTALL_DIR/packages/all.sh"
