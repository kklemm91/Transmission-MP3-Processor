# Transmission-Post-Processor

This is a script for adding mp3 files to the Automatically Add to iTunes folder when Transmission on Synology completes a download

Instructions


1. Stop Transmission on the Synology device

2. Copy process-mp3.sh to /volume1/@appstore/transmission/var/ on your Synology device

3. In that same directory, edit settings.json and set "script-torrent-done-filename" to "/volume1/@appstore/transmission/var/process-mp3.sh"

4. Save and Exit

5. If you'd like to enable logging, create a file in this directory called process-mp3.log

6. Start Transmission on the Synology device

7. When Transmission on Synology completes a download with an mp3 in it, it will be moved to the designated iTunes library
