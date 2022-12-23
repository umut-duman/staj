#! /usr/bin/bash

DEST="/etc/ssh/sshd_config"

# Update and install openssh-server
apt-get update
apt-get install openssh-server

# Disable password authentication
if (whiptail --title "SSH Configuration" --yesno "Do you want to disable password authentication?" 16 64); then
  sed -i "s/#PasswordAuthentication no/PasswordAuthentication no/g" "$DEST"
  sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" "$DEST"

  whiptail --title "SSH Configuration" --msgbox "Password authentication disabled" 16 64
else
  whiptail --title "SSH Configuration" --msgbox "Password authentication remains active" 16 64
fi

# Disable root login
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" "$DEST"
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" "$DEST"

# Restart sshd
systemctl restart sshd.service
