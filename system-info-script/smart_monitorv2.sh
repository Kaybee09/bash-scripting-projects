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

    # =========================
    # SYSTEM METRICS
    # =========================

    # Disk usage %
    disk=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    # RAM available in MB
    ram_available=$(free -m | awk 'NR==2 {print $7}')

    # CPU load average
    cpu_load=$(awk '{print $1}' /proc/loadavg)

    # CPU cores
    cpu_cores=$(nproc)

    # Normalize CPU load to percentage
    cpu_percent=$(echo "$cpu_load $cpu_cores" | awk '{printf "%.0f", ($1/$2)*100}')

    # =========================
    # SEVERITY SCORING
    # =========================

    # CPU score (0-100)
    cpu_score=$cpu_percent

    # Disk score
    disk_score=$disk

    # RAM score
    # Less available RAM = worse
    total_ram=$(free -m | awk 'NR==2 {print $2}')
    ram_used_percent=$(awk "BEGIN {printf \"%.0f\", (($total_ram - $ram_available)/$total_ram)*100}")

    ram_score=$ram_used_percent

    # =========================
    # FINAL HEALTH SCORE
    # =========================

    final_score=$(awk "BEGIN {
        printf \"%.0f\", ($cpu_score * 0.4) + ($ram_score * 0.3) + ($disk_score * 0.3)
    }")

    # =========================
    # STATUS
    # =========================

    if [ "$final_score" -lt 40 ]; then
        status="HEALTHY"
    elif [ "$final_score" -lt 70 ]; then
        status="WARNING"
    else
        status="CRITICAL"
    fi

    # =========================
    # OUTPUT
    # =========================

    echo "[INFO]"
    echo "========================="
    echo "SERVER: $server"
    echo "OS: $os_info"
    echo

    echo "CPU Load Average : $cpu_load"
    echo "CPU Usage Score  : $cpu_score%"
    echo

    echo "RAM Available    : ${ram_available}MB"
    echo "RAM Usage Score  : $ram_score%"
    echo

    echo "Disk Usage       : ${disk}%"
    echo "Disk Usage Score : $disk_score%"
    echo

    echo "========================="
    echo "FINAL HEALTH SCORE: $final_score / 100"
    echo "SYSTEM STATUS: $status"
    echo "========================="

    sleep 2

done
