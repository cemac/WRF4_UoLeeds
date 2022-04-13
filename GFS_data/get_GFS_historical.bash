#!/bin/bash

# shamelessly ripped from Stephan Henne, stephan.henne@empa.ch

if [ $# -ne 3 ]
then
  echo "Call with arguments <year (YYYY)> <month (MM)> <day (DD)>"
  return 1
fi

year=$1
month=$2
day=$3

dataDir=/nobackup/${USER}/WRF_data/initial_boundary_meteo/

mkdir -p $dataDir
cd $dataDir

for hour in 00 06 12 18
do

  outFile=GF${year}${month}${day}${hour}

  wget -o wget.log -O - "http://nomads.ncdc.noaa.gov/data/gfs4/${year}${month}/${year}${month}${day}/gfs_4_${year}${month}${day}_${hour}00_000.grb2" > ${outFile}_tmp

  filesize=$(/usr/bin/stat -c "%s" ${outFile}_tmp)

  if [ $filesize -gt 0 ]
  then
    mv ${outFile}_tmp ${outFile}
    echo "$outFile valid"
  else
    rm ${outFile}_tmp
    echo "$outFile has size 0"
  fi

    # use the three hour forecast inbetween
  let hour2=hour+3
  hour2=$(printf "%02d" $hour2)

  outFile=GF${year}${month}${day}${hour2}

  wget -o wget.log -O - "http://nomads.ncdc.noaa.gov/data/gfs4/${year}${month}/${year}${month}${day}/gfs_4_${year}${month}${day}_${hour}00_003.grb2" > ${outFile}_tmp

  filesize=$(/usr/bin/stat -c "%s" ${outFile}_tmp)

  if [ $filesize -gt 0 ]
  then
    mv ${outFile}_tmp ${outFile}
    echo "$outFile valid"
  else
    rm ${outFile}_tmp
    echo "$outFile has size 0"
  fi
done
