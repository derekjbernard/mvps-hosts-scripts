#! /bin/bash

# mvps hosts first line of header
mvpsheader='# This MVPS HOSTS file is a free download from:            #'

# from /etc/hosts delete $mvpsheader to end of file leaving any prior entries
# leaves an unmodified backup with .bak extension (backup required in os x sed)
sed -i.bak "/$mvpsheader/,\$d" /etc/hosts

# Get platform (e.g OS X = Darwin)
unamestr=`uname`

# check if platform is Darwin (Apple Mac OS X) then clear dns cache
if [[ "$unamestr" == 'Darwin' ]]; then
    
    # get OS X major  and minor versions
    osvermajor=`sw_vers -productVersion | awk -F '.' '{print $2}'`
    osverminor=`sw_vers -productVersion | awk -F '.' '{print $3}'`
    
    # Yosemite 10.10.0 - 10.10.3 used discoveryutil to clears dns cache
    # in 10.10.4 they went back to the methods used previously.
    # previous versions used dscacheutil and / or mDNSResponder
    # http://osxdaily.com/2014/11/20/flush-dns-cache-mac-os-x/
    # http://osxdaily.com/2008/03/21/how-to-flush-your-dns-cache-in-mac-os-x/
    
    if [[ "$osvermajor" == 10 ]] && [[ "$osverminor" -le 3 ]]; then
        discoveryutil mdnsflushcache
        discoveryutil udnsflushcaches
    else
        dscacheutil -flushcache
        killall -HUP mDNSResponder;
    fi
fi
