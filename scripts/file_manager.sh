#!/bin/bash

LOG_FILE="logs/file_manager.log"

action=$1
filename=$2
newname=$3

case $action in
    create)
        if [[ -f "$filename" ]]; then
            echo "File already exists!"
        else
            touch "$filename"
            echo "File created: $filename"
            echo "$(date): Created $filename" >> "$LOG_FILE"
        fi
        ;;
    
    delete)
        if [[ -f "$filename" ]]; then
            rm "$filename"
            echo "File deleted: $filename"
            echo "$(date): Deleted $filename" >> "$LOG_FILE"
        else
            echo "File not found!"
        fi
        ;;
    
    list)
        ls
        ;;
    
    rename)
        if [[ -f "$filename" ]]; then
            mv "$filename" "$newname"
            echo "File renamed to $newname"
            echo "$(date): Renamed $filename to $newname" >> "$LOG_FILE"
        else
            echo "File not found!"
        fi
        ;;
    
    *)
        echo "Usage: $0 {create|delete|list|rename} filename"
        ;;
esac
