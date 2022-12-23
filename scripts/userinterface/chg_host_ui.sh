#!/usr/bin/bash

CUR_HNAME=$(cat /etc/hostname)

HNAME=$(whiptail --inputbox "New hostname:" 16 64 --title "Change Hostname" 3>&1 1>&2 2>&3)

# Update /etc/hostname file
echo $HNAME > /etc/hostname

# Update /etc/hosts file
sed -i "s/$CUR_HNAME/$HNAME/g" /etc/hosts


# Inform user
whiptail --title "Change Hostname" --msgbox "Hostname \"$CUR_HNAME\" changed with \"$HNAME\"" 16 64

# If the new hostname is same as old hostname inform user