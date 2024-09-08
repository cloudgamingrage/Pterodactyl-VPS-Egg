#!/bin/bash

sleep 2
export HOME=/home/container
cd /home/container
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

curl -Ls https://raw.githubusercontent.com/cloudgamingrage/Pterodactyl-VPS-Egg/main/install.sh -o install.sh
curl -Ls https://raw.githubusercontent.com/cloudgamingrage/Pterodactyl-VPS-Egg/main/run.sh -o run.sh

# Copy run.sh to /home/container
cp /run.sh "$HOME/run.sh"

# Make run.sh executable.
chmod +x "$HOME/run.sh"

# Run the VPS Installer
bash /install.sh
