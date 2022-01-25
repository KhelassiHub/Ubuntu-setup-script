#!/bin/bash

sudo apt update
sudo apt upgrade

# Prerequisites --------------------------------------------------------------------
pkgs='build-essential make cmake g++ git libboost-all-dev curl preload'
for pkg in $pkgs; do
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
        sudo apt install $pkg -y
    fi
done

# Enable partner repositories if disabled ------------------------------------------
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
sudo apt-get update

# Git lfs
sudo apt install git-lfs


# Code editor (VS code) ----------------------------------
pkg=code
status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    sudo apt install apt-transport-https -y
    sudo apt update
    sudo apt install code -y
fi

# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# rm -f packages.microsoft.gpg

# sudo apt install apt-transport-https -y
# sudo apt update
# sudo apt install code -y

# General Software --------------------------------------------------------------------

# Gnome tweak tool
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

# # Spotify
# sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
# curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
# sudo apt update
# sudo apt install spotify-client

# VLC
sudo apt install VLC


# Browsers  ----------------------------------------------------------------------------
sudo apt-get install firefox -y


# Anaconda  ----------------------------------------------------------------------------

if [ -d "/home/$USER/anaconda3" ] 
then
    echo "Anaconda is already installed." 
else
#Prerequisites
    sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
# Downloading anaconda
    wget -P /tmp https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
# Starting installation process
    bash /tmp/Anaconda3-2020.02-Linux-x86_64.sh
fi

# Docker
sudo apt install docker.io

# Screen (terminal multiplexer)
sudo apt install screen

# Yubikey
sudo apt-get install libpam-u2f

#Dynamic wallpaper
sudo apt-get install variety

#Pop shell (tiling) if your not running on PopOs
    #requires sudo apt install node-typescript

git clone https://github.com/pop-os/shell
cd shell
make local-install

# Cleaning stuff
sudo apt-get autoremove
sudo apt-get autoclean



echo "Script finished"