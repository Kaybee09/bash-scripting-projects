#!/bin/bash


server=$(hostname)
os_info=$(cat /etc/os-release | grep -i "24")

echo "[INFO]"
echo "=================="
echo 
echo "SERVER: $server"
echo "$os_info"

