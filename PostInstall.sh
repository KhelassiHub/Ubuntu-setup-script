#!/bin/bash

execute () {
	echo "$ $*"
	OUTPUT=$($@ 2>&1)
	if [ $? -ne 0 ]; then
        echo "$OUTPUT"
        echo ""
        echo "Failed to Execute $*" >&2
        exit 1
    fi
}

execute sudo apt update
execute sudo apt upgrade

# Prerequisites
execute sudo apt install build-essential cmake libboost-all-dev curl -y

# Code editor (VS code)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
execute rm -f packages.microsoft.gpg

execute sudo apt install apt-transport-https -y
execute sudo apt update
sudo apt install code -y

# General Software

# # Enable partner repositories if disabled
# sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
# execute sudo apt-get update

echo "Script finished"