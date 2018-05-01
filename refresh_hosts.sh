#! /bin/bash

#create original copy if not already done
#otherwise reload oringal version
if [ -e /etc/hosts_original ] 
then 
	sudo cp /etc/hosts_original /etc/hosts
else
	sudo cp /etc/hosts /etc/hosts_original
fi
sudo cat /home/paul/Dropbox/local_hosts >> /etc/hosts
