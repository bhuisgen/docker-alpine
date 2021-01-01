#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z "${BACKUP_PATH}" ] && BACKUP_PATH="/var/backups"
[ -z "${BACKUP_MARIADB_HOST}" ] && BACKUP_MARIADB_HOST="mariadb"
[ -z "${BACKUP_MARIADB_PORT}" ] && BACKUP_MARIADB_PORT=3306
[ -z "${BACKUP_ROTATE}" ] && BACKUP_ROTATE=1
[ -z "${BACKUP_ROTATE_DAYS}" ] && BACKUP_ROTATE_DAYS=4

backup_dir="${BACKUP_PATH}/$(date +%Y%m%d_%H%M%S)"

mkdir -p "${backup_dir}"

if [ -n "${BACKUP_MARIADB_DATABASE}" ]; then
    databases="${BACKUP_MARIADB_DATABASE//,/ }"
else
    databases=$(mysql -h "$BACKUP_MARIADB_HOST" -p "$BACKUP_MARIADB_PORT" -u backup \
        --defaults-file="${BACKUP_PATH}/.my.cnf" --batch -N -e "SHOW DATABASES")
fi

for database in ${databases}; do
    if [ $(echo "${database}" | grep -ce "lost\+found\|performance_schema\|information_schema") -ne 0 ]; then
        continue
    fi

    mysqldump -h "${BACKUP_MARIADB_HOST}" -p "${BACKUP_MARIADB_PORT}" -u backup \
        --defaults-file="${BACKUP_PATH}/.my.cnf" --single-transaction --quick "$database" | \
        gzip > "${backup_dir}/$database.sql.gz"
done

if [ ${BACKUP_ROTATE} -eq 1 ]; then
    find "${BACKUP_PATH}" -mindepth 1 -maxdepth 1 -type d -mtime "+${BACKUP_ROTATE_DAYS}" -print0 |
        xargs -0 -I {} /bin/rm -rf "{}"
fi
