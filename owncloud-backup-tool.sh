#!/bin/bash
#
# A script to backup your ownCloud database as well as config/ and data/ directories to Amazon s3

# Load config file TODO: make this more secure
source .owncloud-backup-tool/owncloud-backup-tool.conf

# Make directory to store local backups
mkdir -p ~/owncloud-backup/database

# MySQL/MariaDB database dump
mysqldump --lock-tables -h "$host" -u "$user" --password="$password" "$db_name" > ~/owncloud-backup/database/owncloud-dbbackup_`date +"%Y%m%d"`.bak

# Locally backup the config/ and data/ directories
rsync -Aax /var/www/owncloud/config /var/www/owncloud/data ~/owncloud-backup

# Backup the database dump, config/ and data/ directories to Amazon S3
aws s3 sync ~/owncloud-backup s3://$s3_bucket_name
