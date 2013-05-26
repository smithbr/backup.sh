# backup.sh

My backup script.

### Install
		$ git clone git@github.com:smithbr/backup.sh.git

### Set up
		$ mkdir ~/Dropbox/Backups/mylaptop && cp backup.sh/* ~/Dropbox/Backups/mylaptop

### Add an alias to your `.bashrc`:
		# Backup my laptop
		export BACKUP_HOME=$HOME/Dropbox/Backups/mylaptop
		alias dobackup='sh $BACKUP_HOME/backup.sh'

### Usage
		$ source ~/.bashrc
		$ dobackup

### About this backup
		$ uname -a
		Linux T430s 3.8.0-21-generic #32-Ubuntu SMP Tue May 14 22:17:37 UTC 2013
		i686 i686 i686 GNU/Linux

		$ cat /etc/issue
		Ubuntu 13.04 \n \l
