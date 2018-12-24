# kde5-FreeBSD12
A script to automate the installation of a desktop environment on FreeBSD-12 with a few select tweaks to make the terminal pretty and easy to use.


This is intended to be used on a fresh install of FreeBSD 12.  Tested on 11.2 and 12.0

Prerequisites:

A computer of VM with an internet connection.


Instructions:

Install FreeBSD as usual, and during the install process create a regular user, if you want the user to be able to use sudo, add them to the wheel group.  Once installed and rebooted, login as root run the following commands: 

"fetch https://raw.githubusercontent.com/RGreeneRI/kde5-FreeBSD12/master/kde5_inst.sh" to download. 

"chmod +x kde5_inst.sh" to make executable.

"./kde5_inst.sh" to run the script.


The script installs tools and drivers to accomodate it being installed as a VMware guest.  You will have to install the proper video drivers if running it on a real computer.  


Thanks,
Rich
