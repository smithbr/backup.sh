# backup.sh

My backup script for saving a snapshot of my laptop's `/home` and `/opt` directories to Dropbox.

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

### Restore a backup
		$ cd ~/Dropbox/Backups/mylaptop		
		$ sh restore.sh backup.tar.gz myrestore1
		
Or restore an archived backup:

		$ cd ~/Dropbox/Backups/mylaptop
		$ sh restore.sh archive/backup-000000000000.tar.gz myrestore1

Explore the backup:

		$ cd restored/myrestore1
		$ ls
		$ about.txt  home  opt
