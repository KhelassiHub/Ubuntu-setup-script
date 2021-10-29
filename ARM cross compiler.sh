#!/bin/bash

sudo apt update

pkgs='gdb gcc-arm-none-eabi gdb-multiarch'
for pkg in $pkgs; do
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
        sudo apt install $pkg -y
    fi
done

sudo ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb

echo "Script finished"