#!/bin/bash

source /home/paul/bashchart/bin/var.cfg

#Test for $1 var
if [ -z "$1" ]
then 
exit 
fi

#Work around for / naming"
if [ "$1" = "/" ] 
then
 DISK="/,"
else
 DISK="$1"
fi

if [ -f $TMPDATA/array.tmp ]; then
  rm -f $TMPDATA/array.tmp
fi

counter=0
for x in `find $DATA_DIR/$TODAY -type f ! -name "cpuStats.dat"` 
 do
 NUMDAT=`cat $x | grep "$DISK"| cut -d"," -f4`
  printf "${NUMDAT}," >> $TMPDATA/array.tmp
   counter=$((counter+1))
 done

cat $TMPDATA/array.tmp|sed s'/.$//'
echo ""
export MYCOUNT=$counter
