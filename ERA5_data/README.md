# ERA 5 data retrieval scripts

following [cds api intructions](https://cds.climate.copernicus.eu/api-how-to)

## Requirements:

* CDS account
* Eccodes and cdsapi
  * use CEMAC moduels `module load wrfconda` OR
  * for personal anaconda:
    * conda install -c conda-forge cdsapi
    * conda install -c conda-forge eccodes

## Pipeline

ERA 5 data needs additional preprocessing steps achieved by `era5_get_prep.sh`

## Automatic downloads:

I have written ERA auto download scripts

` ./era5_get_prep.sh -a 20170419 -z 20170420 -n 90 -w 0 -s -30 -e 180 `

`-h` flag give additional help
