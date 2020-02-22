#!/bin/bash
# cross-pi-rootfs.sh
# Run this script with sudo privilege

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
#
# Ask for Raspberry PI user name and IP-address on the format <username>@<ip-address>
# (during rsync run the pi will ask for password)
PI_LOGIN="pi@TVpi2"
read -p "Enter PI username@ip-address [$PI_LOGIN]: " input
PI_LOGIN="${input:-$PI_LOGIN}"

# Fetch the latest raspberry PI root file system from  the PI
#
# -vR            : verbose, Relative
# --progress     : print information showing the progress of the transfer
# -rl            : r=recursive, l=copy symlinks as symlinks
# --delete-after : receiver deletes after transfer, not before (?)
# --safe-links   : This tells rsync to ignore any symbolic links which point outside the copied tree.
# 
rsync -vR --progress -rl --delete-after --safe-links $PI_LOGIN:/{lib,usr,etc/ld.so.conf.d,opt/vc/lib} /opt/cross-pi-rootfs
echo "Raspberry PI root file system has been installed/updated! "
ls -l /opt/cross-pi-rootfs
