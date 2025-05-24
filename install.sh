#!/bin/bash

INSTALL_DIR="/opt/BackupSystem"

echo "========================================"
echo "   Instalando BackupSystem no $INSTALL_DIR"
echo "========================================"

sudo mkdir -p "$INSTALL_DIR"
sudo cp -r ./* "$INSTALL_DIR"

sudo chmod -R +x "$INSTALL_DIR"/*.sh
sudo chmod -R +x "$INSTALL_DIR"/sync/*.sh
sudo chmod -R +x "$INSTALL_DIR"/git/*.sh

sudo mkdir -p "$INSTALL_DIR/logs"

sudo ln -sf "$INSTALL_DIR/main.sh" /usr/local/bin/backupsystem

echo "========================================"
echo " Instalação concluída com sucesso!"
echo " Use o comando: backupsystem"
echo "========================================"

read -rp "Deseja criar uma tarefa cron diária? (s/n): " resp
if [[ "$resp" =~ ^[Ss]$ ]]; then
    (sudo crontab -l 2>/dev/null; echo "0 2 * * * $INSTALL_DIR/sync/general_sync.sh >> $INSTALL_DIR/logs/cron.log 2>&1") | sudo crontab -
    echo "Backup diário às 02:00 configurado no cron."
fi
