#! /usr/bin/bash

DEST="/etc/ssh/sshd_config"

# Update and install openssh-server
apt-get update
apt-get install openssh-server

# Disable password authentication
sed -i "s/#PasswordAuthentication no/PasswordAuthentication no/g" "$DEST"
sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" "$DEST"

# Disable root login
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" "$DEST"
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" "$DEST"

# Restart sshd
systemctl restart sshd.service
