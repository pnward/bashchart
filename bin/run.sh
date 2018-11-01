#!/bin/bash

source /home/paul/bashchart/bin/var.cfg

[ -d $DATA_DIR/$TODAY ] || mkdir -p $DATA_DIR/$TODAY

for n in `cat ${MONITORDISK}`
do  
./getDFdata2.sh "$n"
done > $DATA_DIR/$TODAY/$HOUR.dat

#$BIN_DIR/getDFdata.sh > $DATA_DIR/$TODAY/$HOUR.dat
