#!/bin/bash
#
# A script to backup your ownCloud database as well as config/ and data/
# directories to Amazon s3.

# Variables
# TODO: allow user to select their own path to a config file
config_path="$HOME/.ownup/ownup.conf"

# Load functions
source $HOME/ownup/ownUp/functions.sh

# Check system setup: Are we running as root on Ubuntu
# If not, this shows an error and exits.
source $HOME/ownup/ownUp/preflight.sh

# Check if a config file exists, if not create one from user input
if [ ! -f $HOME/.ownup/ownup.conf ]; then
  mkdir -p $HOME/.ownup
  read -p 'Amazon S3 bucket name: ' s3_bucket_name_var
  read -p 'MySQL host: ' mysql_host_var
  read -p 'MySQL user: ' mysql_user_var
  read -p 'MySQL password: ' mysql_password_var
  read -p 'MySQL database name: ' mysql_db_name_var

  echo "s3_bucket_name="'"'$s3_bucket_name_var'"' > $HOME/.ownup/ownup.conf
  echo "mysql_host="'"'$mysql_host_var'"' >> $HOME/.ownup/ownup.conf
  echo "mysql_user="'"'$mysql_user_var'"' >> $HOME/.ownup/ownup.conf
  echo "mysql_password="'"'$mysql_password_var'"' >> $HOME/.ownup/ownup.conf
  echo "mysql_db_name="'"'$mysql_db_name_var'"' >> $HOME/.ownup/ownup.conf
fi

# Load config file TODO: make this more secure?
source $config_path

# Check if pip exists and abort if not
# TODO: install pip for user if not exist
$(install_check pip)

# Check if awscli exists and abort if not
# TODO: install awscli for user if not exist
$(install_check aws)

# Make directories as needed to store local backups, no error if existing
mkdir -p ~/owncloud-backup/database

# MySQL database dump
mysqldump --lock-tables -h "$mysql_host" -u "$mysql_user" --password="$mysql_password" "$mysql_db_name" > ~/owncloud-backup/database/owncloud-dbbackup_"$(date +"%Y%m%d")".bak

# Locally backup the config/ and data/ directories
rsync -Aax /var/www/owncloud/config /var/www/owncloud/data ~/owncloud-backup

# Backup the database dump, config/ and data/ directories to Amazon S3
aws s3 sync ~/owncloud-backup s3://"$s3_bucket_name" --delete
