#!/bin/bash

# based Stephan Henne, stephan.henne@empa.ch script

if [ $# -ne 4 ]
then
  echo "Call with arguments <year (YYYY)> <month (MM)> <day (DD)> <hour (HH)>"
  return 1
fi

year=$1
month=$2
day=$3
hour=$4

dataDir=/nobackup/$USER/wrf_data/initial_boundary_meteo/

mkdir -p $dataDir
cd $dataDir

# get current forecast

for addhour in $(seq -w 0 3 192)
do
  fcstYear=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%Y")
  fcstMonth=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%m")
  fcstDay=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%d")
  fcstHour=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%H")

  outFile=gfs${fcstYear}${fcstMonth}${fcstDay}${fcstHour}

  wget -o wget.log -O - "http://nomads.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.${year}${month}${day}/${hour}/atmos/gfs.t${hour}z.pgrb2.0p25.f${addhour}" > ${outFile}_tmp

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
