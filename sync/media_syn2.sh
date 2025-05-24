#!/bin/bash

source "$(dirname "$0")/../config.sh"
source "$(dirname "$0")/../functions.sh"

check_mount
rotate_logs "media_sync2"

SOURCE="$SOURCE_DIR/Midia"
DESTINATION="$BACKUP_DIR/MidiaBackup"

mkdir -p "$DESTINATION"
LOG_FILE="$LOG_DIR/media_sync2.log.$(date '+%Y-%m-%d_%H-%M-%S')"

echo "[INFO] Iniciando backup compactado de mídia de $SOURCE para $DESTINATION" | tee -a "$LOG_FILE"

for folder in "$SOURCE"/*; do
    if [ -d "$folder" ]; then
        folder_name=$(basename "$folder")
        archive_name="${folder_name}.tar.gz"
        archive_path="$DESTINATION/$archive_name"

        echo "[INFO] Compactando $folder para $archive_path" | tee -a "$LOG_FILE"

        tar -czf "$archive_path" -C "$folder" . 2>> "$LOG_FILE"

        if [ $? -eq 0 ]; then
            echo "[SUCCESS] Backup de $folder concluído." | tee -a "$LOG_FILE"
        else
            echo "[ERROR] Erro ao compactar $folder." | tee -a "$LOG_FILE"
        fi
    fi
done

cleanup_old_backups "$DESTINATION" 5

echo "[INFO] Backup compactado de mídia finalizado." | tee -a "$LOG_FILE"
