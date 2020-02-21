# cross-pi
This is an attempt to describe a Raspberry PI cross-compiler setup for a Kubuntu virtual machine. 
It is a work in progress and must be considered incomplete and possibly wrong in some places. 
It consists of a list of things to do and a few supporting shell scripts. I strongly advice to follow 
these procedures under a disposable **virtual machine only**. 

***Disclaimer:*** _The author regularly uses the software on several of his virtual machines and firmly believes that the software 
is without any damaging effect. Nevertheless, the author accepts no responsibility for damages resulting 
from use of the procedures or software and makes no warranty or representation, either express or implied, 
including but not limited to, any implied warranty of merchantability or fitness for a particular purpose.
The information is provided "AS IS" and the author does not assume or accept any risk by its use._


  
## System preparations
By this we mean the basic OS setup of Kubuntu and Raspberry PI.

---

**Clean Kubuntu** 
  * Install clean Kubuntu under Virtual Box (if you prefer Ubuntu it works the same)
  * Give it a virtual disk of at least 30-50GB
  * Install git: sudo apt-get install git
  * Optional: configure network disks (/etc/fstab).

---
  
**Install Raspbian on the PI**
  * enable SSH in Raspbian, use raspi-config to do it.
  * Define  <a href="https://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip-address</a>">static-ip-address</a>. 
    Use "dhcpcd method", editing /etc/dhcpcd.conf
  * Optional: configure network disks (/etc/fstab).

---

## cross-pi preparations
I.e. cross-compiler toolchain under Kubuntu, and system root files from Raspberry PI required by cross compiler.

---

**Raspberry PI** : Install the latest Raspbian updates before copying to Kubuntu
```
sudo apt-get update
sudo apt-get upgrade
```

---

**Kubuntu** : Install cross-compiler toolchain and root file system (scripts must be run with sudo)

**cross-pi-toolchain.sh** : Installs to /opt/cross-pi-gcc (location cannot be changed)
  * Installs raspi-toolchain from https://github.com/Pro/raspi-toolchain
	  
**cross-pi-rootfs.sh** : Installs to /opt/cross-pi-rootfs
  * Current system libraries and include files are copied from the PI.
  * The PI must be accessible via SSH 
  * This script can also make updates if things have changed on the PI.

---
  
## cross-pi development tools and 3rd party libraries
By this we mean IDE and preferred libraries. This reflects my preferences, yours may be different.

---
  
**boost libraries** : run cross-pi-boost.sh to bild cross compiler version of boost

**cross-pi-boost.sh** : Download, build and install latest version of the boost libraries
  * Downloads from https://github.com/boostorg/boost
  * Builds and installs it to $HOME/cross-pi/3rdparty/boost


---
  
**wxWidgets libraries** : run cross-pi-wxwidgets.sh to bild cross compiler version of wxWidgets

**cross-pi-wxwidgets.sh** : Download, build and install latest version of the wxWidgets libraries
  * Downloads from https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.4/wxWidgets-3.0.4.tar.bz2
  * Builds and installs it to $HOME/cross-pi/3rdparty/wxwidgets

---
  
**msgpack** : run cross-pi-wxwidgets.sh to bild cross compiler version of msgpack

**cross-pi-msgpack.sh** : Download, build and install latest version of msgpack 
  * Downloads from https://github.com/msgpack/msgpack-c.git
  * Builds and installs it to $HOME/cross-pi/3rdparty/msgpack

---

**Code::Blocks IDE** : Either install from Kubuntu repository, or run _cross-pi-codeblocks.sh_ to get updated version

**cross-pi-codeblocks.sh** : Download, build and install latest version of Code::Blocks IDE
  * Downloads from https://github.com/obfuscated/codeblocks_sf 
  * Builds and installs it
  * Note that the IDE is *not* configured for cross compilation at this stage
  
---