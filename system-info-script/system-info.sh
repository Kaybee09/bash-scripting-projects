#!/bin/bash

host=$(hostname)
user=$(whoami)
uptime_info=$(uptime)
ram_usage=$(free -h)
disk_usage=$(df -h)
cpu_load=$(uptime | awk -F'load average:' '{print $2}')
logged_users=$(who)

echo "SYSTEM INFORMATION"
echo "------------------"

echo
echo "Hostname: $host"
echo "User: $user"

echo 
echo "Uptime:"
echo "$uptime_info"

echo
echo "MEMORY INFORMATION"
echo "------------------"

echo
echo "CPU Load:"
echo "$cpu_load"

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
