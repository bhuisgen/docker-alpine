#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z $BACKUP_PATH ] && BACKUP_PATH="/var/backups"

BACKUP_DIR="$BACKUP_PATH/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR" || exit 1

export PGPASSFILE="$BACKUP_PATH/.pgpass"

if [ ! -z $BACKUP_POSTGRESQL_DATABASE ]; then
    databases="${BACKUP_POSTGRESQL_DATABASE//,/ /}"
else
    databases=$(psql -h "$BACKUP_POSTGRESQL_HOST" -p "$BACKUP_POSTGRESQL_PORT" -U backup \
        -c "SELECT datname FROM pg_database;" -t postgres)

    pg_dumpall -h "$BACKUP_POSTGRESQL_HOST" -p "$BACKUP_POSTGRESQL_PORT" -U backup -r | gzip > \
        "$BACKUP_DIR/roles.sql.gz"
fi

for database in $databases; do
    if [ $(echo "$database" | grep -ce "template0\|postgres") -ne 0 ]; then
        continue
    fi

    pg_dump -h "$BACKUP_POSTGRESQL_HOST" -p "$BACKUP_POSTGRESQL_PORT" -U backup -Fc -Z1 "$database" > \
        "$BACKUP_DIR/$database.pgdmp"
done
