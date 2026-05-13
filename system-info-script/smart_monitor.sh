#!/bin/bash


server=$(hostname)
os_info=$(cat /etc/os-release | grep -i "24")
server_cpu=$(top | awk 'NR==7, NR==8'
cpu_load=$(top | awk 'NR==7 , NR==8' | cut -d ' ' -f10)

echo "[INFO]"
echo "=================="
echo 
echo "SERVER: $server"
echo "$os_info"
echo
if [ "$cpu_load" -gt 50 ]; then
	echo "Monitoring CPU, Please wait...."
	sleep 5
	echo "WARNING: High CPU load"
else
	echo "Monitoring CPU, Please wait...."
	sleep 5
	echo "Cpu load is normal"


