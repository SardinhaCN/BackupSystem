#!/bin/bash

source "$(dirname "$0")/../config.sh"
source "$(dirname "$0")/../functions.sh"

check_mount
rotate_logs "push_backup"

REPO_PATH="$BACKUP_DIR"
LOG_FILE="$LOG_DIR/push_backup.log.$(date '+%Y-%m-%d_%H-%M-%S')"

cd "$REPO_PATH" || {
    echo "[ERROR] Diretório $REPO_PATH não encontrado." | tee -a "$LOG_FILE"
    exit 1
}

echo "[INFO] Iniciando push dos backups para o GitHub." | tee -a "$LOG_FILE"

git add . 2>&1 | tee -a "$LOG_FILE"
git commit -m "Backup atualizado $(date '+%F %T')" 2>&1 | tee -a "$LOG_FILE"
git push 2>&1 | tee -a "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup enviado para o GitHub com sucesso." | tee -a "$LOG_FILE"
else
    echo "[ERROR] Falha ao enviar o backup para o GitHub." | tee -a "$LOG_FILE"
fi
