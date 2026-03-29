#!/bin/bash
set -euo pipefail

LOG_FILE="logs/app.log"

run_all() {
    ./scripts/system_check.sh
    ./scripts/process_monitor.sh
}

backup() {
    read -p "Enter directory to backup: " dir
    ./scripts/backup.sh "$dir"
}

while true; do
    echo "1. Run all"
    echo "2. System check"
    echo "3. Backup"
    echo "4. Exit"
    read -p "Choose option: " choice

    case $choice in
        1) run_all ;;
        2) ./scripts/system_check.sh ;;
        3) backup ;;
        4) exit 0 ;;
        *) echo "Invalid option" ;;
    esac

    echo "$(date): Option $choice executed" >> "$LOG_FILE"
done
