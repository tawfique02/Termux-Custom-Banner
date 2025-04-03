#!/bin/bash

# Set the password (change this to your preferred password)
PASSWORD="admin123"

# Function to prompt for the password
authenticate() {
    # Prompt the user to enter a password
    echo -e "\033[1;34m[INFO] Please enter the password to continue:\033[0m"
    read -s -p "Password: " entered_password
    echo  # Move to the next line after input

    # Check if the entered password matches
    if [ "$entered_password" != "$PASSWORD" ]; then
        echo -e "\033[1;31m[ERROR] Incorrect password. Exiting script.\033[0m"
        exit 1  # Exit the script if password is incorrect
    else
        echo -e "\033[1;32m[SUCCESS] Password correct. Proceeding...\033[0m"
    fi
}

# Function to update the repository
update_repository() {
    echo -e "\033[1;34m[INFO] Updating repository..."
    if [ -f "update.sh" ]; then
        bash update.sh
        echo -e "\033[1;32m[SUCCESS] Repository updated successfully!"
    else
        echo -e "\033[1;31m[ERROR] update.sh not found. Skipping repository update."
    fi
}

# Function to install required packages with progress display
install_packages() {
    echo -e "\033[1;33m[INFO] Installing required packages... Please wait."
    echo -e "\033[0;36m────────────────────────────────────────────"
    
    # Update and upgrade packages
    apt update && apt upgrade -y | pv -qL 10

    # Function to check if package is installed
    check_and_install() {
        if ! command -v $1 &>/dev/null; then
            echo -e "\033[1;33m[INFO] Installing $1..."
            pkg install $1 -y | pv -qL 10
        else
            echo -e "\033[1;32m[INFO] $1 is already installed."
        fi
    }

    # Check and install all required packages
    check_and_install python
    check_and_install python2
    check_and_install cmatrix
    check_and_install pv
    check_and_install figlet
    check_and_install ruby
    check_and_install mpv
    check_and_install termux-api
    check_and_install tree
    check_and_install nmap
    check_and_install git
    check_and_install curl
    check_and_install wget
    check_and_install php
    check_and_install python3

    pip install lolcat random requests mechanize | pv -qL 10
    pip2 install bs4 requests | pv -qL 10

    echo -e "\033[1;32m[SUCCESS] Installation completed!"
    echo -e "\033[0;36m────────────────────────────────────────────"
}

# Main script
clear

# Authenticate the user
authenticate

# Install `pv` if not installed already
pkg install pv -y >/dev/null 2>&1

# Start installation process
install_packages

# Prompt user for update
read -p "Do you want to update the repository now? (y/n): " choice
if [ "$choice" = "y" ]; then
    update_repository
else
    echo -e "\033[1;33m[INFO] Skipping repository update."
fi

echo -e "\033[1;32m[INFO] Script execution completed. This script is developed by Md.Tawfique Elahey. If you find any problem, please contact me. And enjoy your setup!"
echo -e "\033[0m"
