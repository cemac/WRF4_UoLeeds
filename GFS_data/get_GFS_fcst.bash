#!/bin/bash

# shamelessly ripped from Stephan Henne, stephan.henne@empa.ch

if [ $# -ne 4 ]
then
  echo "Call with arguments <year (YYYY)> <month (MM)> <day (DD)> <hour (HH)>"
  return 1
fi

year=$1
month=$2
day=$3
hour=$4

dataDir=/nobackup/${USER}/WRF_data/initial_boundary_meteo/

mkdir -p $dataDir
cd $dataDir

# get current forecast

for addhour in $(seq -w 0 3 192)
do
  fcstYear=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%Y")
  fcstMonth=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%m")
  fcstDay=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%d")
  fcstHour=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%H")

  outFile=GF${fcstYear}${fcstMonth}${fcstDay}${fcstHour}

  wget -o wget.log -O - "http://nomads.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.${year}${month}${day}${hour}/g
fs.t${hour}z.pgrb2.0p25.f${addhour}" > ${outFile}_tmp

  filesize=$(/usr/bin/stat -c "%s" ${outFile}_tmp)

  if [ $filesize -gt 0 ]
earhbu@login1-arc4: more /nobackup/WRFChem/download_and_find_gfs_mz4/get_GFS_fcst.bash
#!/bin/bash

# shamelessly ripped from Stephan Henne, stephan.henne@empa.ch

if [ $# -ne 4 ]
then
  echo "Call with arguments <year (YYYY)> <month (MM)> <day (DD)> <hour (HH)>"
  return 1
fi

year=$1
month=$2
day=$3
hour=$4

dataDir=/nobackup/username/wrf3.7.1_data/initial_boundary_meteo/

mkdir -p $dataDir
cd $dataDir

# get current forecast

for addhour in $(seq -w 0 3 192)
do
  fcstYear=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%Y")
  fcstMonth=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%m")
  fcstDay=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%d")
  fcstHour=$(date -u --date="${year}-${month}-${day} ${hour}:00:00 UTC +${addhour} hours" "+%H")

  outFile=GF${fcstYear}${fcstMonth}${fcstDay}${fcstHour}

  wget -o wget.log -O - "http://nomads.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.${year}${month}${day}${hour}/gfs.t${hour}z.pgrb2.0p25.f${addhour}" > ${outFile}_tmp

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
