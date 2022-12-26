#! /usr/bin/bash

source config_script.shlib

read_yesno() {
while true; do
read -p "$1" r_yn

case "$r_yn" in
	yes ) true; return;;
	no ) false; return;;
	* ) echo "Invalid option (yes/no)?"
esac
done
}

while [ -n "$1" ]; do
	case "$1" in
        -h | --help | h )
            Help
            exit
            ;;
     	-* | * )
			echo "ERROR Unknown parameter"
            exit
                ;;
    esac
done

if read_yesno "Do you want to change the hostname of this computer? (yes/no): "; then
	echo "Changing hostname..."

	changehostname
else
	echo "Hostname remains the same"
fi

if read_yesno "Do you want to create a new user? (yes/no): "; then
	echo "Creating a new user..."

	createuser
else
	echo "Did not create a new user"
fi

if read_yesno "Do you want to install and configure openssh-server? (yes/no): "; then
	echo "Installing and configuring openssh-server..."

	configssh
else
	echo "openssh-server configuration skipped"
fi

if read_yesno "Do you want to configure a static ip for this computer? (yes/no): "; then
	echo "Configuring static ip..."

	staticip
else
	echo "static ip configuration skipped"
fi

if read_yesno "Do you want to install nginx and create a virtual host? (yes/no): "; then
	echo "Installing nginx and creating vhost..."

	nginxvhost
else
	echo "Did not install nginx or created a vhost"
fi