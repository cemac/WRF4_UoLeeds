#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
..moduleauthor: Helen (CEMAC)
    Adapted from dreambooker.site initializing WRF from ERA5

..description: Download surface fields.
    :copyright: © 2019 University of Leeds.
..usage:
    GetERA5-sfc 20170419 20170420 -n 90 -w 0 -S -30 -e 180

..args: START, END, North, West, Sout, East

..Requirements: cdsapi, grib_api, credentials for cds
            [cds api intructions](https://cds.climate.copernicus.eu/api-how-to)

"""

import cdsapi
import argparse

hstring = ("Date string, format YYYYMMDD")
hstring2 = ("North, South, East, West values")
parser = argparse.ArgumentParser()
parser.add_argument("date1", help=hstring, type=str)
parser.add_argument("date2", help=hstring, type=str)
parser.add_argument("--N", help=hstring2, type=str)
parser.add_argument("--S", help=hstring2, type=str)
parser.add_argument("--E", help=hstring2, type=str)
parser.add_argument("--W", help=hstring2, type=str)
args = parser.parse_args()
c = cdsapi.Client()
c.retrieve('reanalysis-era5-complete', {
    'class': 'ea',
    'date': str(args.date1) + '/to/' + str(args.date2),
    'area': str(args.N) + '/' + str(args.W) + '/' + str(args.S) + '/' + str(args.E),
    'expver': '1',
    'levtype': 'sfc',
    'param': 'msl/sp/skt/2t/10u/10v/2d/z/lsm/sst/ci/sd/stl1/stl2/stl3/stl4/swvl1/swvl2/swvl3/swvl4',
    'stream': 'oper',
    'time': '00:00:00/03:00:00/06:00:00/09:00:00/12:00:00/15:00:00/18:00:00/21:00:00',
    'type': 'an',
    'grid': "0.25/0.25",
}, 'ERA5-' + str(args.date1) + '-' + str(args.date2) + '-sfc.grb')
