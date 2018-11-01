#!/bin/bash

#Get df filesystems
#get data - filesystem|used|available|percentU
for i in `df| grep -v ^Filesystem| egrep -v "\/run|sys|shm"| awk '{print $6}'|grep -v "\/dev"`
 do 
  printf "$i,"  
  df "$i"| grep -v ^Filesystem | awk '{print $3","$4","$5}'|sed 's/%//' 
 done
exit
