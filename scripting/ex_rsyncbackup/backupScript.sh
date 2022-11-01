#!/bin/bash

SOURCE=/home/user/Documents/
DESTINATION=/media/diskid/user_backup/Documents/

echo -e "Enter desired filename for backup: "
read NAME
echo "Filename will be called: $NAME"
echo "File will be stored at: $DESTINATION"
read -p "Are you sure? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "this performs the function"
fi

# rsync --progress -avh --exclude="*.zip" --exclude="*.tar" $SOURCE $DESTINATION

# rsync -a --delete --backup --backup-dir=/path/to/backups /path/to/source destination