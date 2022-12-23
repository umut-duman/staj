#!/usr/bin/bash

CUR_HNAME=$(whiptail --inputbox "Current hostname:" 16 64 --title "Change Hostname" 3>&1 1>&2 2>&3)

HNAME=$(whiptail --inputbox "New hostname:" 16 64 --title "Change Hostname" 3>&1 1>&2 2>&3)

# Update /etc/hostname file
echo $HNAME > /etc/hostname

# Update /etc/hosts file
sed -i "s/$CUR_HNAME/$HNAME/g" /etc/hosts

whiptail --title "Change Hostname" --msgbox "Hostname has been changed" 16 64
