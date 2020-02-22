#!/bin/bash
# cross-pi-buildroot.sh
# Do NOT run this with sudo
#
# references:
#    
#
# Fetch the latest buildroot
cd $HOME
mkdir -p cross-pi
pushd cross-pi > /dev/null 
git clone https://git.buildroot.net/buildroot

# Move to the buildroot directory 
cd buildroot

# Make sure QT is installed so that make xconfig (below) will actually work
sudo apt install qt5-default

# Update the buildroot configuration
make xconfig

# It is very important that this is done correctly
# NOTE1: The settings below are in addition to the default ones

# 1. Target options
#       > Target Architecture
#          (x) ARM (little endian)

# 2. Toolchain 
#       >  C library 
#          (x)   glibc

# 3. Toolchain 
#      (x) Enable C++ support

# 4  Target packages
#       >  Graphics libraries and applications
#          [x] x.org X Window System

# 5  Target packages
#       > Libraries
#         >  Graphics
#             {x] libgtk2

# 5  Target packages
#       > Libraries
#         >  cairo   (not sure where this was)

# NOTE2: You must use File -> Save after making the changes

echo "You can run 'make' now to build the toolchain! (it will take a couple of hours) ".
echo "The cross compiler will be in output/host/usr/bin"
