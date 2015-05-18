# mvps-hosts-scripts
scripts for installing, updating, and removing the mvps hosts blacklist
blacklist details found here: http://winhelp2002.mvps.org/hosts.htm

upd-hosts-mvps.sh installs / updates the mvps hosts file into /etc/hosts on my mac.
rm-mvps-hosts.sh strips the mvps host file by matching the first line in the header and deleting to the end of the file.

Note: These scripts assume the mvps blacklist is exclusively at the end of the host file.
I keep all system and custom host entries above the blacklist. Entries should not be added after the blacklist.
