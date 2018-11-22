# kde5-FreeBSD11
A script to automate the installation of a desktop environment on FreeBSD-11 with a few select tweaks to make the shell pretty and easy to use.


This is intended to be used on a fresh install of FreeBSD 11.  Tested on 11.2

Prerequisites:
Install FreeBSD, and during the install process create a regular user, and if you want them to be able to use sudo, add them to the wheel group.  Once installed and rebooted, run the kde5_inst.sh as the root user.

The script installs tools and drivers to accomodate it being installed as a VMware guest.  You will have to install the proper video drivers and disable/remove open-vm-tools if running it on a real computer.


Thanks,
Rich
