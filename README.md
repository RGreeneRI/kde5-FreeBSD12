# kde5-FreeBSD12
A script to automate the installation of a desktop environment on FreeBSD-12 with a few select tweaks to make the terminal pretty and easy to use.


This is intended to be used on a fresh install of FreeBSD 11.2+.  Tested on 11.2, 12.0, and 12.1-Beta3.

Prerequisites:

A computer or VM with an internet connection and a clean install of FreeBSD.


Instructions:

Install FreeBSD as usual.  Once installed and rebooted, login as root run the following commands: 

"fetch https://raw.githubusercontent.com/RGreeneRI/kde5-FreeBSD12/master/kde5_inst.sh --no-verify-peer" to download. 

"chmod +x kde5_inst.sh" to make executable.

"./kde5_inst.sh" to run the script.


The script optionally installs tools and drivers to accomodate it being installed as a VMware guest.  You may have to install the proper video drivers if running it on a real computer.  


Thanks,
Rich
