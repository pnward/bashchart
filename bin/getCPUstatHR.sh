#!/bin/bash

source /home/paul/bashchart/bin/var.cfg 

grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}' >> $DATA_DIR/$TODAY/cpuStats.dat

#Display CPU free 
#awk -v oldidle=$(awk '/cpu / {print $5}' /proc/stat; sleep 1) '/cpu / {perc=100-($5-oldidle)/100 ; printf "%s", perc}' /proc/stat
