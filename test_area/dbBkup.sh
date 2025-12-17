#!/bin/bash
# Set the backup directory with the current date as the subfolder name
DIR=$(date +%d-%m-%y)
DEST=~/db_backups/$DIR
mkdir -p $DEST

# Replace the placeholders with your MySQL server details
MYSQL_HOST="127.0.0.1"
MYSQL_USER="admin"
MYSQL_PASSWORD="canonmkII0x0"
DATABASE_NAME="mushborg"

# Use mysqldump to create a SQL backup file
mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $DATABASE_NAME > dbBkup/dbbackup.sql