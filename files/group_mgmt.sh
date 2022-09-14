#!/bin/bash

# takes the group name and enable disable and status as input and 
# updates the pihole gravity database accordingly
# then restarts the pihole dns and lists

# Data Monkey January 2021


case "$2" in
   "enable")
       sqlite3 /etc/pihole/gravity.db "update 'group' set 'enabled'=1 where name='$1'";
       pihole restartdns reload-lists
       ;;
   "disable")
       sqlite3 /etc/pihole/gravity.db "update 'group' set 'enabled'=0 where name='$1'";
       pihole restartdns reload-lists
       ;;
   "status")
       stat=`sqlite3 /etc/pihole/gravity.db " select enabled from 'group' where name = '$1';"`
       echo $stat
       exit 0
esac
