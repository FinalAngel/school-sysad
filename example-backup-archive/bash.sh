#!/bin/bash
SRCDIR=~/Dokumente/FHNW/Semster1/sysad/source/
DESTDIR=~/Dokumente/FHNW/Semster1/sysad/target/
FILENAME=backup_$(date "+%Y%m%d%H%M%S%s").tgz
MAXBACKUPS=5

#Check if directory exists
if [ ! -d $DESTDIR ]; then
  mkdir $DESTDIR
fi

#Create archive
#cfz -> c = create, f = file, z = gzip
tar cfz $DESTDIR$FILENAME -C $(dirname $SRCDIR) $(basename $SRCDIR)

#Remove old archives
cd $DESTDIR
ls -tr | head -n -$MAXBACKUPS | xargs --no-run-if-empty rm 