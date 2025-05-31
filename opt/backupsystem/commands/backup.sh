#!/bin/bash

LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/backup.log"

OPTION=""
ORIGEM=""
DESTINO=""

# Lê os parâmetros
if [[ "$1" == "-zip" || "$1" == "-unzip" ]]; then
    OPTION=$1
    ORIGEM=$2
    DESTINO=$3
else
    ORIGEM=$1
    DESTINO=$2
fi

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $1" | tee -a "$LOG_FILE"
}

# Validação de parâmetros
if [ -z "$ORIGEM" ] || [ -z "$DESTINO" ]; then
    echo "❌ Uso: systemb backup [-zip|-unzip] <origem> <destino>"
    exit 1
fi

# Verifica se origem existe
if [ ! -d "$ORIGEM" ] && [ "$OPTION" != "-unzip" ]; then
    echo "❌ Pasta de origem não existe: $ORIGEM"
    exit 1
fi

mkdir -p "$DESTINO"

log "Iniciando operação: $OPTION de '$ORIGEM' para '$DESTINO'"

# Verifica espaço disponível
ORIGEM_SIZE=$(du -s "$ORIGEM" | awk '{print $1}')
DEST_DISK_AVAILABLE=$(df "$DESTINO" | awk 'NR==2 {print $4}')

log "Espaço necessário: $ORIGEM_SIZE KB"
log "Espaço disponível: $DEST_DISK_AVAILABLE KB"

if [ "$ORIGEM_SIZE" -ge "$DEST_DISK_AVAILABLE" ]; then
    log "❌ ERRO: Espaço insuficiente no destino."
    echo "⚠️ Simulação falhou: Sem espaço suficiente."
    exit 1
else
    log "✔️ Espaço suficiente encontrado."
fi

# ======== ZIP =========
if [ "$OPTION" == "-zip" ]; then
    ZIP_NAME="$(basename "$ORIGEM")_$(date '+%Y%m%d_%H%M%S').zip"
    log "Compactando em $DESTINO/$ZIP_NAME..."
    zip -r "$DESTINO/$ZIP_NAME" "$ORIGEM" | tee -a "$LOG_FILE"
    log "✅ Backup compactado concluído."
    exit 0
fi

# ======== UNZIP =========
if [ "$OPTION" == "-unzip" ]; then
    ZIP_FILE=$(find "$ORIGEM" -name "*.zip" | head -n 1)

    if [ -z "$ZIP_FILE" ]; then
        log "❌ Nenhum arquivo ZIP encontrado em $ORIGEM"
        exit 1
    fi

    log "Descompactando $ZIP_FILE em $DESTINO..."
    unzip "$ZIP_FILE" -d "$DESTINO" | tee -a "$LOG_FILE"
    log "✅ Descompactação concluída."
    exit 0
fi

# ======== BACKUP NORMAL (SEM ZIP) =========
log "Backup normal iniciado."

TOTAL=$(find "$ORIGEM" -type f | wc -l)
COUNT=0

find "$ORIGEM" -type f | while read -r FILE; do
    RELATIVE_PATH="${FILE#$ORIGEM/}"
    DEST_FILE="$DESTINO/$RELATIVE_PATH"

    mkdir -p "$(dirname "$DEST_FILE")"
    cp "$FILE" "$DEST_FILE"

    COUNT=$((COUNT + 1))
    PERCENT=$((COUNT * 100 / TOTAL))
    echo -ne "🗂️  Arquivo $COUNT/$TOTAL | Progresso: $PERCENT% \r"
done

echo ""
log "✅ Backup normal concluído."
