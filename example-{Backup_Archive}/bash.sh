#!/bin/bash
 SRCDIR="/c/School/Semester1/sysad/to_backup/*"
 DESTDIR="/c/School/Semester1/sysad/vault_bash/"
 FILENAME=ug-$(date +%-Y%-m%-d)-$(date +%-T).tgz
 tar --create --gzip --file=$DESTDIR$FILENAME $SRCDIR