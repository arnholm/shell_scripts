#!/bin/bash
# cross-pi-kubuntu.sh
# This script installs ubuntu system packages required for  the cross build tools

sudo apt-get update
sudo apt-get upgrade
sudo apt install git wget qt5-default build-essential
mkdir -p $HOME/cross-pi-build

echo "Kubuntu essential system packages have been installed"
