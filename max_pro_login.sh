#!/usr/bin/bash
# Use this script for ethical hacking and educational purposes only.
#Don,t try to copy my script. It,s unethical.
# Load banner
bash banner.sh
echo

# Admin credentials (stored in plain text)
admin_user="admin"
admin_pass="admin"

# Secret credentials to protect against unauthorized changes
secret_user="secret_admin"
secret_pass="secret_password"

# User credentials file (stored in Termux home directory)
cred_file="$HOME/.user_credentials"

# Check if credentials exist; if not, prompt user to set them
if [[ ! -f "$cred_file" ]]; then
    echo -e "\e[1;33m🚀 First-Time Setup! Create Your Username & Password:\e[0m"
    read -p $'\e[32mEnter New Username: \e[0m' new_user
    read -s -p $'\e[32mEnter New Password: \e[0m' new_pass
    echo "$new_user:$new_pass" > "$cred_file"
    echo -e "\n\e[1;32m✔ Your account has been created successfully! Please restart Termux.\e[0m"
    exit
fi

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
echo

# Admin Login Check
if [[ "\$user" == "$admin_user" && "\$pass" == "$admin_pass" ]]; then
    clear
    echo -e "\e[1;32m✔ Admin Access Granted! Welcome, Admin(TE).\e[0m"
    while true; do
        echo -e "\n\e[36mAdmin Menu:\e[0m"
        echo -e "\e[33m1. View User Credentials\e[0m"
        echo -e "\e[33m2. Change User Credentials\e[0m"
        echo -e "\e[33m3. Bypass Login\e[0m"
        echo -e "\e[33m4. Exit\e[0m"
        read -p $'\n\e[32mSelect an option (1-4): \e[0m' option

        case \$option in
            1) echo -e "\e[31m[!] Stored User Credentials:\e[0m" && cat "$cred_file";;
            2) 
                read -p $'\e[33mEnter New Username: \e[0m' new_user
                read -s -p $'\e[33mEnter New Password: \e[0m' new_pass
                echo "\$new_user:\$new_pass" > "$cred_file"
                echo -e "\n\e[32m✔ User Credentials Updated Successfully!\e[0m";;
            3) 
                echo -e "\e[32m✔ Bypassing Login...\e[0m"
                sleep 2
                break;;
            4) exit;;
            *) echo -e "\e[31mInvalid Option! Try Again.\e[0m";;
        esac
    done
fi

# Secret Protection
if [[ "\$user" == "$secret_user" && "\$pass" == "$secret_pass" ]]; then
    echo -e "\e[1;31m🚨 Warning! Unauthorized Attempt to Modify System Files Detected! 🚨\e[0m"
    sleep 3
    exit
fi

# Load stored user credentials
stored_user=\$(cut -d: -f1 "$cred_file")
stored_pass=\$(cut -d: -f2 "$cred_file")

# User Login Check
if [[ "\$user" == "\$stored_user" && "\$pass" == "\$stored_pass" ]]; then
    sleep 2
    clear
    cd \$HOME
    cd TermuX-Phantom
    python sound_effect.py
    clear
    echo -e "\e[32m✔ Login Successful! Welcome, \e[33m\$stored_user\e[32m!\e[0m"
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
