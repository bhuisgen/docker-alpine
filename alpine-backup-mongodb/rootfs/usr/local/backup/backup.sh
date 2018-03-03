#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z $BACKUP_PATH ] && BACKUP_PATH="/var/backups"
[ -z $BACKUP_MONGODB_DATABASE ] && exit 1

BACKUP_DIR="$BACKUP_PATH/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR" || exit 1

databases="${BACKUP_MONGODB_DATABASE//,/ /}"

for database in $databases; do
    mongodump -h "$BACKUP_MONGODB_HOST" -p "$BACKUP_MONGODB_PORT" -d "$database" --gzip \
        --archive="$BACKUP_DIR/$database.dump.gz"
done
