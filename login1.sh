#!/bin/bash

# Set a default username (you can change this)
username="yourUsername"

# Start of the login process
clear
echo -e "\e[1;32mWelcome to the Login Script!\e[0m"
echo -e "\n"

# Prompt for the password to set (you can enter your desired password here)
read -s -p $'\e[1;32m  Enter your password to set:\e[0m ' password
echo

# Store password securely (for educational purposes - consider a secure method in real use)
password_hash=$(echo -n "$password" | sha256sum | awk '{print $1}')

# Request for Username and Password during login
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' input_username
read -s -p $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' input_password
echo

# Hash the input password
input_password_hash=$(echo -n "$input_password" | sha256sum | awk '{print $1}')

# Validate credentials (check username and password hash)
if [[ "$input_username" == "$username" && "$input_password_hash" == "$password_hash" ]]; then
    echo -e "\n\e[1;32mLogin successful!\e[0m"
    sleep 2
    clear

    # Customizing the shell prompt
    PS1='\033[1m\[\e[32m\]┌─[\[\e[37m\]\T\[\e[32m\]]─────\[\e[32m\]\[$(tput setaf 6)\][\u@\h]\[\e[0m\] ───[\e[38;5;209m\#]\n\033[1m\e[0;32m└─[\[\e[32m\]\e[1;33m\W\[\e[1m\033[32m]\033[1m────►\e[1;36m\033[1m '

    # Change to a specific directory (adjust as needed)
    cd $HOME
    echo -e "\n\e[1;32mWelcome back, $input_username! Your terminal is now customized.\e[0m"

    # Further customization and actions
    echo -e "\n\e[1m\e[32m▂▃▄▅▆▇▓▒░ Coded By BYTEPHANTOM ░▒▓▇▆▅▄▃▂\e[0m"
    echo -e "\033[1m\033[33m]──────────────────────────────────────[\033[33m"

else
    # Invalid login attempt
    echo -e "\n\e[1;31mInvalid Username or Password. Please try again.\e[0m"
    sleep 2
    # Optionally display something like a visual matrix or animation
    cmatrix -L
    clear
fi

# Example of customizing .bashrc with your preferred settings (safe to do)
# Check if the .bashrc exists and modify it if necessary, but avoid deleting files
BASHRC="$HOME/.bashrc"
if [[ -f "$BASHRC" ]]; then
    echo -e "\n\e[1;32mCustomizing your .bashrc...\e[0m"
    echo -e "\n# Custom prompt\nPS1='\033[1m\[\e[32m\]┌─[\[\e[37m\]\T\[\e[32m\]]─────\[\e[32m\]\[$(tput setaf 6)\][\u@\h]\[\e[0m\] ───[\e[38;5;209m\#]\n\033[1m\e[0;32m└─[\[\e[32m\]\e[1;33m\W\[\e[1m\033[32m]\033[1m────►\e[1;36m\033[1m '" >> "$BASHRC"
else
    echo -e "\n\e[1;31mError: .bashrc file not found. Skipping customizations.\e[0m"
fi

# End of the script
echo -e "\n\e[1;32mYour terminal is now ready. Please exit and log in again.\e[0m"
