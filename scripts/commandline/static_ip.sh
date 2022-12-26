#! /usr/bin/bash



IPDEST="/etc/network/interfaces"

# Read necessary data from user
read -p "interface: " IFACE
read -p "ip address: " IP_ADDR
read -p "netmask: " NETMASK
read -p "gateway: " GATEWAY

# Disable dhcp
sed -i "s/iface $IFACE inet dhcp//g" "$IPDEST"

# Set iface config for static ip
echo "" >> $IPDEST
echo "iface $IFACE inet static" >> $IPDEST
echo "  address $IP_ADDR" >> $IPDEST
echo "  netmask $NETMASK" >> $IPDEST
echo "  gateway $GATEWAY" >> $IPDEST

# Restart network
systemctl restart networking.service