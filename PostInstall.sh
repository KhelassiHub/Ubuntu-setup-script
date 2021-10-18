#!/bin/bash

sudo apt update
sudo apt upgrade

# Prerequisites
sudo apt install build-essential cmake libboost-all-dev curl -y

# Enable partner repositories if disabled
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
sudo apt-get update

# Code editor (VS code)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y

# General Software


# Browsers
sudo apt-get install firefox -y


echo "Script finished"