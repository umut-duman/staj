#!/usr/bin/bash

read -p "Username: " UNAME

useradd -mU $UNAME

echo "User \"$UNAME\" created"