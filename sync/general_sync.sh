#!/bin/bash

source "$(dirname "$0")/../config.sh"
source "$(dirname "$0")/../functions.sh"

check_mount
rotate_logs "general_sync"

SOURCE="$SOURCE_DIR"
DESTINATION="$BACKUP_DIR"

mkdir -p "$DESTINATION"
LOG_FILE="$LOG_DIR/general_sync.log.$(date '+%Y-%m-%d_%H-%M-%S')"

echo "[INFO] Iniciando backup geral de $SOURCE para $DESTINATION" | tee -a "$LOG_FILE"

for folder in "$SOURCE"/*; do
    if [ -d "$folder" ]; then
        folder_name=$(basename "$folder")
        dest_folder="$DESTINATION/$folder_name"

        echo "[INFO] Fazendo backup de $folder para $dest_folder" | tee -a "$LOG_FILE"

        rsync -avh --info=progress2 --delete "$folder"/ "$dest_folder"/ 2>&1 | tee -a "$LOG_FILE"

        if [ "${PIPESTATUS[0]}" -eq 0 ]; then
            echo "[SUCCESS] Backup de $folder concluído." | tee -a "$LOG_FILE"
        else
            echo "[ERROR] Erro no backup de $folder." | tee -a "$LOG_FILE"
        fi
    fi
done

echo "[INFO] Backup geral finalizado." | tee -a "$LOG_FILE"
