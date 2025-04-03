#!/bin/bash

# File where the credentials will be stored
CREDS_FILE="$HOME/.user_credentials"

# Function to check if credentials already exist
check_creds() {
    if [[ -f "$CREDS_FILE" ]]; then
        return 0  # Credentials file exists
    else
        return 1  # Credentials file doesn't exist
    fi
}

# Function to create and store credentials
store_creds() {
    # Get Username and Password from the user for login session
    read -p $'\e[1;32mEnter your desired Username:\e[0m ' username
    read -s -p $'\e[1;32mEnter your desired Password:\e[0m ' password
    echo ""

    # Store credentials in a file (secure mode, only accessible to the user)
    echo "$username:$password" > "$CREDS_FILE"
    chmod 600 "$CREDS_FILE"  # Set file permission to be readable/writable only by the user
    echo -e "\n\e[1;32mYour credentials have been saved securely!\e[0m"
}

# Function to check login
login() {
    # Prompt user for username and password
    read -p $'\e[1;32mEnter Username for Login:\e[0m ' input_username
    read -s -p $'\e[1;32mEnter Password for Login:\e[0m ' input_password
    echo ""

    # Read stored credentials from the file
    stored_creds=$(cat "$CREDS_FILE")
    stored_username=$(echo "$stored_creds" | cut -d ':' -f 1)
    stored_password=$(echo "$stored_creds" | cut -d ':' -f 2)

    # Validate the entered username and password
    if [[ "$input_username" == "$stored_username" && "$input_password" == "$stored_password" ]]; then
        echo -e "\n\e[1;32mLogin successful! Welcome, $input_username!\e[0m"
        sleep 2
        clear

        # Display welcome message and custom prompt
        echo -e "\033[1m\033[33m
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
███████║███████║██║     █████╔╝ █████╗  ██████╔╝
██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
"
        echo -e "     \e[1m\e[32m▂▃▄▅▆▇▓▒░ \033[1mCoded By \e[33mBYTEPHANTOM \e[1m\e[32m░▒▓▇▆▅▄▃▂"
        echo -e "   \033[1m\033[33m]\033[31m──────────────────────────────────────\033[33m["
        echo

        # Set custom prompt with username and time
        PS1='\033[1m\[\e[32m\]\033[1m┌─[\[\e[37m\]\T\[\e[32m\]\033[1m]─────\033[1m\e[1;98m\[[\033[1m\033[37m$username\033[32m]\033[1m\e[0;32m\033[1m───[\033[38;5;209m\#\033[32m]\n|\n\033[1m\e[0;32m\033[1m└─[\[\e[32m\]\e[1;33m\W\[\e[1m\033[32m]\033[1m────►\e[1;36m\033[1m '

        # Enable useful shell options
        shopt -s autocd
        shopt -s cdspell
        shopt -s checkhash
        shopt -s checkwinsize
        shopt -s compat31
        shopt -s compat32
        shopt -s compat40
        shopt -s compat41
        shopt -s no_empty_cmd_completion
        shopt -s histverify
        shopt -s histappend
        shopt -s dirspell
        shopt -s direxpand
        shopt -s compat43
        shopt -s compat32
        shopt -s lithist
    else
        echo -e "\e[1;31mYou entered wrong credentials!\e[0m"
        sleep 1
        cmatrix -L  # Display some cool ASCII animation to indicate wrong credentials
        exit 1  # Exit if the login fails
    fi
}

# Check if credentials already exist, if not ask user to create them
if check_creds; then
    echo -e "\e[1;32mCredentials found! Please log in.\e[0m"
    login
else
    echo -e "\e[1;32mNo credentials found! Let's create your credentials.\e[0m"
    store_creds
    login
fi

trap 2
