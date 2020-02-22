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

Once installed, a directory structure will be created under Kubuntu

    $HOME/cross-pi             ... Clone of the cross-pi git repo with scripts
    $HOME/cross-pi-build       ... The  build area
                    /buildroot ... cross compiler goes here
                    /3rdparty  ... 3rd party libraries goes here
  
---

## System preparations

This means the basic OS setup of Kubuntu and Raspberry PI.

**Install Kubuntu** 
  * Install Kubuntu ("Kubuntu-cross-pi") under Virtual Box (ok to use Ubuntu)
  * Give it a virtual disk of 40GB or larger size
  * Install git: _sudo apt install git_
  * From $HOME, clone the repo: _git clone https://github.com/arnholm/cross-pi_ 
  * _Optional: configure network disks (/etc/fstab)_.

  
**Install Raspbian on the PI**
  * Enable SSH in Raspbian, use raspi-config to do it.
  * Define  <a href="https://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip-address</a>">static-ip-address</a>. 
    Use "dhcpcd method", editing /etc/dhcpcd.conf
  * _Optional: configure network disks (/etc/fstab)_.

---

## cross-pi preparations (Kubuntu)
I.e. cross-compiler toolchain and system root required by cross compiler. Run the scripts below.

**cross-pi-kubuntu.sh** : Installs essential system packages required

**cross-pi-buildroot.sh** :  Builds and installs the cross compiler
  * Installs to _$HOME/cross-pi-build/buildroot_
  * This process takes ~2 hours and is not 100% automatic
  * Please note detailed instructions as comments in the script file

---
  
## cross-pi 3rd party libraries and IDE (Kubuntu)

This reflects my preferences, yours may be different. It is required to have completed the **cross-pi-buildroot.sh** step above before you do this before running the scripts below.


**cross-pi-boost.sh** : Builds cross-pi version of boost libraries
  * Skip this if you don't use boost
  * Installs to _3rdparty/boost_

**cross-pi-wxwidgets.sh** : Builds cross-pi version of wxWidgets libraries
  * Skip this if you don't use wxWidgets
  * Build wxWidgets as static libraries
  * Installs to _3rdparty/wxwidgets_

**cross-pi-msgpack.sh** : Builds cross-oi version of msgpack 
  * Skip this if you don't use msgpack
  * Installs to _3rdparty/msgpack_

**cross-pi-codeblocks.sh** : Installs the Code::Blocks IDE to /usr
  * Skip this if you don't use Code::Blocks
  * Alternatively, use the older version provided by the Kubuntu package manager
  * Installs to _/usr_
  
---