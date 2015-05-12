#!/bin/bash
a=`date +%F`
fmp3=printre_stele_$a.mp3
echo $fmp3
streamripper http://www.romania-actualitati.ro/romania-actualitati-live.m3u -a /home/pi/stele/"$fmp3" -l 2800
smbclient //192.168.0.125/public -Uuser_nas%***** -c "put $fmp3 stele/$fmp3"
if [ $? -eq 0 ]; then
 rm $fmp3
 echo $fmp3 >>ok.stat
else
 echo $fmp3 >>fail.stat
fi
