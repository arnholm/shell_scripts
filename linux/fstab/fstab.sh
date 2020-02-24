#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# required for NAS drive
apt install cifs-utils
#
mkdir /media/nas_ca 
chmod ugo+rw /media/nas_ca
ln -s /media/nas_ca /NAS_ca 
#
mkdir /media/nas_openbzr
chmod ugo+rw /media/nas_openbzr
ln -s /media/nas_openbzr /NAS_openbzr
#
mkdir /root/smb/
chmod 700 /root/smb/
cp ./credentials  /root/smb/credentials
nano /root/smb/credentials
#
# append to system fstab
cat ./fstab.txt >> /etc/fstab
mount -a
