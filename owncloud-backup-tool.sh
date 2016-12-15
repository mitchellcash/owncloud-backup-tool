#!/bin/bash
#
# A script to backup your ownCloud database as well as config/ and data/ directories to Amazon s3

# Load config file TODO: make this more secure
source .owncloud-backup-tool/owncloud-backup-tool.conf

# MySQL/MariaDB Database dump
mysqldump --lock-tables -h "$host" -u "$user" --password="$password" "$db_name" > owncloud-dbbackup_`date +"%Y%m%d"`.bak
