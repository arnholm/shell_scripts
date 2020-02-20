#!/bin/bash
# cross-pi-toolchain.sh
# Run this script with sudo privilege

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Fetch the latest raspberry PI toolchain from github
wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz -P /tmp/raspi-toolchain
# Extract the toolchain
# Note: The toolchain has to be in /opt/cross-pi-gcc since it's not location independent.
sudo tar xfz /tmp/raspi-toolchain/raspi-toolchain.tar.gz --strip-components=1 -C /opt
echo "Raspberry PI toolchain has been installed! "
ls -l /opt/cross-pi-gcc