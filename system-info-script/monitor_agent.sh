#!/bin/bash

cpu_load=$(uptime | cut -d':' -f5)

while true
do
	echo "$(date)"
	echo "cpu-load: $cpu_load"
done
