# BackupSystem

BackupSystem é uma ferramenta de backup via terminal para Ubuntu Server.

Esse projeto foi feito para resolver um problema de backup que no CasaOS nao tem!

## 🚀 Instalação

Baixe o arquivo `.deb` e execute:

```bash
sudo dpkg -i BackupSystem.deb
```

| Programa | Função                                               | Instalação no Ubuntu     |
| -------- | ---------------------------------------------------- | ------------------------ |
| `pv`     | Barra de progresso na cópia de arquivos e compressão | `sudo apt install pv`    |
| `zip`    | Compactar arquivos no modo `-zip`                    | `sudo apt install zip`   |
| `unzip`  | Descompactar arquivos no modo `-unzip`               | `sudo apt install unzip` |


✅ Dependências padrão (geralmente já instaladas)
Esses comandos são padrões em quase todas as distribuições Linux e não costumam precisar de instalação:

bash (shell)

find (localiza arquivos)

du (verificar tamanho)

df (verificar espaço livre)

mkdir, cp, rm, read, awk, cut, echo, cat (comandos GNU coreutils e util-linux)

✔️ Estes geralmente já estão disponíveis no Ubuntu, Debian e derivados.


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

[video usando comandos no terminal](https://mxdrop.to/e/el1qq1loc40qee)

[video mostrando o resultado](https://mxdrop.to/e/z1kllk06ugo0xe)

🗂️ Estrutura dos arquivos

Binário: /usr/local/bin/systemb

Dados: /opt/backupsystem/

Logs: /opt/backupsystem/logs/backup.log

Updates: /opt/backupsystem/updates/

🐧 Suporte
Compatível com Ubuntu Server 20.04, 22.04 e derivados.

👨‍💻 Autor
Sardinha CN - sar.anime.mania@gmail.com
