#!/bin/bash
# cross-pi-toolchain.sh
# Run this script with sudo privilege
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
#
# does exclude some rarely used stuff
# change =no to =yes or omit =no to include in build
XTIFF="--with-libtiff=no"
XJPEG="--with-libjpeg=yes"
ODBC="--with-odbc=no"

# put here things to explicitely enable
ENABLE="--with-gtk --with-opengl --enable-unicode --enable-dnd --enable-dataobj --enable-graphics-ctx"

# put here things to explicitely disable
DISABLE="--enable-shared=no --enable-iff=no --enable-tga=no --enable-pcx=no --enable-mediactrl=no --enable-dialupman=no --with-libmspack=no"

# argument can be D for debug version
if [ "$1" = "D" ] ; 
then
  DEB="--enable-debug"
else
  DEB="--enable-debug=no"
fi

#build in a temporary, disposable folder /tmp/build_wxwidgets

# download wxwidgets
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.4/wxWidgets-3.0.4.tar.bz2 -P /tmp/build_wxwidgets

# extract the download package
pushd /tmp/build_wxwidgets/ > /dev/null 
tar -xvf ./wxWidgets-3.0.4.tar.bz2 
pushd wxWidgets-3.0.4/ > /dev/null 

# create a build folder
mkdir buildgtk
pushd buildgtk/ > /dev/null 

# here starts the configure
# make sure the cross-pi toolchain is first in PATH so we find the correct compiler
export PATH=/opt/cross-pi-gcc/bin:$PATH

# set the cross-pi root file system as prefix
# set the host as arm-linux
../configure --prefix=/opt/cross-pi-rootfs/usr --host=arm-linux-gnueabihf ${ENABLE} ${DISABLE} ${XJPEG} ${XTIFF} ${ODBC} ${DEB}
if [ $? != 0 ]; then exit -1 ; fi

make
if [ $? != 0 ]; then exit -1 ; fi

sudo make install
if [ $? != 0 ]; then exit -1 ; fi

sudo ldconfig
if [ $? != 0 ]; then exit -1 ; fi

# back up directory tree
popd > /dev/null
popd > /dev/null
popd > /dev/null

