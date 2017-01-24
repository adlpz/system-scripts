#!/bin/bash
USER="16361"
DATE=$(date +"%Y-%m-%d-%H")
SERVER="ch-s010.rsync.net"
DIRECTORY="xps13"

borg create -p $RSYNC_USER@$SERVER:$DIRECTORY::$DATE ~ --exclude ~/Downloads
