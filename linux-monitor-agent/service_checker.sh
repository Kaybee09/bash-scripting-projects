#!/bin/bash

LOG_FILE="service_status.log"
SERVICES=("ssh" "docker" "nginx")

echo "Service Check - $(date)" >> "$LOG_FILE"

for service in "${SERVICES[@]}"
do
    if systemctl is-active --quiet "$service"; then
        echo "$service is running"
        echo "$(date) - OK - $service is running" >> "$LOG_FILE"
    else
        echo "$service is not running"
        echo "$(date) - FAILED - $service is not running" >> "$LOG_FILE"
    fi
done