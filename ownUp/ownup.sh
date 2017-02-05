#!/bin/bash
#
# A script to backup your ownCloud database as well as config/ and data/ directories to Amazon s3

# Check system setup: Are we running Ubuntu
# If not, this shows an error and exits.
source preflight.sh

# Load config file TODO: make this more secure
source ../conf/ownup.conf

# Check if pip exists and abort if not
hash pip &> /dev/null
if [ $? -eq 1 ]
then
    echo >&2 "Error: Could not find pip"
    exit 1
fi

# Check if awscli exists and abort if not
hash aws &> /dev/null
if [ $? -eq 1 ]
then
    echo >&2 "Error: Could not find awscli pip package"
    exit 1
fi

# Make directories as needed to store local backups, no error if existing
mkdir -p ~/owncloud-backup/database

# MySQL database dump
mysqldump --lock-tables -h "$host" -u "$user" --password="$password" "$db_name" > ~/owncloud-backup/database/owncloud-dbbackup_"$(date +"%Y%m%d")".bak

# Locally backup the config/ and data/ directories
rsync -Aax /var/www/owncloud/config /var/www/owncloud/data ~/owncloud-backup

# Backup the database dump, config/ and data/ directories to Amazon S3
aws s3 sync ~/owncloud-backup s3://"$s3_bucket_name" --delete
