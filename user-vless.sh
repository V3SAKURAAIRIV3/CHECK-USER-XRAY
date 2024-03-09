#!/bin/bash
clear
MYIP=$(wget -qO- ipv4.icanhazip.com);
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e " ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}                 ${GREEN}CEK DETAIL VLESS ACCOUNT${NC}                ${sian}│${NC}
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
 ${sian}│${NC}                 ${GREEN}CEK DETAIL VLESS ACCOUNT${NC}                ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}
 ${sian}│${NC}   ${yellow}NO${NC}      ${yellow}User${NC}     ${yellow}Expired${NC}    ${yellow}IP${NC}                        ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}"
grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3,5 | column -t | sort | uniq | nl -s ') '
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
user=$(grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq | sed -n "${CLIENT_NUMBER}"p)
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[44;1;39m        Vless Account        \E[0m" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Remarks        : ${user}" | tee -a /etc/log-create-user.log
echo -e "Domain         : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Wildcard       : (bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "Port TLS       : 443" | tee -a /etc/log-create-user.log
echo -e "Port none TLS  : 80" | tee -a /etc/log-create-user.log
echo -e "Port gRPC      : 443" | tee -a /etc/log-create-user.log
echo -e "id             : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Encryption     : none" | tee -a /etc/log-create-user.log
echo -e "Network        : ws" | tee -a /etc/log-create-user.log
echo -e "Path           : /vless" | tee -a /etc/log-create-user.log
echo -e "Path           : vless-grpc" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link TLS       : ${vlesslink1}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link none TLS  : ${vlesslink2}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link gRPC      : ${vlesslink3}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on Vless"
m-vless
