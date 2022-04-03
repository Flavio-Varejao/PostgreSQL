#!/usr/bin/env bash

# Base Backup
export DATE=$(date +%d%m%Y)
export PGDATA=/var/lib/pgsql/12/data
export PATH=$PATH:/usr/pgsql-12/bin
export BKPBASE=/var/lib/pgsql/12/backups/Bkp_fisico/
export BKPDIR="$BKPBASE"/PostgreSQL_Base_Backup_"$DATE"
export LOG="$BKPBASE"/logs/PostgreSQL_Base_Backup_"$DATE".log
export PGPASSWORD="postgres2022"

echo -e "\n\nBackup Status: "$(date +"%d-%m-%y")"" > "$LOG"
echo -e "-----------------------" >> "$LOG"
echo -e "\nStart Time: "$(date)"\n" >> "$LOG"

pg_basebackup -U postgres -w -D "$BKPDIR" -l "$(date)" -P -v -F tar -z -R 2>> "$LOG"
# pg_basebackup -h localhost -p 5432 -U postgres -D "$DIRECTORY" -Ft -z -P -v 2>"$LOG"
# pg_basebackup -h localhost -p 5432 -U postgres -D "$DIRECTORY" -Fp -P -v 2>"$LOG"

echo -e "\nEnd Time: "$(date)"" >> "$LOG"

#Auto Deletion for Backups
#Value 7 for retention will keep 8 days backups
RETENTION=7
find "$BKPBASE"/PostgreSQL_Base_Backup* -type d -mtime +"$RETENTION" -exec rm -rv {} \;

# Opções do comando 'pg_basebackup'
# -w Não exige a senha na execução do comando
# -D Especifica o diretório de backup
# -P Mostra o progresso do backup
# -v Modo verboso
# -F Especifica o formato do arquivo de backup
# -z Habilita a compressão com gzip
# -R Escreve a configuração para replicação





