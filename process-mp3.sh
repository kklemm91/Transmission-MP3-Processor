#!/bin/sh
# Author: Kevin Klemm

#################################################################################
# These are inherited from Transmission.                                        #
# Do not declare these. Just use as needed.                                     #
#                                                                               #
# TR_APP_VERSION                                                                #
# TR_TIME_LOCALTIME                                                             #
# TR_TORRENT_DIR                                                                #
# TR_TORRENT_HASH                                                               #
# TR_TORRENT_ID                                                                 #
# TR_TORRENT_NAME                                                               #
#################################################################################

#################################################################################
#                                    CONSTANTS                                  #
#################################################################################

USER="USER"
CLIENT="192.168.1.X"
FOLDER="/Volumes/iTunes/Automatically\ Add\ To\ iTunes.localized"

LOG_FILE="/volume1/@appstore/transmission/var/process-mp3.log"
DESTINATION="$USER@$CLIENT:$FOLDER"
TR_DOWNLOADS="$TR_TORRENT_DIR/$TR_TORRENT_NAME"

#################################################################################
#                                 SCRIPT CONTROL                                #
#################################################################################

edate ()
{
  echo "`date '+%Y-%m-%d %H:%M:%S'`  $1" >> $LOG_FILE
}

edate "Processing $TR_DOWNLOADS"

if [ -d "$TR_DOWNLOADS" ]; then
  for directory in $(find "$TR_DOWNLOADS" -type d); do
    cd "$TR_DOWNLOADS" > /dev/null 2>&1
    cd $directory > /dev/null 2>&1
    files=$(ls *.mp3 2> /dev/null | wc -l)
    if [ $files != "0" ]; then
      scp -p -r "$TR_DOWNLOADS" "$DESTINATION"
      break
    fi
  done
elif [ -f "$TR_DOWNLOADS" ]; then
  if [[ "$TR_DOWNLOADS" == *.mp3 ]]; then
    scp -p "$TR_DOWNLOADS" "$DESTINATION"
  fi
fi

edate "Done"

