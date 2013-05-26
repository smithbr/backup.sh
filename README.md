# backup.sh

My backup script.

## Setup
		$ git clone git@github.com:smithbr/backup.sh.git
		$ mkdir ~/Dropbox/Backups/mylaptop
		$ cp backup.sh/* ~/Dropbox/Backups/mylaptop
		$ rm -rf backup.sh

## Choose what to back up

### Add desired backup files and folders to `sources.txt`

### Add excluded files and folders to `exclude.txt`

## Run

### Add an alias to your `.bashrc`
		# Backup my laptop
		alias dobackup='cd $HOME/Dropbox/Backups/mylaptop && sh backup.sh'

### Start backup
		$ source ~/.bashrc
		$ dobackup
