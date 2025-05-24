
# 📦 BackupSystem

Sistema robusto de backup em **Bash para Linux**, com suporte a:

- Backup de pastas
- Backup de mídia (normal e compactado)
- Rotação de logs
- Verificação de montagem dos discos
- Limpeza automática de backups antigos
- Push automático para GitHub
- Instalação simplificada

## 🚀 Funcionalidades

✅ Backup de qualquer pasta (default `/DATA` → `/mnt/Backup`)

✅ Backup de mídia simples e compactado (`tar.gz`)

✅ Verificação se os discos estão montados antes de rodar

✅ Logs rotativos automáticos (evita crescimento infinito)

✅ Push automático dos backups para um repositório GitHub

✅ Menu interativo para gerenciar os backups

✅ Instalador automático

## 📂 Estrutura de Diretórios

```
BackupSystem/
├── main.sh                 # Menu principal
├── config.sh                # Configurações globais
├── functions.sh             # Funções reutilizáveis
├── backup_control.sh        # Menu de controle de backups
├── status_dashboard.sh      # Visualização dos logs
├── install.sh               # Instalador automático
├── sync/                    # Scripts de sincronização
│   ├── general_sync.sh      # Backup geral (DATA)
│   ├── media_sync.sh        # Backup de mídia normal
│   └── media_sync2.sh       # Backup de mídia compactado
├── git/                     # Push para GitHub
│   └── push_backup.sh
└── logs/                    # Logs gerados (criado automaticamente)
```

## 🛠️ Instalação

1. Clone ou copie os arquivos.

2. Dê permissão de execução:

```bash
chmod +x install.sh
```

3. Execute o instalador:

```bash
./install.sh
```

4. Use o comando:

```bash
backupsystem
```

## ⚙️ Configuração

Edite o arquivo `config.sh`:

```bash
SOURCE_DIR="/DATA"
BACKUP_DIR="/mnt/Backup"
LOG_DIR="$(dirname "$0")/logs"
```

## 🖥️ Uso do Menu

Execute:

```bash
backupsystem
```

Menu de opções:

1️⃣ Backup Geral (`/DATA` → `/mnt/Backup`)

2️⃣ Backup de Mídia (`/DATA/Midia` → `/mnt/Backup/Midia`)

3️⃣ Backup Compactado (`.tar.gz`)

4️⃣ Push para GitHub

5️⃣ Ver Status e Logs

6️⃣ Sair

## ♻️ Rotação de Logs

- Mantém os **5 logs mais recentes**.
- Evita acúmulo desnecessário.

## 🗑️ Limpeza de Backups Antigos

- No backup compactado (`media_sync2.sh`), mantém os **5 arquivos mais recentes** no destino.

## 🔗 Push para GitHub (Opcional)

✔️ Configure seu repositório Git no diretório de backup `/mnt/Backup`:

```bash
cd /mnt/Backup
git init
git remote add origin <seu-repo>
git branch -M main
git pull origin main
```

✔️ Depois, use a opção **4 (Push GitHub)** no menu.

## ⏰ Backup Automático (Cron)

Durante a instalação, é possível configurar backup diário às **02:00** da manhã.

Se quiser adicionar manualmente:

```bash
sudo crontab -e
```

Exemplo de linha no cron:

```bash
0 2 * * * /opt/BackupSystem/sync/general_sync.sh >> /opt/BackupSystem/logs/cron.log 2>&1
```

## 🔒 Permissões

Garanta que você tenha permissão de leitura no `/DATA` e escrita no `/mnt/Backup`.

## 💼 Requisitos

- Linux (Debian, Ubuntu, Arch, Fedora, etc.)
- Bash
- rsync
- tar
- git

## 🧠 Melhorias Futuras (Sugestões)

- Notificações por e-mail ou Telegram
- Backup incremental diferencial
- Interface Web com Docker
- Monitoramento com Grafana + Prometheus
- Backup na nuvem (Google Drive, S3)

## 👨‍💻 Desenvolvedor

> BackupSystem desenvolvido por [Seu Nome].
