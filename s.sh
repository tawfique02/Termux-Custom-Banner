#!/bin/bash

# Clear the terminal screen to start fresh
clear

# ASCII art and login prompt
echo -e "\e[1;32m       ░▒▓█▓▒░      ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓███████▓▒░"
echo -e "\e[1;32m       ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo -e "\e[1;32m       ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo -e "\e[1;32m       ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒▒▓███▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo -e "\e[1;32m       ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░"
echo -e "\e[1;32m       ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░"
echo -e "\e[1;32m       ░▒▓████████▓▒░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"

echo -e "\033[31m           ────────────────────────────"
echo -e "\033[33m               Login To \033[32mContinue"
echo -e "\033[31m           ────────────────────────────"

# Get Username and Password from the user for login session
read -p $'\e[1;32mEnter your desired Username:\e[0m ' username
read -s -p $'\e[1;32mEnter your desired Password:\e[0m ' password
echo ""

# Confirm username and password by asking again for login
echo -e "\n\e[1;32mPlease log in with the credentials you just created.\e[0m"
read -p $'\e[1;32mEnter Username for Login:\e[0m ' input_username
read -s -p $'\e[1;32mEnter Password for Login:\e[0m ' input_password
echo ""

# Validate the username and password entered
if [[ "$input_username" == "$username" && "$input_password" == "$password" ]]; then
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
trap 2
