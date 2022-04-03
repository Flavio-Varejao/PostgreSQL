#!/usr/bin/env bash

# Dump Full Diário

export DATA=$(date +%d%m%Y)
export PATH=$PATH:/usr/pgsql-12/bin
export PGDATA=/var/lib/pgsql/12/data
export PGDATABASE=postgres
export DUMPDIR=/var/lib/pgsql/12/backups/Bkp_logico/
export DUMPFILE=Datapump_Full_"$PGDATABASE"_"$(date +%d%m%Y)".dmp
export LOG="$DUMPDIR"/Datapump_Full_"$PGDATABASE"_"$(date +%d%m%Y)".log

echo -e "\n\nDatapump Status: "$(date +"%d-%m-%y")"" > "$LOG"
echo -e "-------------------------" >> "$LOG"
echo -e "\nStart Time: "$(date)"\n" >> "$LOG"

pg_dump dbname="$PGDATABASE" --format=custom --file="$DUMPDIR"/"$DUMPFILE" --verbose 2>>"$LOG"
# pg_dump dbname="$PGDATABASE" > "$DUMPDIR"/Datapump_Full_"$PGDATABASE"_"$(date +%d%m%Y)".sql

echo -e "\nEnd Time: "$(date)"" >> "$LOG"

