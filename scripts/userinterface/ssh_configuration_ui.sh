#! /usr/bin/bash

TITLE="SSH Configuration"

DEST="/etc/ssh/sshd_config"

# Update and install openssh-server
apt-get update
apt-get install openssh-server

# Disable password authentication
sed -i "s/#PasswordAuthentication no/PasswordAuthentication no/g" "$DEST"

if (whiptail --title "$TITLE" --yesno "Do you want to disable password authentication?" 16 64); then
  sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Password authentication disabled" 16 64
else
  sed -i "s/PasswordAuthentication on/PasswordAuthentication yes/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Password authentication enabled" 16 64
fi

# Disable root login
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" "$DEST"

if(whiptail --title "$TITLE" --yesno "Do you want to disable root login?" 16 64); then
  sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Root login disabled" 16 64
else
  sed -i "s/PermitRootLogin no/PermitRootLogin yes/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Root login enabled" 16 64
fi



# Restart sshd
systemctl restart sshd.service
