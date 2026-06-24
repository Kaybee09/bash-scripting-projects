#!/bin/bash

LOG_FILE="service_status.log"

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <service1> [service2] ..."
    exit 1
fi

echo "Service Check - $(date)" >> "$LOG_FILE"

for service in "$@"
do
    if systemctl is-active --quiet "$service"; then
        echo "$service is running"
        echo "$(date) - OK - $service is running" >> "$LOG_FILE"
    else
        echo "$service is not running"
        echo "$(date) - FAILED - $service is not running" >> "$LOG_FILE"
    fi
done