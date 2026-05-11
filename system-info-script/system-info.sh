#!/bin/bash

host=$(hostname)
user=$(whoami)
uptime_info=$(uptime)
ram_usage=$(free -h)
disk_usage=$(df / | awk 'NR==2 {print $5}')
load=$(uptime | awk -F'load average:' '{print $2}' | cut -d',' -f1)
logged_users=$(who)
cpu=$(lscpu | sed -n "1p;2p;5p;7p;8p;9p;10p")

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
echo "load time(1min):$load"

echo
echo "RAM Usage:"
echo "$ram_usage"

echo
echo "DISK INFORMATION"
echo "-----------------"

echo
echo "Disk Usage:"
echo "$disk_usage"

echo
echo "Logged In Users:"
echo "$logged_users"

echo
echo "CPU INFORMATION"
echo "---------------"
echo "$cpu"
