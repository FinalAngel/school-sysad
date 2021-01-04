#!/bin/bash
# The file or directory to backup
SRCDIR=./bash/source/
# The location to store the backups in
DESTDIR=./bash/target/
# The maximum amount of backups to have in BACKUP_DIRECTORY
MAXBACKUPS=5

FILENAME=backup_$(date "+%Y%m%d%H%M%S%s").tgz

# Validate the backup directory exists and create if required
if [ ! -d $DESTDIR ]; then
  mkdir $DESTDIR
fi

cd $DESTDIR
# Enforce max backups and delete oldest if there will be too many after the new backup
ls -1t | tail -n +$($MAXBACKUPS) | xargs rm

# Create zip file (for both file and folder options)
#cfz -> c = create, f = file, z = gzip
tar cfz $DESTDIR$FILENAME -C $(dirname $SRCDIR) $(basename $SRCDIR)

ls -1t ./
