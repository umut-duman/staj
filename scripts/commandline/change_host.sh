#!/usr/bin/bash



CUR_HNAME=$(cat /etc/hostname)

read -p "New Hostname: " HNAME

# Update /etc/hostname file
echo $HNAME > /etc/hostname

# Update /etc/hosts file
sed -i "s/$CUR_HNAME/$HNAME/g" /etc/hosts

# Inform user
# If the new hostname is same as old hostname inform user

if [[ "$CUR_HNAME" == "$HNAME" ]]; then
	echo "Hostname \"$CUR_HNAME\" remains unchanged"
else
	echo "Hostname \"$CUR_HNAME\" changed with \"$HNAME\""
fi