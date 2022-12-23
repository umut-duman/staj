#!/usr/bin/bash

TITLE="Create new user"

#UNAME=duman
UNAME=$(whiptail --title $TITLE --inputbox "New user name" 16 64 3>&1 1>&2 2>&3)

useradd -mU $UNAME

whiptail --title "$TITLE" --msgbox "User \"$UNAME\" created" 16 64
