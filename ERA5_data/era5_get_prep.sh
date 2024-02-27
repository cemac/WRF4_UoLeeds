#!/bin/bash -
#title          :era5_get_prep.sh
#description    :Helen
#author         :CEMAC - Download and preprocess ERA5 data
#date           :20190807
#version        :1.0
#usage          :./era5_get_prep.sh
#notes          :
#bash_version   :4.2.46(2)-release
#============================================================================

# defaults
DATADIR=/nobackup/$USER/WRFv4/DATA/ERA5

pre=true
unset_pre() {
  pre=false
}

print_usage() {
  echo "
 era5_get_prep

 A CEMAC script to download and preprocess ERA5 data for WRF

 Usage:
 ./era5_get_prep.sh -a 20170419 -z 20170420 -n 90 -w 0 -s -30 -e 180

  downloads relevant fields and makes them wrf ready

 Options:
  -a <date1> YYYYMMDD
  -z <date2> YYYYMMDD
  -n <north> degrees north
  -w <west> degrees west
  -s <south> degrees south
  -e <east> degrees east
  ** Optional args
  - c <path to this script and python scripts GetERA5*.py> defaults to
        /nobackup/$USER/PEGASUS/PEGASUS-HighRes-WRF/Leeds_High_Res/ERA5
  - d < path to data dir (where you store WPS data)> defaults to
      /nobackup/$USER/WRFv4/DATA/ERA5/
  -p turns off preprocessing

  "
}
while getopts 'a:z:n:w:s:e:c:d:ph' flag; do
  case "${flag}" in
    a) date1="${OPTARG}" ;;
    z) date2="${OPTARG}" ;;
    n) north="${OPTARG}" ;;
    w) west="${OPTARG}" ;;
    s) south="${OPTARG}" ;;
    e) east="${OPTARG}" ;;
    d) DATADIR="${OPTARG}" ;;
    p) unset_pre ;;
    h) print_usage
      exit 1 ;;
    *) print_usage
      exit 1 ;;
  esac
done
#
# a,z,n,w,s,e are required
#
#
if [ "x" == "x$date1" ]; then
  echo "-a [start date YYYYMMDD] is required"
  exit 1
fi
if [ "x" == "x$date2" ]; then
  echo "-z [end date YYYYMMDD] is required"
  exit 1
fi
if [ "x" == "x$north" ]; then
  echo "-n [Lat: (northern extent)] is required"
  exit 1
fi
if [ "x" == "x$south" ]; then
  echo "-s [Lat: (southern extent)] is required"
  exit 1
fi
if [ "x" == "x$east" ]; then
  echo "-e [Lon: (eastern extent)] is required"
  exit 1
fi
if [ "x" == "x$west" ]; then
  echo "-w [Lon: (western extent)] is required"
  exit 1
fi

echo "Downloading -N $north -W $west -S $south -E $east for $date1 to $date2"

# Extract compents of date
YY1=`echo $date1 | cut -c1-4`
MM1=`echo $date1 | cut -c5-6`
DD1=`echo $date1 | cut -c7-8`
YY2=`echo $date2 | cut -c1-4`
MM2=`echo $date2 | cut -c5-6`
DD2=`echo $date2 | cut -c7-8`

echo 'downloading surface data...'
./GetERA5-sfc.py $date1 $date2 --N $north --W $west --S $south --E $east
echo 'downloading model level data'
./GetERA5-ml.py $date1 $date2 --N $north --W $west --S $south --E $east

echo 'moving data to year archive in '${DATADIR}
# Check folder structure exists
if [ ! -e ${DATADIR} ] ; then
  mkdir -p ${DATADIR}
fi
if [ ! -e ${DATADIR}/$YY1/$MM1 ] ; then
  mkdir -p ${DATADIR}/$YY1/$MM1
fi
# cp test for now
if cp ERA5-${date1}-${date2}-sfc.grb ERA5-${date1}-${date2}-ml.grb ${DATADIR}/$YY1/$MM1 ; then
  echo "preprocessing (REQUIRES ECCODES) "
else
  echo "grb files not downloaded successfully"
  exit 0
fi

cd ${DATADIR}/$YY1/$MM1
echo 'write "[centre]_[dataDate]_[dataType]_[levelType]_[step].grib[edition]";' > split.rule
if grib_filter split.rule ERA5-${date1}-${date2}-sfc.grb ; then
  echo "preprocessing model level data"
else
  echo "failed! try: conda install -c conda-forge eccodes "
  exit 0
fi
grib_set -s deletePV=1,edition=1 ERA5-${date1}-${date2}-ml.grb ERA5-${date1}-${date2}-ml.grib1
grib_filter split.rule ERA5-${date1}-${date2}-ml.grib1
# If you want to delete original files, you can uncomment the following line.
if [ -e ERA5-${date1}-${date2}-ml.grib1 ]; then
  rm -f *ml.grb ERA5-${date1}-${date2}-ml.grib1
  rm -f *sfc.grb
  rm -f split.rule
fi

exit 0
