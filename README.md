# Transmission-Post-Processor

This is a script for adding mp3 files to the Automatically Add to iTunes folder when Transmission on Synology completes a download

### Instructions

1. Create an SSH key between the transmission user on the server and the iTunes client, this ensures we do not have to supply a password when we call scp

2. Stop Transmission on the Synology device

3. Copy process-mp3.sh to /volume1/@appstore/transmission/var/ on your Synology device, logs will be saved to process_mp3.log in this directory

4. Edit process_mp3.sh and plug in all your relevant user/directory information

5. Edit settings.json in that same directory and set "script-torrent-done-filename" to the full filepath of this script

6. Save and Exit

7. Start Transmission on the Synology device

When Transmission on Synology completes a download with an mp3, it will transfer to your iTunes library. I use this in combination with [Remote Torrent Adder](https://chrome.google.com/webstore/detail/remote-torrent-adder/oabphaconndgibllomdcjbfdghcmenci?hl=en) plugin for Chrome to create a 1-click workflow that imports to itunes on-demand
