# Author: Kevin Klemm
# Script for adding mp3 files to iTunes on then client machine when downloaded from a Synology server running Transmission

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
USERNAME="kevin"
CLIENT="192.168.1.4"
ITUNES_DIR="/Volumes/Media/iTunes/Automatically\ Add\ To\ iTunes.localized/"

# These can be left alone
DESTINATION="$USERNAME@$CLIENT:$ITUNES_DIR"
LOGFILE="/volume1/@appstore/transmission/var/process_mp3.log"
TR_DOWNLOADS="$TR_TORRENT_DIR/$TR_TORRENT_NAME"

#################################################################################
#                                 SCRIPT CONTROL                                #
#################################################################################

function edate 
{
  echo "`date '+%Y-%m-%d %H:%M:%S'`    $1" >> "$LOGFILE"
}

edate "Processing $TR_DOWNLOADS"

if [ -d "$TR_DOWNLOADS" ]; then
  for directory in $(find "$TR_DOWNLOADS" -type d); do
    cd "$TR_DOWNLOADS" > /dev/null 2>&1
    cd $directory > /dev/null 2>&1
    files=$(ls *.mp3 2> /dev/null | wc -l)
    if [ $files != "0" ]; then
      chown "$USERNAME":staff "$TR_DOWNLOADS"
      chmod 777 "$TR_DOWNLOADS"
      scp -p -r "$TR_DOWNLOADS" "$DESTINATION" >> $LOGFILE
      break
    fi
  done
elif [ -f "$TR_DOWNLOADS" ]; then
  if [[ "$TR_DOWNLOADS" == *.mp3 ]]; then
    chown "$USERNAME":staff "$TR_DOWNLOADS"
    chmod 777 "$TR_DOWNLOADS"
    scp -p "$TR_DOWNLOADS" "$DESTINATION" >> $LOGFILE
  fi
fi

edate "Finished"
