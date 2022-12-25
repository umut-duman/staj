#! /usr/bin/bash



DEST="/etc/network/interfaces"

# Read necessary data from user
read -p "interface: " IFACE
read -p "ip address: " IP_ADDR
read -p "netmask: " NETMASK
read -p "gateway: " GATEWAY

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