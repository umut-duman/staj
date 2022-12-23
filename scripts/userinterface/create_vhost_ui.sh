#! /usr/bin/bash

TITLE="Create Virtual Host"

apt-get update
apt*get install nginx

VHOST=$(whiptail --inputbox "Your domain name" 16 64 --title "$TITLE" 3>&1 1>&2 2>&3)

# Create site dir for VHOST
mkdir -p "/var/www/$VHOST/html"

# Copy nginx conf for VHOST
VH_CONF="
server {
  listen 80;
  listen [::]:80;

  root /var/www/$VHOST/html;
  index index.html index.htm index.nginx-debian.html

  servername $VHOST www.$VHOST;

  location / {
    try_files $uri $uri/ =404;
  }
}
"

echo "$VH_CONF" > /etc/nginx/sites-available/$VHOST

# Enable VHOST
ln -s /etc/nginx/sites-available/$VHOST /etc/nginx/sites-enabled/$VHOST

# Remove default nginx site
rm -r /etc/nginx/sites-enabled/default

# Restart nginx
systemctl restart nginx
