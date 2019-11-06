#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
echo -e "${YELLOW}Routing LAN IPs via local network ethernet card...${NC}"
#fetching IP Address...you can change the regex according to the IP you should be having from the network
IPADD=$(ifconfig | grep -m 1 -o "10.2.3.[0-9]*  " | sed -e 's/[[:space:]]*$//')
echo -e "IP Address for Local Network:" ${CYAN} ${IPADD}${RED}
if [ -z $IPADD ]; then
	echo "Local IP not found!"
	exit 2
fi
#Server 1
sudo ip route add 192.168.10.33 via ${IPADD}
#Server 2
sudo ip route add 192.168.10.34 via ${IPADD}
#add up any number of servers