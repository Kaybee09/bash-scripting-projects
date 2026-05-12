#!/bin/bash

cpu_load=$(uptime | cut -d':' -f5)
memory=$(free -h | awk 'NR==2 {print $3 "/" $2}')
disk=$(df / | awk 'NR==2 {print $5}' | sed 's/%//' )

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
	if [ $disk -gt 50 ]; then
        echo "WARNING‼️ ⛔️ disk is high"
else
        echo "STATUS OK"
fi
	
	sleep 5 
done

if [ $disk -gt 50 ]; then
	echo "WARNING‼️ ⛔️ disk is high"
else 
	echo "STATUS OK"
fi
