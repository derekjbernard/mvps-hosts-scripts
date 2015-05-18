# mvps-hosts-scripts
scripts for installing, updating, and removing the mvps hosts blacklist in /etc/hosts.
Blacklist details found here: http://winhelp2002.mvps.org/hosts.htm

__upd-hosts-mvps.sh__ installs / updates the mvps hosts file into /etc/hosts.

__rm-mvps-hosts.sh__ strips the mvps host file by matching the first line in the header and deleting to the end of the file.

__Note:__ These scripts assume the mvps blacklist is exclusively at the end of the host file.
I keep all system and custom host entries above the blacklist. Entries should not be added after the blacklist.

__Compatability:__ This will work on any *nix platform using /etc/hosts (most do). This script detects os platform and clears dns cache on OS X upto Yosemite 10.10.

__Dependancies:__ bash 3+, curl, uname
