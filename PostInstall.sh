#!/bin/bash

sudo apt update
sudo apt upgrade

# Prerequisites --------------------------------------------------------------------
sudo apt install build-essential make cmake g++ git libboost-all-dev curl preload -y

# Enable partner repositories if disabled ------------------------------------------
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
sudo apt-get update

# Code editor (VS code) ----------------------------------
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y

# General Software --------------------------------------------------------------------

# Gnome tweak tool
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
# Spotify
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update
sudo apt install spotify-client
# VLC
sudo apt install VLC


# Browsers  ----------------------------------------------------------------------------
sudo apt-get install firefox -y


# Anaconda  ----------------------------------------------------------------------------

#Prerequisites
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
# Downloading anaconda
wget -P /tmp https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
# Starting installation process
bash /tmp/Anaconda3-2020.02-Linux-x86_64.sh

# Cleaning stuff
sudo apt-get autoremove
sudo apt-get autoclean

echo "Script finished"