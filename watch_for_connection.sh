#!/bin/sh
#This script watches netstat and waits for a connection to be established with the IPs listed in IPs

IPs=("<ip1>" "<ip2>" "<ip3>")

while true; do  
	for ip in "${IPs[@]}"; do    
		netstat -an | grep "${ip}" | grep -E "ESTABLISHED|SYN_SENT" && echo "Connection detected to ${ip}"  
	done  
	sleep 0.1
done
