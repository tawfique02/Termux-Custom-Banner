#!/bin/bash

# Credentials storage file
CRED_FILE="$HOME/.termux_login"

# Function to hash password
hash_password() {
    echo -n "$1" | sha256sum | awk '{print $1}'
}

# If credentials file does not exist, ask for new credentials
if [ ! -f "$CRED_FILE" ]; then
    echo "No credentials found. Set up a new username and password."
    read -p "New Username: " username
    read -sp "New Password: " password
    echo
    hashed_password=$(hash_password "$password")

    # Save credentials securely
    echo "$username:$hashed_password" > "$CRED_FILE"
    chmod 600 "$CRED_FILE"  # Restrict file permissions
    echo "Credentials saved successfully."
else
    # Prompt for login
    echo "Enter login credentials to access Termux."
    read -p "Username: " username
    read -sp "Password: " password
    echo

    # Read stored credentials
    stored_username=$(cut -d':' -f1 "$CRED_FILE")
    stored_hashed_password=$(cut -d':' -f2 "$CRED_FILE")
    input_hashed_password=$(hash_password "$password")

    # Validate credentials
    if [[ "$username" == "$stored_username" && "$input_hashed_password" == "$stored_hashed_password" ]]; then
        echo "Login successful!"
    else
        echo "Invalid credentials! Closing Termux..."
        exit
    fi
fi
