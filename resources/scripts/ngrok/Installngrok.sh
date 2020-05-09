#!/bin/sh
#Colors
w='\033[1;0m'
c='\033[1;36m' #CYAN
g='\033[1;32m' #GREEN
r='\033[1;31m' #RED
y='\033[1;33m' #YELLOW
b='\033[1;34m' #BLUE
p='\033[1;35m' #PURPLE
rt='\033[0m'     #RESET

error() {
	printf "${r}[!] ${w}${1}${r}\n"
}

prints() {
	printf "${g}[*] ${w}${1}\n${rt}"
}

#program
  prints "Installing Ngrok... \n"
  sleep 2
  read -p "Do you have authtoken to install ngrok?  Y/N: " opt
if [[ $opt = y || $opt = Y ]]; then
  read -p "Enter your authtoken: " auth
  prints "Downloading Ngrok... \n"
  sleep 2
  cd $HOME
  wget https://HB-Code.github.io/resources/archives/aarch64/ngrok/ngrok-stable-linux-aarch64.tgz -q
  prints "Extracting Ngrok... \n"
  tar -xvf ngrok-stable-linux-aarch64.tgz
  prints "Installing Ngrok... \n"
  sleep 2
  mv ngrok /$PREFIX/bin
  chmod +x /$PREFIX/bin/ngrok
  cd $HOME
  prints "Authenticating... \n"
  ngrok authtoken $auth
  prints "Installation Complete. \n"
  sleep 3
  prints "Now you can run Ngrok."
  prints "Type ngrok help for more information. \n"
  cd $HOME
  rm ngrok-stable-linux-aarch64.tgz
else
  prints "Please visit https://ngrok.com to get your authtoken. \n"
  error "Abort. \n"
  sleep 2
fi
