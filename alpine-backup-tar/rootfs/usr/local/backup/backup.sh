#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z "${BACKUP_PATH}" ] && BACKUP_PATH="/var/backups"
[ -z "${BACKUP_DATA}" ] && BACKUP_DATA="/data"
[ -z "${BACKUP_ROTATE}" ] && BACKUP_ROTATE=1
[ -z "${BACKUP_ROTATE_DAYS}" ] && BACKUP_ROTATE_DAYS=3

backup_dir="${BACKUP_PATH}/$(date +%Y%m%d_%H%M%S)"

mkdir -p "${backup_dir}"

tar czf "${backup_dir}/backup.tar.gz" -C "${BACKUP_DATA}" ./

if [ ${BACKUP_ROTATE} -eq 1 ]; then
    find "${BACKUP_PATH}" -mindepth 1 -maxdepth 1 -type d -mtime "+${BACKUP_ROTATE_DAYS}" -print0 |
        xargs -0 -I {} /bin/rm -rf "{}"
fi
