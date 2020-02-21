#!/bin/bash
# cross-pi-codeblocks.sh
# This script downloads, builds and installs Code::Blocks under debian/ubuntu
# Run this script with sudo privilege

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#build in a temporary, disposable folder
mkdir /tmp/build_codeblocks
pushd /tmp/build_codeblocks/ > /dev/null 
#
# fetch latest from github
git clone https://github.com/obfuscated/codeblocks_sf
#
# build the *.deb files
cd ./codeblocks_sf/
dpkg-buildpackage -us -uc
#
# install from the just created *.deb files
cd ..
dpkg -i *.deb
#
# return to original directory
popd > /dev/null
echo "Code::Blocks has been installed! "
