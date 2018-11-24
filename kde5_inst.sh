#!/bin/sh

# Written by: Rich Greene
# Contains code from: Dylan Charpentier
# Contains code from: http://easyos.net/articles/bsd/freebsd/output_control_in_freebsd_console

# Reset
NC='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
COOL='\033[1;41m'         # COOL


clear;

echo -e "${COOL}********************************************************************************"
echo -e "********************************************************************************"
echo -e "******                                                                    ******"
echo -e "******   This script will install KDE Plasma and a bunch of useful stuff  ******"
echo -e "******   to make FreeBSD fun to use! Be sure that you have already        ******"
echo -e "******   created a standard user before proceeding...                     ******"
echo -e "******                                                                    ******"
echo -e "********************************************************************************"
echo -e "********************************************************************************${NC}"
echo ""
echo ""

# prompt user to press enter or not
read -r -p "Press ENTER to continue, or Control-C to abort..." key

clear;

echo -e "${COOL}********************************************************************************"
echo -e "********************************************************************************"
echo -e "******                                                                    ******"
echo -e "******   About to update FreeBSD                                          ******"
echo -e "******                                                                    ******"
echo -e "********************************************************************************"
echo -e "********************************************************************************${NC}"
echo ""
echo ""

# Start Countdown
progress_bar() {
  progress=$(( $1 * 30 / 5 ))
  bar=`printf "\33[41m% ${progress}s\33[m" ""`
  printf "\33[37D[%- 38s] %- 4s" "${bar}" "$1"
}
i=5
printf "Proceeding in 5 seconds: \33[37C"
while [ $i -ge 0 ];
do
  progress_bar $i
  i=$(( $i - 1 ))
  sleep 1
done
echo
# End Countdown

# fetch and install FreeBSD updates
env PAGER=cat freebsd-update fetch;
freebsd-update install;

clear;

echo -e "${COOL}********************************************************************************"
echo -e "********************************************************************************"
echo -e "******                                                                    ******"
echo -e "******   About to set up the package manager and install packages.        ******"
echo -e "******                                                                    ******"
echo -e "********************************************************************************"
echo -e "********************************************************************************${NC}"
echo ""
echo ""

# Start Countdown
progress_bar() {
  progress=$(( $1 * 30 / 5 ))
  bar=`printf "\33[41m% ${progress}s\33[m" ""`
  printf "\33[37D[%- 38s] %- 4s" "${bar}" "$1"
}
i=5
printf "Proceeding in 5 seconds: \33[37C"
while [ $i -ge 0 ];
do
  progress_bar $i
  i=$(( $i - 1 ))
  sleep 1
done
echo
# End Countdown

# install package manager and install packages
env ASSUME_ALWAYS_YES=yes pkg bootstrap;
env ASSUME_ALWAYS_YES=yes pkg install wget nano sudo htop kde5 hal dbus xorg xterm bash zsh open-vm-tools xf86-video-vmware xf86-input-vmmouse sddm screenFetch chromium;

clear;

echo -e "${COOL}********************************************************************************"
echo -e "********************************************************************************"
echo -e "******                                                                    ******"
echo -e "******   About to make changes to rc.conf                                 ******"
echo -e "******                                                                    ******"
echo -e "********************************************************************************"
echo -e "********************************************************************************${NC}"
echo ""
echo ""

# Start Countdown
progress_bar() {
  progress=$(( $1 * 30 / 5 ))
  bar=`printf "\33[41m% ${progress}s\33[m" ""`
  printf "\33[37D[%- 38s] %- 4s" "${bar}" "$1"
}
i=5
printf "Proceeding in 5 seconds: \33[37C"
while [ $i -ge 0 ];
do
  progress_bar $i
  i=$(( $i - 1 ))
  sleep 1
done
echo
# End Countdown

# update rc.conf with required variables
sysrc hald_enable="YES";
sysrc dbus_enable="YES";
sysrc sddm_enable="YES";
sysrc vmware_guest_vmblock_enable="YES";
sysrc vmware_guest_vmhgfs_enable="YES";
sysrc vmware_guest_vmmemctl_enable="YES";
sysrc vmware_guest_vmxnet_enable="YES";
sysrc vmware_guestd_enable="YES";

clear;

echo -e "${COOL}********************************************************************************"
echo -e "********************************************************************************"
echo -e "******                                                                    ******"
echo -e "******   Please type in the username of your regular user to copy zsh     ******"
echo -e "******   config and set zsh as the default shell                          ******"
echo -e "******                                                                    ******"
echo -e "********************************************************************************"
echo -e "********************************************************************************${NC}"
echo ""
echo ""

# prompt for username of regular user
read -p 'Username: ' USERNAME

# changer provided user's shell and set up empty ,zshrc file
chsh -s /usr/local/bin/zsh $USERNAME;
cd /var/empty;
cd /home/$USERNAME;
echo "#Empty file, settings inherited from /usr/local/etc/zshrc" > .zshrc;
chown $USERNAME:$USERNAME .zshrc;

#Download customized zshrc from grml and customize further
cd /usr/local/etc;
wget -O zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc;
echo "screenFetch" >> zshrc;
sed -i bak "s/alias ll='command ls -l/alias ll='command ls -lahF/" zshrc;
sed -i bak 's/alias ll="command ls -l/alias ll="command ls -lahF/' zshrc;

# allow wheel group to use sudo
sed 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' sudoers > sudoers.new;
chmod 640 sudoers;
mv sudoers sudoers.old;
mv sudoers.new sudoers;
chmod 440 sudoers;
chmod 440 sudoers.old;

clear;

echo -e "${COOL}********************************************************************************"
echo -e "********************************************************************************"
echo -e "******                                                                    ******"
echo -e "****** Machine will reboot in 20 seconds for the changes to take effect!  ******"
echo -e "******                                                                    ******"
echo -e "********************************************************************************"
echo -e "********************************************************************************${NC}"
echo ""
echo ""

# Start Countdown
progress_bar() {
  progress=$(( $1 * 30 / 20 ))
  bar=`printf "\33[41m% ${progress}s\33[m" ""`
  printf "\33[37D[%- 38s] %- 4s" "${bar}" "$1"
}
i=20
printf "Rebooting in 20 seconds: \33[37C"
while [ $i -ge 0 ];
do
  progress_bar $i
  i=$(( $i - 1 ))
  sleep 1
done
echo
# End Countdown

# reboot machine
reboot

