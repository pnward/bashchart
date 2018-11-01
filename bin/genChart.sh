#!/bin/bash

source /home/paul/bashchart/bin/var.cfg

#Colors
#PASTELS=FFC6A5|FFFF42|DEF3BD|00A5C6|DEBDDE
RED="FF0000"
GREEN="00FF00"
BLUE="0000FF"
ORANGE="FF6600"
YELLOW="FFFF00"
PURPLE="990099"
PINK="FF6699"
BLACK="000000"
WHITE="FFFFFF"

_creategraph() {
   curl -s "https://chart.googleapis.com/chart?chtt=DiskSpace${c}_${MYHOST}&cht=ls&chd=t:${mydata}&chs=450x250&chxt=x,y,r,x&chxl=0:|${YLEDGE}1:|0|25|50|75|100|2:|0|25|50|75|100|3:|`date +%Y-%m-%d`&chco=${GREEN}" > "${CHART}"
#Debug output
#echo "https://chart.googleapis.com/chart?chtt=DiskSpace_${MYHOST}&cht=ls&chd=t:${mydata}&chs=450x250&chxt=x,y,r,x&chxl=0:|${YLEDGE}1:|0|25|50|75|100|2:|0|25|50|75|100|3:|${MONTHFULL}" 
}

#Gather Info to build chart

for c in `cat $MONITORDISK`
 do
#Get percentage Stats for hourly
#mydata=`bash $BIN_DIR/genDiskStatHR.sh` 
mydata=`bash $BIN_DIR/genDiskStatHR2.sh $c` 

if [ "$c" = "/" ]
then
CHARTNAME="root"
else
CHARTNAME=`echo $c | sed 's/^.//'`
fi
CHART=$IMG_DIR/chart-${CHARTNAME}.png

#Count number of entries via number of ","
MYCOUNT=`echo $mydata | sed 's/[^,]//g'|wc -c`
newcount=0
 while [ $MYCOUNT -gt 0 ]
  do
   newcount=$(( $newcount + 1 ))
   YLEDGE=`printf "${YLEDGE}${newcount}|"`
   MYCOUNT=$(( $MYCOUNT - 1 ))
  done
_creategraph
echo ${CHARTNAME}
done


