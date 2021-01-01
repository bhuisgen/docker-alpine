#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

[ -z "${BACKUP_PATH}" ] && BACKUP_PATH="/var/backups"
[ -z "${BACKUP_POSTGRESQL_HOST}" ] && BACKUP_POSTGRESQL_HOST="postgresql"
[ -z "${BACKUP_POSTGRESQL_PORT}" ] && BACKUP_POSTGRESQL_PORT=5432
[ -z "${BACKUP_ROTATE}" ] && BACKUP_ROTATE=1
[ -z "${BACKUP_ROTATE_DAYS}" ] && BACKUP_ROTATE_DAYS=4

backup_dir="${BACKUP_PATH}/$(date +%Y%m%d_%H%M%S)"

mkdir -p "${backup_dir}"

export PGPASSFILE="${BACKUP_PATH}/.pgpass"

if [ -n "${BACKUP_POSTGRESQL_DATABASE}" ]; then
    databases="${BACKUP_POSTGRESQL_DATABASE//,/ }"
else
    databases=$(psql -h "${BACKUP_POSTGRESQL_HOST}" -p "${BACKUP_POSTGRESQL_PORT}" -U backup \
        -c "SELECT datname FROM pg_database;" -t postgres)

    pg_dumpall -h "${BACKUP_POSTGRESQL_HOST}" -p "${BACKUP_POSTGRESQL_PORT}" -U backup -r | gzip > \
        "${backup_dir}/roles.sql.gz"
fi

for database in ${databases}; do
    if [ $(echo "${database}" | grep -ce "template0\|postgres") -ne 0 ]; then
        continue
    fi

    pg_dump -h "${BACKUP_POSTGRESQL_HOST}" -p "${BACKUP_POSTGRESQL_PORT}" -U backup -Fc -Z1 "${database}" > \
        "${backup_dir}/${database}.pgdmp"
done

if [ ${BACKUP_ROTATE} -eq 1 ]; then
    find "${BACKUP_PATH}" -mindepth 1 -maxdepth 1 -type d -mtime "+${BACKUP_ROTATE_DAYS}" -print0 |
        xargs -0 -I {} /bin/rm -rf "{}"
fi
