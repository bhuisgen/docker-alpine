#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z $BACKUP_PATH ] && BACKUP_PATH="/var/backups"

BACKUP_DIR="$BACKUP_PATH/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR" || exit 1

if [ ! -z $BACKUP_MARIADB_DATABASE ]; then
    databases="${BACKUP_MARIADB_DATABASE//,/ }"
else
    databases=$(mysql -h "$BACKUP_MARIADB_HOST" -p "$BACKUP_MARIADB_PORT" -u backup \
        --defaults-file="$BACKUP_PATH/.my.cnf" --batch -N -e "SHOW DATABASES")
fi

for database in $databases; do
    if [ $(echo "$database" | grep -ce "lost\+found\|performance_schema\|information_schema") -ne 0 ]; then
        continue
    fi

    mysqldump -h "$BACKUP_MARIADB_HOST" -p "$BACKUP_MARIADB_PORT" -u backup --defaults-file="$BACKUP_PATH/.my.cnf" \
        --single-transaction --quick "$database" | gzip > "$BACKUP_DIR/$database.sql.gz"
done
