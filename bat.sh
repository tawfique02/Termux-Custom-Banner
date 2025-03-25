
#!/usr/bin/bash
# Secure Termux Login Script
# Only for ethical hacking and educational purposes.

bash banner.sh

echo -e "\e[1;32m  Welcome to Secure Termux Login\e[0m"

echo "Initializing Setup..."

# Backup existing configuration files
CONFIG_DIR="$HOME/.config/termux"
mkdir -p "$CONFIG_DIR"
cp /data/data/com.termux/files/usr/etc/bash.bashrc "$CONFIG_DIR/bash.bashrc.bak"
cp /data/data/com.termux/files/usr/etc/motd "$CONFIG_DIR/motd.bak"

echo "Backup created."

echo "Setting up credentials..."
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' username
read -sp $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password
echo
hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')

echo "$username:$hashed_password" > "$CONFIG_DIR/credentials"
chmod 600 "$CONFIG_DIR/credentials"

echo -e "\n\e[1;32m Credentials saved securely.\e[0m"

echo "Updating Termux login system..."
cat <<LOGIN > /data/data/com.termux/files/usr/etc/bash.bashrc
trap '' 2

echo -e "\e[1;32m       
░▒▓█▓▒░      ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓███████▓▒░  
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒▒▓███▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓████████▓▒░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
                                                           
                                                           
\033[31m           ────────────────────────────
\033[33m               Login To \033[32mContinue
\033[31m           ────────────────────────────
\e[0m"

echo
read -p $'       \e[33m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mUSERNAME FOR LOGIN:\033[32m ' input_user
read -s -p $'       \e[32m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mPASSWORD FOR LOGIN:\033[33m ' input_pass
echo

stored_user=\$(cut -d: -f1 "$CONFIG_DIR/credentials")
stored_hash=\$(cut -d: -f2 "$CONFIG_DIR/credentials")

input_hash=\$(echo -n "\$input_pass" | sha256sum | awk '{print $1}')

if [[ "\$input_user" == "\$stored_user" && "\$input_hash" == "\$stored_hash" ]]; then
    sleep 3
    clear
    cd \$HOME
    cd TermuX-Phantom
    python sound_effect.py
    clear
    cd \$HOME 
    echo -e "\033[1m\033[33m
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
███████║███████║██║     █████╔╝ █████╗  ██████╔╝
██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  "
    echo -e "     \e[1m\e[32m▂▃▄▅▆▇▓▒░ \033[1mCoded By \e[33mBYTEPHANTOM \e[1m\e[32m░▒▓▇▆▅▄▃▂"
    cd \$HOME
else
    echo -e "\e[1;31m  You Entered Wrong Details! Exiting...\e[0m"
    sleep 1
    cmatrix -L
    exit 1
fi
trap 2
LOGIN

echo "\033[1m\e[1;32m Your Termux is \033[33mReady \n
       So please \033[31mExit \033[37mand \033[32mLogin.\e[0m"
echo
