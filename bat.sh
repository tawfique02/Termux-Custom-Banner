#!/usr/bin/bash
# Secure Termux Login Script
# Only for ethical hacking and educational purposes.

echo "Initializing Secure Login Setup..."

# Backup existing configuration files
CONFIG_DIR="$HOME/.config/termux"
mkdir -p "$CONFIG_DIR"
cp /data/data/com.termux/files/usr/etc/bash.bashrc "$CONFIG_DIR/bash.bashrc.bak"
cp /data/data/com.termux/files/usr/etc/motd "$CONFIG_DIR/motd.bak"

echo "Configuration backup created."

echo "Setting up credentials..."
read -p "Enter new username: " username
read -sp "Enter new password: " password
hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')

# Save credentials securely
echo "$username:$hashed_password" > "$CONFIG_DIR/credentials"
chmod 600 "$CONFIG_DIR/credentials"

echo -e "\nCredentials saved securely."

echo "Updating Termux login system..."
cat <<EOL > /data/data/com.termux/files/usr/etc/bash.bashrc
trap '' 2

read -p "Username: " input_user
read -sp "Password: " input_pass

# Verify credentials
stored_user=\$(cut -d: -f1 "$CONFIG_DIR/credentials")
stored_hash=\$(cut -d: -f2 "$CONFIG_DIR/credentials")

input_hash=\$(echo -n "\$input_pass" | sha256sum | awk '{print $1}')

if [[ "\$input_user" == "\$stored_user" && "\$input_hash" == "\$stored_hash" ]]; then
    echo -e "\nAccess Granted! Welcome \$stored_user."
else
    echo -e "\nAccess Denied! Exiting..."
    exit 1
fi

PS1='\[\e[32m\]Secure-Termux:\[\e[0m\] \w\$ '
EOL

echo "Setup complete. Restart Termux and log in."
exit 0
