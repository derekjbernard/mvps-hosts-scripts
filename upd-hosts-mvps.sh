#! /bin/bash

sed -i.bak '/# This MVPS HOSTS file is a free download from:            #/,$d' /etc/hosts
curl http://winhelp2002.mvps.org/hosts.txt | sed $'s/\r//' >> /etc/hosts
