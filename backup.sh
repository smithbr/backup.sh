#!/bin/bash
#
## Description: Backup folders
#
## Author: Brandon Smith


ROOT=.
TIMESTAMP=$(date +%m%d%y%H%M%S)
# Archive Directory
ARCHIVE_FILE=backup-$TIMESTAMP.tar.gz
ARCHIVE_DIR=$ROOT/archive
ARCHIVE=$ARCHIVE_DIR/$ARCHIVE_FILE
# Number of old archives to keep
MAX_ARCHIVES=2
DESTINATION=$ROOT/backup.tar.gz
# Backup folders
SOURCES_FILE=$ROOT/sources.txt
# Lists files and folders to exclude from sources
EXCLUDE_FILE=$ROOT/exclude.txt


echo ""

echo "Initializing..."
mkdir $ARCHIVE_DIR || echo "Archive directory exists."
echo "...Done."

echo ""

echo "Cleaning up oldest backups..."
cd $ARCHIVE_DIR
ls -tr | grep ".tar.gz" | head -n -$MAX_ARCHIVES | xargs rm -rf
cd ..
echo "...Done."

echo ""

echo "Archiving previous backup..."
if [ -f $DESTINATION ]
  then
    mv $DESTINATION $ARCHIVE
fi
echo "...Done."

echo ""
# Back up source folders to temporary archive
echo "Creating new backup..."
tar cvpzf $DESTINATION -P --files-from=$SOURCES_FILE --exclude-from=$EXCLUDE_FILE
echo "...Done"

echo ""
echo "Finished."
echo "New Backup Created: $DESTINATION"
echo "Archived Previous Backup: $ARCHIVE"
echo ""
