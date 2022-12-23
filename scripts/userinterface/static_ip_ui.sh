#! /usr/bin/bash

TITLE="Configure Static IP"

DEST="/etc/network/interfaces"

IFACE=$(whiptail --title "$TITLE" --inputbox "Interface" 16 64 3>&1 1>&2 2>&3)
IP_ADDR=$(whiptail --title "$TITLE" --inputbox "IP Address" 16 64 3>&1 1>&2 2>&3)
NETMASK=$(whiptail --title "$TITLE" --inputbox "Netmask" 16 64 3>&1 1>&2 2>&3)
GATEWAY=$(whiptail --title "$TITLE" --inputbox "Gateway" 16 64 3>&1 1>&2 2>&3)

# Disable dhcp
sed -i "s/iface $IFACE inet dhcp//g" "$DEST"

# Set iface config for static ip
echo "" >> $DEST
echo "iface $IFACE inet static" >> $DEST
echo "  address $IP_ADDR" >> $DEST
echo "  netmask $NETMASK" >> $DEST
echo "  gateway $GATEWAY" >> $DEST

# Restart network
systemctl restart networking.service