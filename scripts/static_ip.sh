#! /usr/bin/bash

DEST="/etc/network/interfaces"

IFACE="ens192"
IP_ADDR="172.16.102.146"
NETMASK="255.255.254.0"
GATEWAY="172.16.102.1"

# Disable dhcp
sed -i "s/iface $IFACE inet dhcp//g" "$DEST"

# Set iface config for static ip
echo "" >> $DEST
echo "iface $IFACE inet static" >> $DEST
echo "  address $IP_ADDR" >> $DEST
echo "  netmask $NETMASK" >> $DEST
echo "  gateway $GATEWAY" >> $DEST
