#! /usr/bin/bash

TITLE="SSH Configuration"

DEST="/etc/ssh/sshd_config"

# Update and install openssh-server
apt-get update
apt-get install openssh-server

# Ask and accordingly disable password authentication
sed -i "s/#PasswordAuthentication no/PasswordAuthentication no/g" "$DEST"

if (whiptail --title "$TITLE" --yesno "Do you want to disable password authentication?" 16 64); then
  sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Password authentication disabled" 16 64
else
  sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Password authentication enabled" 16 64
fi

# Ask and accordingly disable root login
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" "$DEST"

if (whiptail --title "$TITLE" --yesno "Do you want to disable root login?" 16 64); then
  sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Root login disabled" 16 64
else
  sed -i "s/PermitRootLogin no/PermitRootLogin yes/g" "$DEST"

  whiptail --title "$TITLE" --msgbox "Root login enabled" 16 64
fi


# Check and see if .ssh exists and ask to create if it is not
if [ ! -d "$HOME/.ssh" ]; then
  if (whiptail --title "$TITLE" --yesno "$HOME/.ssh does not exist. Do you want to create it?" 16 64); then
    mkdir $HOME/.ssh
    touch $HOME/.ssh/id_rsa
    touch $HOME/.ssh/id_rsa.pub

    whiptail --title "$TITLE" --msgbox "Created the directory $HOME/.ssh" 16 64
  else
    whiptail --title "$TITLE" --msgbox "Did not create directory $HOME/.ssh" 16 64
  fi
fi

# Restart sshd
systemctl restart sshd.service
