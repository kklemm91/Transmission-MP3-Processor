# Transmission-Post-Processor

This is a script for adding mp3 files to the Automatically Add to iTunes folder when Transmission on Synology completes a download

Instructions

0. Create an SSH key between the transmission user on the server and the iTunes client, this ensures we do not have to supply a password when we call scp

1. Stop Transmission on the Synology device

2. Copy process-mp3.sh to /volume1/@appstore/transmission/var/ on your Synology device, logs will be saved to process_mp3.log in this directory

3. Edit settings.json in that same directory and set "script-torrent-done-filename" to the full filepath of this script

4. Save and Exit

5. Start Transmission on the Synology device

When Transmission on Synology completes a download with an mp3, it will transfer to your iTunes library
