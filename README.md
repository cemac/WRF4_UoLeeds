<div align="center">
<a href="https://www.cemac.leeds.ac.uk/">
  <img src="https://github.com/cemac/cemac_generic/blob/master/Images/cemac.png"></a>
  <br>
</div>


# WRF4_UoLeeds

 [![GitHub release](https://img.shields.io/github/release/cemac/WRF4_UoLeeds.svg)](https://github.com/cemac/WRF4_UoLeeds/releases) [![GitHub top language](https://img.shields.io/github/languages/top/cemac/WRF4_UoLeeds.svg)](https://github.com/cemac/WRF4_UoLeeds) [![GitHub issues](https://img.shields.io/github/issues/cemac/WRF4_UoLeeds.svg)](https://github.com/cemac/WRF4_UoLeeds/issues) [![GitHub last commit](https://img.shields.io/github/last-commit/cemac/WRF4_UoLeeds.svg)](https://github.com/cemac/WRF4_UoLeeds/commits/master) [![GitHub All Releases](https://img.shields.io/github/downloads/cemac/WRF4_UoLeeds/total.svg)](https://github.com/cemac/WRF4_UoLeeds/releases) ![GitHub](https://img.shields.io/github/license/cemac/WRF4_UoLeeds.svg)
[![HitCount](http://hits.dwyl.io/{cemac}/{WRF4_UoLeeds}.svg)](http://hits.dwyl.io/{cemac}/{WRF4_UoLeeds})



### Guidance on using WRF4 on the UoLeeds ARC3 system

This code repository contains copies of three files that are used to invoke an environment on the University of Leeds HPC for running WRFv4 from a pre-built installation that resides under the `earwrfa` account. This installation is designed primarily for use as part of an undergraduate teaching module in Practical Weather Forecasting.

The files are: 

```WRFv4``` - private modulefile that sets the paths to required libraries and dependencies;

```WRFv4_setup_env.sh``` - used to invoke the private module and set up some test environments for running the model;

```WRF_tidyup.sh``` - shell script used to clean up old WRF output files before performing a new case study

More details on how to invoke the WRF environment and run it on ARC3 are available [here](https://github.com/cemac-tech/WRF4_UoLeeds/wiki/WRFv4-on-ARC3:-User-documentation)

Full details of the compilation method are available [here](https://github.com/cemac-tech/WRF4_UoLeeds/wiki/Compiling-WRFv4.0-on-ARC3). These notes may also be used as a guide by University of Leeds researchers who wish to build their own local instance of WRFv4 for model development work. 

C. Dearden, CEMAC

## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">WRF4_UoLeeds</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/cemac" property="cc:attributionName" rel="cc:attributionURL">https://github.com/cemac</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>

## Acknowledgements

These guides were produced by C. Dearden, CEMAC
