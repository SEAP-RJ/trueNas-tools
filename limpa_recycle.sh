#!/bin/bash

BASE_DIR="/mnt"
DIAS=30
LOG_FILE="/var/log/recycle_cleanup.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Iniciando limpeza das pastas .recycle..." >> "$LOG_FILE"

find "$BASE_DIR" -type d -name ".recycle" | while read -r recycle_dir; do
    echo "[$TIMESTAMP] >>> Limpando: $recycle_dir" >> "$LOG_FILE"

    find "$recycle_dir" -type f -mtime +$DIAS -print -delete >> "$LOG_FILE" 2>&1

    find "$recycle_dir" -type d -empty -mtime +$DIAS -print -delete >> "$LOG_FILE" 2>&1
done

echo "[$TIMESTAMP] Limpeza concluída." >> "$LOG_FILE"
