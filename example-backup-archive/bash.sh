#!/bin/bash
SRCDIR=./bash/source/ # The file or directory to backup
DESTDIR=./bash/target/ # The location to store the backups in
MAXBACKUPS=5 # The maximum amount of backups to have in BACKUP_DIRECTORY
FILENAME=backup_$(date "+%Y%m%d%H%M%S").tgz # Filename

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