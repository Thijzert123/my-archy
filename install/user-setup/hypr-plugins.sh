#!/bin/bash

OLDPWD=$PWD

mkdir -p ~/.config/hypr/plugins
cd ~/.config/hypr/plugins
git clone https://github.com/zjeffer/split-monitor-workspaces
cd split-monitor-workspaces
# Use hyprland version here
git fetch -Ppft && git checkout release/0.56.x

cd $OLDPWD
