HOSTNAME=$(hostname)
INTERVAL=10
RUNNING=true

get_cpu_load() {
    top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}'
}

get_memory_usage() {
    free | awk '/Mem:/ {printf "%.2f", ($3/$2) * 100}'
}

get_disk_usage() {
    df / | awk 'NR==2 {gsub("%",""); print $5}'
}

log_message() {
    local level=$1
    local metric=$2
    local value=$3
    local status=$4
    local timestamp

    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    echo "$timestamp | hostname=$HOSTNAME | level=$level | metric=$metric | value=$value | health=$status"
}

evaluate_metric() {
    local metric=$1
    local value=$2

    if (( $(echo "$value >= 90" | bc -l) )); then
        log_message "CRITICAL" "$metric" "$value%" "UNHEALTHY"
    elif (( $(echo "$value >= 75" | bc -l) )); then
        log_message "WARNING" "$metric" "$value%" "DEGRADED"
    else
        log_message "INFO" "$metric" "$value%" "HEALTHY"
    fi
}

shutdown() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") | hostname=$HOSTNAME | level=INFO | message=Graceful shutdown triggered"
    RUNNING=false
}
