#!/bin/ksh

if [ -f WPS/geo_em* ]; then
   echo "Geogrid output file(s) detected"
#   ls -lrt WPS/geo_em*
   echo "Removing Geogrid output file(s)..."
   rm  WPS/geo_em*
else
   echo "No geogrid output file(s) detected; nothing to tidy up"
fi

if [ -f WPS/met_em* ]; then
   echo "WPS met_em file(s) detected"
#   ls -lrt WPS/met_em*
   echo "Removing WPS met_em file(s)..."
   rm  WPS/met_em*
else
   echo "No WPS met_em files detected; nothing to tidy up"
fi

if [ -f WPS/FILE* ]; then
   echo "Ungrib output file(s) detected"
#   ls -lrt WPS/FILE*
   echo "Removing ungrib output files(s)..."
   rm  WPS/FILE*
else
   echo "No ungrib output files detected; nothing to tidy up"
fi

if [ -L WPS/GRIBFILE* ]; then
   echo "Grib file links detected"
#   ls -lrt WPS/GRIBFILE*
   echo "Removing Grib file links..."
   rm WPS/GRIBFILE*
else
   echo "No grib file links detected; nothing to tidy up"
fi

if [ -f WPS/*.log ]; then
   echo "WPS log files detected"
#   ls -lrt WPS/*.log
   echo "Removing WPS log files..."
   rm WPS/*.log
else
   echo "No WPS log files detected; nothing to tidy up"
fi


if [ -f WRF/test/em_real/rsl.* ]; then
   echo "WRF rsl files detected"
#   ls -lrt WRF/test/em_real/rsl.*
   echo "Removing WRF rsl files..."
   rm WRF/test/em_real/rsl.*
else
   echo "No WRF rsl files detected; nothing to tidy up"
fi

if [ -L WRF/test/em_real/met_em* ]; then
   echo "WRF met_em links detected"
#   ls -lrt WRF/test/em_real/met_em*
   echo "Removing WRF met_em links..."
   rm WRF/test/em_real/met_em*
else
   echo "No WRF met_em links detected; nothing to tidy up"
fi


if [ -f WRF/test/em_real/wrfinput_d0* ]; then
   echo "Real wrfinput file(s) detected"
#   ls -lrt WRF/test/em_real/wrfinput_d0*
   echo "Removing real wrfinput file(s)..."
   rm WRF/test/em_real/wrfinput_d0*
else
   echo "No real wrfinput file(s) detected; nothing to tidy up"
fi

if [ -f WRF/test/em_real/wrflowinp_d0* ]; then
   echo "Real wrflowinp file(s) detected"
#   ls -lrt WRF/test/em_real/wrflowinp_d0*
   echo "Removing real wrflowinp file(s)..."
   rm WRF/test/em_real/wrflowinp_d0*
else
   echo "No real wrflowinp file(s) detected; nothing to tidy up"
fi

if [ -f WRF/test/em_real/wrfbdy_d0* ]; then
   echo "Real wrfbdy file(s) detected"
#   ls -lrt WRF/test/em_real/wrfbdy_d0*
   echo "Removing real wrfbdy file(s)..."
   rm WRF/test/em_real/wrfbdy_d0*
else
   echo "No real wrfbdy file(s) detected; nothing to tidy up"
fi

echo "Done."

