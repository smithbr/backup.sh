# backup.sh

My backup script for storing a snapshot of my `/home` and `/opt` directories on my laptop.

## Setup a new backup
		$ git clone git@github.com:smithbr/backup.sh.git
		$ mkdir ~/Dropbox/Backups/mylaptop
		$ cp backup.sh/* ~/Dropbox/Backups/mylaptop
		$ rm -rf backup.sh

## Choose what to back up

Add files and folders to backup to `sources.txt`

Add files and folders to exclude to `exclude.txt`

## Run

### Add an alias to `~/.bashrc`
		# Backup my laptop
		alias dobackup='cd $HOME/Dropbox/Backups/mylaptop && sh backup.sh'

### Start backup
		$ source ~/.bashrc
		$ dobackup
