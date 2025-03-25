
#!/bin/bash
# Only use it for ethical hacking and educational purposes.

# Call the banner.sh script if it exists
bash banner.sh
echo

# User input for username and password
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' username                
read -sp $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password 
echo
echo
read -p $'\033[1m\033[32m  Your \033[0mShell \033[38;5;209mName\033[31m: \033[33m\033[1m ' names

# Remove bash.bashrc if it exists (this step is no longer needed for the rest of the script)
cd /usr/etc || exit
rm -f bash.bashrc  # This removes the bash.bashrc file

# Prompt user for login credentials
read -p $'       \e[33m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mUSERNAME FOR LOGIN:\033[32m ' user
read -sp $'       \e[32m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mPASSWORD FOR LOGIN:\033[33m ' pass                                                

# Check if the username and password match
if [[ $pass == $password && $user == $username ]]; then
    sleep 3
    clear
    cd $HOME
    cd TermuX-Phantom
    python sound_effect.py
    clear
    cd $HOME 
    echo -e "\033[1m\033[33m
    ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
    ███████║███████║██║     █████╔╝ █████╗  ██████╔╝
    ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
    ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
    "
    echo -e  "     \e[1m\e[32m▂▃▄▅▆▇▓▒░ \033[1mCoded By \e[33mBYTEPHANTOM \e[1m\e[32m░▒▓▇▆▅▄▃▂"
    cd $HOME
    echo -e "   \033[1m\033[33m]\033[31m──────────────────────────────────────\033[33m["
    echo 
    PS1='\033[1m\[\e[32m\]\033[1m┌─[\[\e[37m\]\T\[\e[32m\]\033[1m]─────\033[1m\e[1;98m\[[\033[1m\033[37m$names\033[32m]\033[1m\e[0;32m\033[1m───[\033[38;5;209m\#\033[32m]\n|\n\033[1m\e[0;32m\033[1m└─[\[\e[32m\]\e[1;33m\W\[\e[1m\033[32m]\033[1m────►\e[1;36m\033[1m '
    
    # Optional commands for a better shell experience
    << comment
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
    comment

else
    echo ""
    echo -e "\e[1;31m  You Entered wrong Details! \e[0m"
    sleep 1
    cmatrix -L
fi

# Trap and reset shell
trap 2
LOGIN
echo
echo
echo -e "\033[1m\e[1;32m Your Termux is \033[33mReady \n       So please \033[31mExit \033[37mand \033[32mLogin.\e[0m"
echo
echo
