#!/usr/bin/bash
# Use this script for ethical hacking and educational purposes only.

# Load banner
bash banner.sh
echo

# Securely store user credentials
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' username                
read -s -p $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password 
hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}') # Hash the password
echo

# Securely store admin credentials
read -p $'\e[1;32m  Enter \033[31mAdmin Username:\e[0m ' admin_user
read -s -p $'\e[1;32m  Enter \033[31mAdmin Password:\e[0m ' admin_pass
admin_hashed_password=$(echo -n "$admin_pass" | sha256sum | awk '{print $1}')
echo

# Get Shell Name
read -p $'\033[1m\033[32m  Your \033[0mShell \033[38;5;209mName\033[31m: \033[33m\033[1m ' names
cd
cd usr/etc

# Backup existing bash.bashrc
cp bash.bashrc bash.bashrc.bak

# Replace with new login system
cat <<LOGIN > bash.bashrc
trap '' 2
clear
echo -e "\e[1;32m
██████╗ ██╗   ██╗████████╗███████╗██████╗ 
██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔══██╗
██████╔╝██║   ██║   ██║   █████╗  ██████╔╝
██╔═══╝ ██║   ██║   ██║   ██╔══╝  ██╔══██╗
██║     ╚██████╔╝   ██║   ███████╗██║  ██║
╚═╝      ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝
\e[0m"

echo -e "\e[33m────────── LOGIN TO CONTINUE ──────────\e[0m"
echo

read -p $'\e[33m\033[1m[+]\033[37m Enter Username: \033[32m' user
read -s -p $'\e[33m\033[1m[+]\033[37m Enter Password: \033[33m' pass
entered_hash=\$(echo -n "\$pass" | sha256sum | awk '{print \$1}')

# Admin Login Check
if [[ "\$user" == "$admin_user" && "\$entered_hash" == "$admin_hashed_password" ]]; then
    clear
    echo -e "\e[1;32m✔ Admin Access Granted! Welcome, Admin.\e[0m"
    while true; do
        echo -e "\n\e[36mAdmin Menu:\e[0m"
        echo -e "\e[33m1. View User Password\e[0m"
        echo -e "\e[33m2. Change User Password\e[0m"
        echo -e "\e[33m3. Bypass Login\e[0m"
        echo -e "\e[33m4. Exit\e[0m"
        read -p $'\n\e[32mSelect an option (1-4): \e[0m' option

        case \$option in
            1) echo -e "\e[31m[!] User Password Hash: $hashed_password\e[0m";;
            2) 
                read -s -p $'\e[33mEnter New User Password: \e[0m' new_pass
                hashed_password=\$(echo -n "\$new_pass" | sha256sum | awk '{print \$1}')
                echo -e "\n\e[32m✔ User Password Changed Successfully!\e[0m";;
            3) 
                echo -e "\e[32m✔ Bypassing Login...\e[0m"
                sleep 2
                break;;
            4) exit;;
            *) echo -e "\e[31mInvalid Option! Try Again.\e[0m";;
        esac
    done
fi

# User Login Check
if [[ "\$entered_hash" == "$hashed_password" && "\$user" == "$username" ]]; then
    sleep 2
    clear
    cd \$HOME
    cd TermuX-Phantom
    python sound_effect.py
    clear
    echo -e "\e[32m✔ Login Successful! Welcome, \e[33m$names\e[32m!\e[0m"
    echo -e "\e[36m──────────────────────────────────────\e[0m"
else
    echo -e "\e[1;31m❌ Incorrect Username or Password!\e[0m"
    sleep 2
    exit
fi

# Fancy Shell Prompt
PS1='\[\e[32m\]\u\[\e[33m\]@\[\e[36m\]\h\[\e[31m\] ~ \[\e[35m\]\W\[\e[0m\]\$ '

LOGIN

echo -e "\n\033[1m\033[32m Your Termux is Ready! Please Exit and Login Again. \e[0m"
