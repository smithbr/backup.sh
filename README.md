# backup.sh

My backup script.

### Install
		$ git clone git@github.com:smithbr/backup.sh.git
		$ mkdir ~/Dropbox/Backups/mylaptop
		$ cp backup.sh/* ~/Dropbox/Backups/mylaptop
		$ rm -rf backup.sh

### Add an alias to your `.bashrc`:
		# Backup my laptop
		alias dobackup='cd $HOME/Dropbox/Backups/mylaptop && sh backup.sh'

### Run
		$ source ~/.bashrc
		$ dobackup
