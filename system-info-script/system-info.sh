#!/bin/bash

host=$(hostname)
user=$(whoami)
uptime_info=$(uptime)
ram_usage=$(free -h)
available_mem=$(free -m | awk 'NR==2 {print $7}')
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
load=$(uptime | awk -F'load average:' '{print $2}' | cut -d',' -f1)
logged_users=$(who)
cpu=$(lscpu | grep -Ei "model name|architech|cpu\(s\)")

echo "SYSTEM INFORMATION"
echo "------------------"

echo
echo "Hostname: $host"
echo "User: $user"

echo 
echo "Uptime:"
echo "$uptime_info"

echo
echo "Uptime INFORMATION"
echo "------------------"

echo
echo "Load Time:"
echo "load (1min):$load"

echo
echo "RAM Usage:"
echo "$ram_usage"
echo
echo "$available_mem"
if [ "$available_mem" -lt 1000 ]; then
	echo "WARNING: The RAM is very low"
else
	echo "The RAM look good see above number"
fi


echo
echo "DISK INFORMATION"
echo "-----------------"

echo
echo "Disk Usage:"
echo "$disk_usage"
if [ "$disk_usage" -gt 80 ]; then 
	echo "WARNING: Disk is very high!"
else
	echo "The disk looks normal see above number."
fi

echo
echo "Logged In Users:"
echo "$logged_users"

echo
echo "CPU INFORMATION"
echo "---------------"
echo "$cpu"
