#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
#
mkdir /media/nas_scratch 
chmod ugo+rw /media/nas_scratch
ln -s /media/nas_scratch /NAS_scratch 
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
cat ./fstab.txt >> /etc/fstab
mount -a
