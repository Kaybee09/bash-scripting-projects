#!/bin/bash

# monitor_snapshot.sh
# Prints a one-time system health snapshot.

HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
UPTIME_INFO=$(uptime -p)
LOAD_AVG=$(uptime | awk -F'load average:' '{print $2}' | xargs)
LOGGED_USERS=$(who | awk '{print $1}' | sort -u | xargs)

if [[ -z "$LOGGED_USERS" ]]; then
    LOGGED_USERS="No logged-in users found"
fi

