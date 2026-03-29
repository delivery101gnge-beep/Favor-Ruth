#!/bin/bash

LOG_FILE="logs/backup.log"
BACKUP_DIR="backups"

dir=$1

if [[ ! -d "$dir" ]]; then
    echo "Error: Directory does not exist."
    exit 1
fi

timestamp=$(date +%F_%H-%M-%S)
backup_file="$BACKUP_DIR/backup_$timestamp.tar.gz"

tar -czf "$backup_file" "$dir"

echo "$(date): Backup created: $backup_file" >> "$LOG_FILE"

# Keep only last 5 backups
ls -t $BACKUP_DIR/backup_*.tar.gz | tail -n +6 | xargs -r rm

echo "Backup completed: $backup_file"
