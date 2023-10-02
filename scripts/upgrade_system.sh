#!/bin/bash

# Update package list
sudo apt update

# Upgrade packages
sudo apt upgrade -y

# Remove unnecessary packages
sudo apt autoremove -y

# Optionally, you can also remove the package cache in /var/cache/apt/archives
# sudo apt autoclean

echo "System updated and cleaned."

