#!/bin/bash
USER="16361"
DATE=$(date +"%Y-%m-%d-%H")
SERVER="ch-s010.rsync.net"
DIRECTORY="xps13"
HOME="/home/user"

DIRS="$HOME/Writing
$HOME/Projects
$HOME/resources
$HOME/random
$HOME/Public
$HOME/Mail
$HOME/pdfs
$HOME/work
$HOME/docs
$HOME/keys
$HOME/websites
$HOME/Pictures
$HOME/3dprint
$HOME/Documents
$HOME/text
$HOME/images
$HOME/scripts"

EXCLUDE="$HOME/Projects/ABANDONED
$HOME/Projects/ARCHIVED
$HOME/work/ARCHIVED"

EXCLUDEFILE=$(mktemp)

DU_CMD="du -sb -c"
while read -r excludePath; do
    DU_CMD="$DU_CMD $excludePath*"
    echo "re:^$excludePath" >> $EXCLUDEFILE
done <<< "$EXCLUDE"

DIRS_ARG=""
while read -r includePath; do
    DIRS_ARG="$DIRS_ARG $includePath"
done <<< "$DIRS"

COMMAND="borg create --exclude-from $EXCLUDEFILE -p $USER@$SERVER:$DIRECTORY::$DATE $DIRS_ARG"

echo "Total size of backup directory..."
TOTAL_SIZE=$(du -sb $DIRS_ARG | cut -f1 | awk '{s+=$1} END {print s}')
echo "$(numfmt --to=iec --suffix=B $TOTAL_SIZE)"

echo "Excluded directories:"
cat $EXCLUDEFILE

echo "Total size of excluded directories..."
EXCLUDED_SIZE=$(eval $DU_CMD | tail -1 | cut -f1 | tr -d '[:space;]')
echo "$(numfmt --to=iec --suffix=B $EXCLUDED_SIZE)"

MAX_SIZE=$(expr $TOTAL_SIZE - $EXCLUDED_SIZE)

echo "Expected maximum backup size..."
echo $(numfmt --to=iec --suffix=B $MAX_SIZE)

echo "Proceeding to back up:"
echo $COMMAND

read -rsp $'Press ENTER to continue...\n'
eval $COMMAND

