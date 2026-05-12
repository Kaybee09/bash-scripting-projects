#!/bin/bash

cpu_load=$(uptime | cut -d':' -f5)
memory=$(free -h | awk 'NR==2 {print $3 "/" $2}')
disk=$(df / | awk 'NR==2 {print $5}')

while true
do
	echo "======================="
	echo
	echo "$(date)"
	echo
	echo "Cpu-load: $cpu_load"
	echo "Memory usage $memory"
	echo "Disk Usage $disk"
	echo "======================"
	echo
	echo "STATUS OK"
	sleep 5 
done


