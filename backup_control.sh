#!/bin/bash

source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/functions.sh"

while true; do
    clear
    echo "=========================================="
    echo "         Backup Control System            "
    echo "=========================================="
    echo "1) Backup Geral (/DATA para /mnt/Backup)"
    echo "2) Backup de Mídia"
    echo "3) Backup Compactado de Mídia"
    echo "4) Push para GitHub"
    echo "5) Ver Logs e Status"
    echo "6) Sair"
    echo "=========================================="
    read -rp "Escolha uma opção: " opcao

    case $opcao in
        1) bash sync/general_sync.sh ;;
        2) bash sync/media_sync.sh ;;
        3) bash sync/media_sync2.sh ;;
        4) bash git/push_backup.sh ;;
        5) bash status_dashboard.sh ;;
        6) exit ;;
        *) echo "Opção inválida!"; sleep 1 ;;
    esac
done