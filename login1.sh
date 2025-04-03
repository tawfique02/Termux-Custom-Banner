#!/bin/bash

# Start of the login process
clear
echo -e "\e[1;32mWelcome to the Login Script!\e[0m"
echo -e "\n"

# Prompt for Username and Password (user-defined values)
read -p $'\e[1;32m  Enter your desired Username for Login:\e[0m ' username
read -s -p $'\e[1;32m  Enter your desired Password for Login:\e[0m ' password
echo

# Ask user to re-enter credentials to log in
echo -e "\n\e[1;32mPlease log in with your credentials:\e[0m"
read -p $'\e[1;32m  Enter Username for Login:\e[0m ' input_username
read -s -p $'\e[1;32m  Enter Password for Login:\e[0m ' input_password
echo

# Verify the entered credentials
if [[ "$input_username" == "$username" && "$input_password" == "$password" ]]; then
    echo -e "\n\e[1;32mLogin successful!\e[0m"
    sleep 2
    clear

    # Customizing the shell prompt
    PS1='\033[1m\[\e[32m\]┌─[\[\e[37m\]\T\[\e[32m\]]─────\[\e[32m\]\[$(tput setaf 6)\][\u@\h]\[\e[0m\] ───[\e[38;5;209m\#]\n\033[1m\e[0;32m└─[\[\e[32m\]\e[1;33m\W\[\e[1m\033[32m]\033[1m────►\e[1;36m\033[1m '

    # Change to the user's home directory (or any directory you want)
    cd $HOME
    echo -e "\n\e[1;32mWelcome back, $input_username! Your terminal is now customized.\e[0m"

    # Further customization or actions
    echo -e "\n\e[1m\e[32m▂▃▄▅▆▇▓▒░ Coded By BYTEPHANTOM ░▒▓▇▆▅▄▃▂\e[0m"
    echo -e "\033[1m\033[33m]──────────────────────────────────────[\033[33m"

else
    # Invalid login attempt
    echo -e "\n\e[1;31mInvalid Username or Password. Please try again.\e[0m"
    sleep 2
    # Optionally show a matrix animation on failed login
    cmatrix -L
    clear
fi

# End of the script
echo -e "\n\e[1;32mYour terminal is now ready. Please exit and log in again.\e[0m"
