#!/bin/bash

#Get df filesystems
#get data - filesystem|used|available|percentU

PARTITION="$1"

#for i in `df| grep -v ^Filesystem| egrep -v "\/run|sys|shm"| awk '{print $6}'|grep -v "\/dev"`
# do 
#  printf "$i,"  
  df "$PARTITION"| grep -v ^Filesystem | awk '{print $6","$3","$4","$5}'|sed 's/%//' 
# done
exit
