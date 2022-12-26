#! /usr/bin/bash

SSHDEST="/etc/ssh/sshd_config"

# Update and install openssh-server
apt-get update
apt-get install openssh-server

# Ask and accordingly disable password authentication
sed -i "s/#PasswordAuthentication no/PasswordAuthentication no/g" "$SSHDEST"

read -p "Do you want to disable password authentication? (yes/no): " yn1
if [ $yn1 == "yes" ]; then
    sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" "$SSHDEST"

    echo "Password authentication disabled"
else
    sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" "$SSHDEST"

    echo "Password authentication enabled"
fi

# Ask and accordingly disable root login
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" "$SSHDEST"

read -p "Do you want to disable root login? (yes/no): " yn2
if [ $yn2 == "yes" ]; then
    sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" "$SSHDEST"

    echo "Root login disabled"
else
    sed -i "s/PermitRootLogin no/PermitRootLogin yes/g" "$SSHDEST"

    echo "Root login enabled"
fi

# Check and see if .ssh exists and ask to create it if it is not
if [ ! -d "$HOME/.ssh" ]; then
    read -p "$HOME/.ssh does not exist. Do you want to create it? (yes/no): " yn3
    if [ $yn3 == "yes" ]; then
        mkdir $HOME/.ssh
        touch $HOME/.ssh/id_rsa
        touch $HOME/.ssh/id_rsa.pub

        echo "Created the directory $HOME/.ssh"
    else
        echo "Did not create directory $HOME/.ssh"
    fi
fi    

# Restart sshd
systemctl restart sshd.service
