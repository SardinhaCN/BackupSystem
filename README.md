# BackupSystem

BackupSystem é uma ferramenta de backup via terminal para Ubuntu Server.

## 🚀 Instalação

Baixe o arquivo `.deb` e execute:

```bash
sudo dpkg -i BackupSystem.deb
```

| Comando                               | Descrição                                                       |
| ------------------------------------- | --------------------------------------------------------------- |
| `systemb backup <origem> <destino>`   | Backup normal                                                   |
| `systemb backup -zip <origem> <dest>` | Backup compactado em ZIP                                        |
| `systemb backup -unzip <zip> <dest>`  | Descompacta um arquivo ZIP                                      |
| `systemb log`                         | Mostra os logs no terminal                                      |
| `systemb log nano`                    | Abre os logs no editor Nano                                     |
| `systemb log del`                     | Deleta o arquivo de log                                         |
| `systemb update`                      | Atualiza via pacote `.deb` da pasta `/opt/backupsystem/updates` |
| `systemb uninstall`                   | Desinstala o BackupSystem                                       |
| `systemb help`                        | Mostra o menu de ajuda                                          |

🗂️ Estrutura dos arquivos
Binário: /usr/local/bin/systemb

Dados: /opt/backupsystem/

Logs: /opt/backupsystem/logs/backup.log

Updates: /opt/backupsystem/updates/

🐧 Suporte
Compatível com Ubuntu Server 20.04, 22.04 e derivados.

👨‍💻 Autor
Sardinha CN - sar.anime.mania@gmail.com
