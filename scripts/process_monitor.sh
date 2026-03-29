#!/bin/bash

LOG_FILE="logs/process_monitor.log"

services=("nginx" "ssh" "docker")

for service in "${services[@]}"; do
    if pgrep "$service" > /dev/null; then
        status="Running"
    else
        status="Stopped - Restarting..."
        # Simulate restart
        sleep 1
        status="Restarted"
    fi

    echo "$service: $status"
    echo "$(date): $service - $status" >> "$LOG_FILE"
done
