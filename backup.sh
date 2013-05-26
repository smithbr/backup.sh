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
# Destination directory
DESTINATION=$ROOT/backup.tar.gz
DESTINATION_TEMP=$ROOT/backup_tmp.tar.gz
# Backup folders
SOURCES_FILE=$ROOT/sources.txt
# Lists files and folders to exclude from sources
EXCLUDE_FILE=$ROOT/exclude.txt


# Remove leftover temporary files
echo "Cleaning..."
if [ -f $DESTINATION_TEMP ]
  then
    echo "rm $DESTINATION_TEMP"
    rm $DESTINATION_TEMP
fi
echo "...Done."

echo ""
# Archive the last backup
echo "Archiving..."
if [ -f $DESTINATION ]
  then
    echo "mv $DESTINATION $ARCHIVE"
    mv $DESTINATION $ARCHIVE
fi
echo "...Done."

echo ""
# Back up the source folders to a temporary archive
echo "Starting..."
echo "tar cvpzf $DESTINATION_TEMP -P --files-from=$SOURCES_FILE --exclude-from=$EXCLUDE_FILE"
tar cvpzf $DESTINATION_TEMP -P --files-from=$SOURCES_FILE --exclude-from=$EXCLUDE_FILE
echo "...Done"

echo ""
# Create the backup archive
echo "Creating..."
echo "cp $DESTINATION_TEMP $DESTINATION"
cp $DESTINATION_TEMP $DESTINATION
echo "rm $DESTINATION_TEMP"
rm $DESTINATION_TEMP
echo "...Done"

echo ""
# Delete older archives
echo "Cleaning up..."
echo "cd $ARCHIVE_DIR"
cd $ARCHIVE_DIR
echo "ls -tr | head -n -$MAX_ARCHIVES | xargs rm -rf"
ls -tr | head -n -$MAX_ARCHIVES | xargs rm -rf
echo "cd "$ROOT
cd $ROOT
echo "...Done."

echo ""
echo "Finished."
echo "Backup: $DESTINATION"
echo "Archive: $ARCHIVE"
echo ""
