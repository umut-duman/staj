#!/usr/bin/bash

HNAME="client"
CUR_HNAME="old"

# Update /etc/hostname file
echo $HNAME > /etc/hostname

# Update /etc/hosts file
sed -i "s/$CUR_HNAME/$HNAME/g" /etc/hosts

