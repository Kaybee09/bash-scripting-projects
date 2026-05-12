#!/bin/bash

while true
do
	cpu_load=$(uptime | awk -F'load average:' '{print $2}')
	memory=$(free -h | awk 'NR==2 {print $3 "/" $2}')
	disk=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')


	echo "======================="
	echo
	echo "$(date)"
	echo
	echo "Cpu-load: $cpu_load"
	echo "Memory usage $memory"
	echo "Disk Usage $disk"
	echo "======================"
	echo
	if [ $disk -gt 80 ]; then
        echo "WARNING‼️ Disk is higher than 80%"
else
        echo "STATUS OK"
fi
	
	sleep 10 
done >> system_health.log
