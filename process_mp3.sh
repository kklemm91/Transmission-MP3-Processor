#!/usr/bin/env bash
# Transmission script to move files to post-processing

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
#                                                                               #
#################################################################################

#################################################################################
#                                    CONSTANTS                                  #
#################################################################################

# The file for logging events from this script
LOGFILE="/volume1/@appstore/transmission/var/transmission-complete.log"

# Listening directories
MUSIC_DIR="kevin@192.168.1.4:/Volumes/Media/iTunes/Automatically\ Add\ To\ iTunes/"

# Music extensions
MUSIC_EXTS[0]="mp3"

# Path to new content from transmission
TR_DOWNLOADS="$TR_TORRENT_DIR/$TR_TORRENT_NAME"

#################################################################################
#                                 SCRIPT CONTROL                                #
#################################################################################

function edate 
{
  echo "`date '+%Y-%m-%d %H:%M:%S'`    $1" >> "$LOGFILE"
}

pwd | edate
edate "hello"

function trans_check
{
  for directory in $(find "$TR_DOWNLOADS" -type d)
  do
    cd "$TR_DOWNLOADS" > /dev/null 2>&1
    cd $directory > /dev/null 2>&1
    files=$(ls *.${MUSIC_EXTS[*]} 2> /dev/null | wc -l)
    if [ $files != "0" ] 
    then
      echo "$files"
      continue
    fi
  done
}

edate "Directory is $TR_TORRENT_DIR"
edate "Torrent ID is $TR_TORRENT_ID"
edate "Torrent Hash is $TR_TORRENT_HASH"
edate "Working on the new download $TR_DOWNLOADS"

if [ "$(trans_check ${MUSIC_EXTS[*]})" ]
then
  edate "File $TR_TORRENT_NAME contains audio files!"
  cp -r "$TR_DOWNLOADS" "$MUSIC_DIR" >> "$LOGFILE" 
fi
