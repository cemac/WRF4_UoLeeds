#!/bin/bash
# WRFv4 setup script
#
# This script automates the setup of the working environment
# to enable the running of WRFv4 on ARC4
#
# Written for Juliane Schwendike's undergraduate WRF course 
# C. Dearden (CEMAC), 20/08/18
#
# Adapted by Helen Burns 2019/2023
# Invoke as follows:
# . /nobackup/WRF/Teaching/WRFv4/WRFv4_setup_env.sh
# NB - the '.' is essential to ensure that changes to the 
# environment take effect within the current shell session
# 
#
#
# Enable CEMAC modules
if [[ $- =~ "i" ]]; then
    if [ -r /nobackup/cemac/cemac.sh ] ; then
	. /nobackup/cemac/cemac.sh
    fi
fi

module load WPS
module load WRF
module load nco
module load ncl
module load ncview
module load python3
module list

# Change directory to local nobackup (/nobackup/$USER) and 
# extract the tarball for running the various test cases

export TESTDIR=/nobackup/$USER/WRFv4

# Does $TESTDIR already exist? If not, create it
if [[ ! -e $TESTDIR ]]; then 
    echo "$TESTDIR does not exist; creating now..."
    mkdir -p $TESTDIR
    cd $TESTDIR
    echo "Extracting test environment for Katrina case study..."
    tar -zxvf /nobackup/WRF/Teaching/WRFv4/WRFv4_Katrina_test_env.tar.gz >/dev/null
    echo "Done."
    echo "Extracting test environment for dummyfc case study..."
    tar -zxvf /nobackup/WRF/Teaching/WRFv4/WRFv4_dummyfc_test_env.tar.gz >/dev/null
    echo "Done."
else
    echo "$TESTDIR already exists, nothing to do"
    cd $TESTDIR
fi

