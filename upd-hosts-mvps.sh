#! /bin/bash

# mvps hosts first header line
mvpsheader='# This MVPS HOSTS file is a free download from:            #'

# from /etc/hosts delete $mvpsheader to end of file leaving any prior entries
# leaves an unmodified backup with .bak extension (backup required in os x sed)
sed -i.bak "/$mvpsheader/,\$d" /etc/hosts

# download mvps hosts file, pipe to awk only printing from $mvpsheader to end of file 
# this ensures $mvpsheader is present and will be the first line appended
# remove any carrage return characters (stripping windows line endings)
# append results to /etc/hosts
curl http://winhelp2002.mvps.org/hosts.txt | awk "/^$mvpsheader/,0" | sed $'s/\r//' >> /etc/hosts

# Get platform (e.g OS X = Darwin)
unamestr=`uname`

# check if platform is Darwin (Apple Mac OS X) and if so clear dns cache
if [[ "$unamestr" == 'Darwin' ]]; then

        # get OS X version add major version, e.g. OS X 10.10 = 10+10=20
        osverint=`sw_vers -productVersion | awk -F '.' '{print $1 + $2}'`

        # Yosemite clears dns cache differently than previous versions
        # if greater or equal to yosemite (20) then use new way, else use old way
        if [[ "$osverint" -ge 20 ]]; then
                discoveryutil mdnsflushcache;
        else
                dscacheutil -flushcache
                killall -HUP mDNSResponder;
        fi
fi
