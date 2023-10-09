#!/bin/sh
#This script finds connections with the IPs listed in IPs and prints the PID and process name when the connection is found

IPs=("<ip1>" "<ip2>" "<ip3>")

while true; do
  for ip in "${IPs[@]}"; do
    netstat -anp | grep "${ip}" | grep -E "ESTABLISHED|SYN_SENT" | awk -v OFS=" " '{print $5, $7}' | while read -r ip_address pid_info; do
      pid="${pid_info%/*}"
      executable_path=$(readlink -f /proc/"${pid}"/exe)
      echo "Connection detected to ${ip_address} with PID: ${pid} (Executable: ${executable_path})"
    done
  done
  sleep 0.1
done
