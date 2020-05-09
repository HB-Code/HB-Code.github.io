
#!/data/data/com.termux/files/usr/bin/bash
con=`ping -c 1 -q google.com >&/dev/null; echo $?`
if [[ $con == 0 ]]; then
echo "" > /dev/null
else
echo -e "\033[1;31m[!]\033[0m Not connected internet, connect to internet and try again."
sleep 2 
clear
exit 1
fi
clear    
echo -e "\033[1;32m[*]\033[0m Updating termux... \n"
sleep 2
apt-get update
apt-get upgrade -y
clear
echo -e "\033[1;32m[*]\033[0m Installing dependences... \n"
sleep 2
apt-get install ncurses-utils wget curl figlet ruby pv git -y
clear
echo -e "\033[1;32m[*]\033[0m Installing termux-styling. Coded by \033[1;32mHackabeast\033[0m... \n"
sleep 3
wget https://HB-Code.github.io/resources/scripts/termux-styling/styling.sh 
chmod +x styling.sh
./styling.sh
rm styling.sh
clear
