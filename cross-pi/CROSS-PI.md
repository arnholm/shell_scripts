# cross-pi
This is an attempt to describe a cross-compiler setup under a Kubuntu virtual machine, targeting code for Raspberry PI. It is a work in progress and must be considered incomplete and possibly wrong in some places. It consists of a list of things to do and a few supporting shell scripts.

## System preparations
By this we mean the basic OS setup of Kubuntu and Raspberry PI.

* Install clean Kubuntu under Virtual Box
  * Give it a virtual disk of at least 30GB
  * Install git: sudo apt-get install git
  * Optional: configure network disks (/etc/fstab).
  
* Install Raspbian on the PI 
  * enable SSH in Raspbian, use raspi-config to do it.
  * Define  <a href="https://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip-address</a>">static-ip-address</a>. 
    Use "dhcpcd method", editing /etc/dhcpcd.conf
  * Optional: configure network disks (/etc/fstab).
 

## cross-pi preparations
By this we mean the basic cross-compiler tools under Kubuntu, including required files from raspberry pi

### PI
Upgrade Raspbian with the latest updates
```
sudo apt-get update
sudo apt-get upgrade
```

### Kubuntu
  * Install raspi-toolchain from https://github.com/Pro/raspi-toolchain. 
     * **sudo cross-pi-toolchain.sh**
	  * The toolchain will then be installed to /opt/cross-pi-gcc (location cannot be changed)
	  
  * Install root file system from raspberry
     * We need to get the current libraries and include files from the PI
	  * The PI must be running and accessible via SSH 
	  * **sudo cross-pi-rootfs.sh**. This can also make updates if things changed on the PI.
	  * The root file system will be installed to /opt/cross-pi-rootfs
	  
## cross-pi development tools and libraries
This reflects my preferred tools, your preference may be different.

### Code::Blocks IDE

You can either 

  * install old version from Kubuntu repository: **sudo apt-get install codeblocks codeblocks-contrib**
  * or build from Github source using **cross-pi-codeblocks.sh**



