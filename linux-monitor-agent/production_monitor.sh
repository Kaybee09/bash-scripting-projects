#!/bin/bash

# production_monitor.sh
# Basic Linux monitoring script that writes system health data to a log file.
# Useful for cron jobs, server checks, and DevOps practice.

LOG_FILE="${1:-./sample.log}"
DISK_THRESHOLD=80
RAM_THRESHOLD=80

get_timestamp() {
    date '+%Y-%m-%d %H:%M:%S'
}

get_disk_usage() {
    df / | awk 'NR==2 {gsub("%", "", $5); print $5}'
}

get_ram_usage() {
    free | awk 'NR==2 {printf "%.0f", ($3/$2) * 100}'
}

get_cpu_load() {
    uptime | awk -F'load average:' '{print $2}' | xargs
}

write_log() {
    echo "$1" >> "$LOG_FILE"
}
