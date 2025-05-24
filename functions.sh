#!/bin/bash

# Verificar se os diretórios estão montados
check_mount() {
    if ! mountpoint -q "$SOURCE_DIR"; then
        echo "[ERROR] $SOURCE_DIR não está montado. Abortando."
        exit 1
    fi
    if ! mountpoint -q "$BACKUP_DIR"; then
        echo "[ERROR] $BACKUP_DIR não está montado. Abortando."
        exit 1
    fi
}

# Rotação de logs (mantém os 5 mais recentes)
rotate_logs() {
    LOG_PATTERN="$1"
    mkdir -p "$LOG_DIR"
    ls -tp "$LOG_DIR"/"$LOG_PATTERN".log* 2>/dev/null | grep -v '/$' | tail -n +6 | xargs -I {} rm -f -- {}
}

# Limpeza de backups antigos
cleanup_old_backups() {
    BACKUP_TARGET="$1"
    KEEP="$2"
    mkdir -p "$BACKUP_TARGET"
    ls -tp "$BACKUP_TARGET"/*.tar.gz 2>/dev/null | grep -v '/$' | tail -n +$((KEEP + 1)) | xargs -I {} rm -f -- {}
}