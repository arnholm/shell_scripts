#!/bin/bash
# cross-pi-rootfs.sh
# Run this script with sudo privilege

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Fetch the latest raspberry PI root file system from  the PI
# NOTE: replace "pi@TVpi2" with your <pi-username>@<PI-static-ip-address>
rsync -vR --progress -rl --delete-after --safe-links pi@TVpi2:/{lib,usr,etc/ld.so.conf.d,opt/vc/lib} /opt/cross-pi-rootfs
echo "Raspberry PI root file system has been installed/updated! "
ls -l /opt/cross-pi-rootfs