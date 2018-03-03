#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z $BACKUP_PATH ] && BACKUP_PATH="/var/backups"

BACKUP_DIR="$BACKUP_PATH/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR" || exit 1

rsync -a "$BACKUP_RSYNC_DIR/" "$BACKUP_DIR/"
