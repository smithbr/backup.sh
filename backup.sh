#!/bin/bash
#
## Description: Backup folders
#
## Author: Brandon Smith


set -x


ROOT=.
TEMP=$HOME/.backup.sh
TIMESTAMP=$(date +%m%d%y%H%M%S)
# Archive Directory
ARCHIVE_FILE=backup-$TIMESTAMP.tar.gz
ARCHIVE_HOME=$ROOT/archive
ARCHIVE=$ARCHIVE_HOME/$ARCHIVE_FILE
# About file
ABOUT_FILE=.about
ABOUT=$TEMP/$ABOUT_FILE
# Number of old archives to keep
MAX_ARCHIVES=2
# Backup name
DESTINATION=$ROOT/backup.tar.gz
# Files and folders to backup
SOURCES=$ROOT/sources.txt
# Files and folders to exclude
EXCLUDE=$ROOT/exclude.txt


echo "Initializing..."
mkdir $TEMP || echo "TEMP directory exists."
uname -a > $ABOUT && cat /etc/issue >> $ABOUT
mv $ABOUT $ROOT/$ABOUT_FILE
echo "...Done."


echo "Cleaning up oldest backups..."
mkdir $ARCHIVE_HOME || echo "ARCHIVE directory exists."
cd $ARCHIVE_HOME
ls -tr | grep ".tar.gz" | head -n -$MAX_ARCHIVES | xargs rm -rf
cd ..
echo "...Done."


echo "Archiving previous backup..."
if [ -f $DESTINATION ]
  then
    mv $DESTINATION $ARCHIVE
  else
  	echo "No previous backups exist."
fi
echo "...Done."


echo "Creating new backup..."
tar cvpzf $DESTINATION -P --files-from=$SOURCES --exclude-from=$EXCLUDE
echo "...Done"


echo "Cleaning up..."
rm -rf $ROOT/$ABOUT_FILE
echo "...Done"


echo "Finished."
echo "New Backup Created: $DESTINATION"


if [ -f $ARCHIVE ]
  then
    echo "Archived Previous Backup: $ARCHIVE"
  else
  	echo "No previous backups exist."
fi
