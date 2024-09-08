#!/bin/bash

sleep 2
export HOME=/home/container
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

curl -Ls https://raw.githubusercontent.com/cloudgamingrage/Pterodactyl-VPS-Egg/main/install.sh -o install.sh
curl -Ls https://raw.githubusercontent.com/cloudgamingrage/Pterodactyl-VPS-Egg/main/run.sh -o run.sh

# Make run.sh executable.
chmod +x /install.sh

# Run the VPS Installer
sh ./install.sh
