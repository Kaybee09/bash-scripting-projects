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
    df -h / | awk 'NR==2 {print $5}' | sed 's/%//'
    free -m |awk  'NR==2 {print $4}'
    awk '{print $1}' /proc/loadavg

    cpu_load=$(awk '{print $1}' /proc/loadavg)

    echo "[INFO]"
    echo "=================="
    echo
    echo "SERVER: $server"
    echo "OS: $os_info"
    echo
    echo "CPU STATUS"
    echo "================="

    echo "Load Average (1 min): $cpu_load"

    if (( $(echo "$cpu_load > 2.0" | bc -l) )); then
        echo "CRITICAL: Very High Load"
    elif (( $(echo "$cpu_load > 1.0" | bc -l) )); then
        echo "WARNING: High Load"
    else
        echo "CPU STATUS IS OK"
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
