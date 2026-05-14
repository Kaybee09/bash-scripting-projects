#!/bin/bash

cleanup() {
    echo
    echo "=================="
    echo "Exiting monitoring script safely..."
    echo "Goodbye!"
    exit 0
}

trap cleanup SIGINT SIGTERM

while true; do

    clear

    server=$(hostname)

    . /etc/os-release
    os_info=$PRETTY_NAME
    disk=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    ram_available=$(free -m |awk  'NR==2 {print $4}')
    cpu_load=$(awk '{print $1}' /proc/loadavg)




    echo "[INFO]"
    echo "=================="
    echo
    echo "SERVER: $server"
    echo "OS: $os_info"
    echo
    echo "CPU STATUS"
    echo "================="
    echo 
    echo "SYSTEM SEVERITY SCORING"


    echo "Load Average (1 min): $cpu_load"
    echo "Ram availability to use: $ram_available"
    echo "Disk usage: $disk"

   

    if (( $(echo "$cpu_load > 1.0" | bc -l) && "$disk > 60" && "$ram_available > 1100"  )); then
        echo "Range 1 to 100: System is 99, THIS IS CRITICAL."

    elif (( $(echo "$cpu_load == 1.0" | bc -l) && "$disk <= 60" && "$ram_available <= 1100"  )); then
	    echo "Range 1-100: system is 70 WARNING" 
    else
        echo "SYSTEM STATUS IS OK"
    fi

    sleep 2

done

#
#
#server=$(hostname)
#. /etc/os-release
#os_info=$PRETTY_NAME
#cpu_load=$(awk '{print $1}' /proc/loadavg)
#
#echo "[INFO]"
#echo "=================="
#echo 
#echo "SERVER:$server"
#echo "OS:$os_info"
#echo
#echo "CPU STATUS"
#echo "================="
#
#echo "Load Average (1 min): $cpu_load"
#
#if (( $(echo "$cpu_load > 2.0" | bc -l) )); then
#    echo "CRITICAL: Very High Load"
#elif (( $(echo "$cpu_load > 1.0" | bc -l) )); then
#    echo "WARNING: High Load"
#else
#    echo "CPU STATUS IS OK"
#fi
#
#
#
#
#
#
#
#
#
#
#
#
#
