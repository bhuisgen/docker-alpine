#!/usr/bin/env bash

if [ -z "$BACKUP_MONGODB_HOST" ] || [ -z "$BACKUP_MONGODB_PORT" ] || [ -z "$BACKUP_MONGODB_DATABASE" ]; then
    exit 1
fi

trap 'exit 2' ERR INT TERM

[ -z $BACKUP_PATH ] && BACKUP_PATH="/var/backups"

BACKUP_DIR="$BACKUP_PATH/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR" || exit 3

databases="${BACKUP_MONGODB_DATABASE//,/ }"

for database in $databases; do
    mongodump -h "$BACKUP_MONGODB_HOST" -p "$BACKUP_MONGODB_PORT" -d "$database" --gzip \
        --archive="$BACKUP_DIR/$database.dump.gz"
done
