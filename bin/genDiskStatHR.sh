#!/bin/bash

source /home/paul/bashchart/bin/var.cfg

if [ -f $TMPDATA/array.tmp ]; then
  rm -f $TMPDATA/array.tmp
fi

counter=0
for x in `find $DATA_DIR/$TODAY -type f ! -name "cpuStats.dat"` 
 do
 NUMDAT=`cat $x | grep "/,"| cut -d"," -f4`
  printf "${NUMDAT}," >> $TMPDATA/array.tmp
   counter=$((counter+1))
 done

cat $TMPDATA/array.tmp|sed s'/.$//'
echo ""
export MYCOUNT=$counter
