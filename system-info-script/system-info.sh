#!/bin/bash

TARGET="${1:-$HOME}"
user=whoami
up=uptime
ram=free -h
disk= df -h 
host=hostname
for user in "$TARGET"
	do
		echo "welcome $user" 
		echo "you are using  host $host"
	       echo "Currently you have been up since $up"
               echo "for your information, here is your RAM and disk usage"
	       echo "$ram && $disk"
       done
              	       
