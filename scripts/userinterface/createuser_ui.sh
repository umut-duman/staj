#!/usr/bin/bash

#UNAME=duman
UNAME=$(whiptail --title "Create new user" --inputbox "New user name" 16 64 3>&1 1>&2 2>&3))

useradd -mU $UNAME
