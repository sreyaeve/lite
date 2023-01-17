#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/sreyaeve/lite/main/permission/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/sreyaeve/lite/main/permission/ip | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/sreyaeve/lite/main/permission/ip | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		Exp2="\033[1;31mExpired\033[0m"
        else
        Exp2=$(curl -sS https://raw.githubusercontent.com/sreyaeve/lite/main/permission/ip | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/sreyaeve/lite/main/permission/ip | grep $MYIP | awk '{print $2}')

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# / letssgoooo

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="Bhoikfostyahya"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )
export ISP=$(curl -s ipinfo.io/org/ )


# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
 status_nginx="${GREEN}ON${NC}"
else
 status_nginx="${RED}OFF${NC}"
fi
clear
clear
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m             ⇱ INFORMASI VPS ⇲                                   \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e "□ 🔰\e[32;1mSever Uptime\e[0m      : $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "□ 🔰\e[32;1mCurrent Time\e[0m      : $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "□ 🔰\e[32;1mOperating System\e[0m  : $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "□ 🔰\e[32;1mCurrent Domain\e[0m    : $( cat /etc/xray/domain )"
echo -e "□ 🔰\e[32;1mCurrent Isp Name\e[0m  : $ISP"
echo -e "□ 🔰\e[32;1mServer IP\e[0m         : ${IP}"
echo -e "□ 🔰\e[32;1mTime Reboot VPS\e[0m   : 00:00 ( Jam 12 Malam )"
echo -e "□ 🔰\e[33mExpired\E[0m             : $Exp2"
echo -e "□ 🔰\e[32;1mScript Premium By\e[0m : ZenHost"

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m             ⇱ STATUS LAYANAN ⇲                                  \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "       >>>  [ ${GREEN}SERVER XRAY VPN${NC} : ${status_nginx} ]  <<<"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ MENU LAYANAN ⇲                                   \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${RED} • ${NC}Membuat Akun Trojan  $NC"
echo -e " [${GREEN}02${NC}]${RED} • ${NC}Menghapus Akun Trojan $NC"  
echo -e " [${GREEN}03${NC}]${RED} • ${NC}Merenew Akun Trojan$NC"  
echo -e " [${GREEN}04${NC}]${RED} • ${NC}Cek Akun Trojan$NC"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " [${GREEN}05${NC}]${RED} • ${NC}Membuat Akun vless $NC"  
echo -e " [${GREEN}06${NC}]${RED} • ${NC}Menghapus Akun vless $NC"
echo -e " [${GREEN}07${NC}]${RED} • ${NC}Merenew Akun vless $NC"
echo -e " [${GREEN}08${NC}]${RED} • ${NC}Cek Akun vless $NC"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " [${GREEN}09${NC}]${RED} • ${NC}Membuat akun vmess $NC"
echo -e " [${GREEN}10${NC}]${RED} • ${NC}Menghapus akun vmess $NC"
echo -e " [${GREEN}11${NC}]${RED} • ${NC}Merenew Akun vmess $NC"
echo -e " [${GREEN}12${NC}]${RED} • ${NC}Cek Akun vmess $NC"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " [${GREEN}13${NC}]${RED} • ${NC}Test kecepatan server $NC"
echo -e " [${GREEN}14${NC}]${RED} • ${NC}Reboot server $NC"
echo -e ""
echo -e " ${RED}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ XRAY-VPN OFFICIAL ⇲                              \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e ""

read -p "Select From Options [ 1 - 14 ] : " menu
case $menu in
1)
clear
add-tr
;;
2)
clear
del-tr
;;
3)
clear
renew-tr
;;
4)
clear
cek-tr
;;
5)
clear
add-vless
;;
6)
clear
del-vless
;;
7)
clear
renew-vless
;;
8)
clear
cek-vless
;;
9)
clear
add-ws
;;
10)
clear
del-ws
;;
11)
clear
renew-ws
;;
12)
clear
cek-ws
;;
13)
clear
speedtest
;;
14)
reboot
exit
;;
*)
clear
menu
;;
esac

