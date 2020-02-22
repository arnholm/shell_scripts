#!/bin/bash
# cross-pi-toolchain.sh
# Run this script with sudo privilege
# This script downloads & installs Ubuntu/Raspberry PI cross compiler toolchain
# NOTE: The toolchain has to be in /opt/cross-pi-gcc since it's not location independent.

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
#
cd /opt
# Fetch the latest raspberry PI toolchain from GitHub
git clone https://github.com/raspberrypi/tools  cross-pi-gcc
# wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz -P /tmp/raspi-toolchain
#
# Install the toolchain 
# tar xfz /tmp/raspi-toolchain/raspi-toolchain.tar.gz --strip-components=1 -C /opt
#
echo "Raspberry PI toolchain has been installed! "
ls -l /opt/cross-pi-gcc
