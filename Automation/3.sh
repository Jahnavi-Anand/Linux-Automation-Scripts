#!/bin/bash

# MySQL credentials
mysql_user="your_mysql_username"
mysql_password="your_mysql_password"

# Backup directory
backup_directory="/backup/mysql/"

# Timestamp for backup filename
backup_timestamp=$(date +"%Y%m%d_%H%M%S")

# MySQL database name
database_name="your_database_name"

# Perform MySQL backup
mysqldump -u"$mysql_user" -p"$mysql_password" "$database_name" > "$backup_directory$database_name"_"$backup_timestamp.sql"

# Move backup file to backup directory
mv "$backup_directory$database_name"_"$backup_timestamp.sql" "$backup_directory"

echo "MySQL backup taken and moved to backup directory."