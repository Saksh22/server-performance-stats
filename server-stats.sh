echo -e "\n CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{printf "Used: " 100 - $8 "%", "| Idle: " $8 "%"}'

echo -e "\n Memory Usage:"
free -h | awk '/^Mem/ {
    used = $3;
    total = $2;
    printf "Used: %s / %s (%.2f%%)\n", used, total, ($3/$2)*100
    }'

echo -e "\n Disk Usage:"
df -h --total | grep total | \
awk '{print "Used: " $3 " / " $2 " (" $5 " used)"}'

# Top 5 processes by CPU usage
echo -e "\n🔥 Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory usage
echo -e "\n💡 Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
