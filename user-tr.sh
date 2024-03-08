#!/bin/bash
clear
MYIP=$(wget -qO- ipv4.icanhazip.com);
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e " ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}                ${GREEN}CEK DETAIL TROJAN ACCOUNT${NC}                ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}

     • You have no existing clients!

 ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}                     ${GREEN}CHECK USER CONFIG${NC}                   ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "  Press any key to back on menu"
    menu
fi

clear
echo -e " ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}                ${GREEN}CEK DETAIL TROJAN ACCOUNT${NC}                ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}
 ${sian}│${NC}   ${yellow}NO${NC}      ${yellow}User${NC}     ${yellow}Expired${NC}    ${yellow}IP${NC}                        ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}"
grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3,5 | column -t | sort | uniq | nl -s ') '
echo ""
echo -e "  • [NOTE] Tekan CTRL+C to Cancel"
echo -e " ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}                     ${GREEN}CHECK USER CONFIG${NC}                   ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}"
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
        read -rp "Select one client [1]: " CLIENT_NUMBER
    else
        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
done
domain=$(cat /etc/xray/domain)
user=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq | sed -n "${CLIENT_NUMBER}"p)
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@isi_bug_disini:80?path=%2Ftrojan-ws&security=none&host=${domain}&type=ws#${user}"
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[0;41;36m           TROJAN ACCOUNT           \E[0m" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Remarks        : ${user}" | tee -a /etc/log-create-user.log
echo -e "Host/IP        : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Wildcard       : (bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "Port TLS       : 443" | tee -a /etc/log-create-user.log
echo -e "Port none TLS  : 80" | tee -a /etc/log-create-user.log
echo -e "Port gRPC      : 443" | tee -a /etc/log-create-user.log
echo -e "Key            : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Path           : /trojan-ws" | tee -a /etc/log-create-user.log
echo -e "ServiceName    : trojan-grpc" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link TLS       : ${trojanlink}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link none TLS  : ${trojanlink2}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link gRPC      : ${trojanlink1}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on Trojan"
m-trojan