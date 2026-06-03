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