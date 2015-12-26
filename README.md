# Transmission-Post-Processor

This is a script for adding mp3 files to the Automatically Add to iTunes folder when Transmission on Synology completes a download

Instructions


1. Stop Transmission on the Synology device

2. Copy process-mp3.sh to /volume1/@appstore/transmission/var/ on your Synology device

3. Edit settings.json in that same directory and set "script-torrent-done-filename" to the full filepath of this script

4. Save and Exit

5. Start Transmission on the Synology device

6. If you'd like to enable logging, create a file in the script directory called process-mp3.log

When Transmission on Synology completes a download with an mp3, it will transfer to your iTunes library
