#!/bin/bash

#check if user if ROOT
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#install and update stuff 
apt-get update
apt-get install python
apt-get install git

#install and configure PTF
git clone https://github.com/trustedsec/ptf /opt/ptf
cd /opt/ptf && ./ptf
use modules/exploitation/install_update_all
use modules/intelligence-gathering/install_update_all
use modules/post-exploitation/install_update_all
use modules/powershell/install_update_all
use modules/vulnerability-analysis/install_update_all
cd /pentest
