For configuring and compiling WRF, firs run setenvar.sh, to set the necesary environmental libraries.
Tye from command line: source setenvar.sh


For intel, choose option 15 INTEL dmpar for WRF, 19 for WPS.

!!!IMPORTANT!!!! The variables need to be set up also when running executables! e.g. real.exe, wrf.exe and preprocessing scripts. Othewise the model crashes with segmentation fault with a series of 'Unknown'.
