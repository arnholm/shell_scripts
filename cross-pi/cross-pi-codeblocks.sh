#!/bin/bash
# cross-pi-codeblocks.sh

cd ~
mkdir build_codeblocks
cd build_codeblocks/
git clone https://github.com/obfuscated/codeblocks_sf
cd codeblocks_sf/
dpkg-buildpackage -us -uc
cd ..
sudo dpkg -i *.deb
cd ~
echo "Code::Blocks has been installed! "
