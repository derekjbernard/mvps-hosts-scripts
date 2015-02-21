#! /bin/bash

sed -i.bak '/# This MVPS HOSTS file is a free download from:            #/,$d' /etc/hosts
