#!/bin/bash

BACKUP_DIR="/opt/mysql_backup"
DB_NAME="shop_db"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.sql"


mkdir -p ${BACKUP_DIR}
mysqldump -u root --databases ${DB_NAME} > ${BACKUP_FILE}
find ${BACKUP_DIR} -type f -mtime +62 -delete #deleting old backups

