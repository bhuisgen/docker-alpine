#!/usr/bin/env bash

if [ -z "$BACKUP_TAR_DIR" ]; then
    exit 1
fi

trap 'exit 2' ERR INT TERM

[ -z "$BACKUP_PATH" ] && BACKUP_PATH="/var/backups"

BACKUP_DIR="$BACKUP_PATH/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR" || exit 3

tar czf "$BACKUP_DIR/backup.tar.gz" -C "$BACKUP_TAR_DIR" ./
