#!/bin/bash


server=$(hostname)
os_info=$(cat /etc/os-release | grep -i "24")
cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "[INFO]"
echo "=================="
echo 
echo "SERVER: $server"
echo "$os_info"
echo
echo "CPU STATUS"
echo "================="
if [ "$cpu_load" -ge 80 ]; then
	echo "Monitoring CPU, Please wait...."
	sleep 5
	echo "CRITICAL: Very High CPU load"
elif [ "$cpu_load" -ge 50 ]; then
	echo "Monitoring CPU, Please wait...."
	echo "WARNING: High CPU load"
else
	echo "Monitoring CPU, Please wait...."
	sleep 5
	echo "CPU STATUS IS OK"
	echo "Monitoring stopped"
fi


