#!/usr/bin/bash

TITLE="Change Hostname"

CUR_HNAME=$(cat /etc/hostname)

HNAME=$(whiptail --title "$TITLE" --inputbox "New hostname:" 16 64 3>&1 1>&2 2>&3)

# Update /etc/hostname file
echo $HNAME > /etc/hostname

# Update /etc/hosts file
sed -i "s/$CUR_HNAME/$HNAME/g" /etc/hosts

# Inform user
# If the new hostname is same as old hostname inform user

if [[ "$CUR_HNAME" == "$HNAME" ]]; then
	whiptail --title "$TITLE" --msgbox "Hostname \"$CUR_HNAME\" remains unchanged" 16 64
else
	whiptail --title "$TITLE" --msgbox "Hostname \"$CUR_HNAME\" changed with \"$HNAME\"" 16 64