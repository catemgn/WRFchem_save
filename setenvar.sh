#!/bin/bash 
export  DIR=/exports/csce/datastore/geos/users/s1878599/WRFchem4.1.2/LIBRARIES
export  CC=icc
export  CXX=icpc
export  FC=ifort
export  FCFLAGS=-m64
export  F77=ifort
export  FFLAGS=-m64
export  JASPERLIB=$DIR/grib2/lib
export  JASPERINC=$DIR/grib2/include
export  LDFLAGS=-L$DIR/grib2/lib
export  CPPFLAGS=-I$DIR/grib2/include

export  WRF_CHEM_CORE=1
export YACC="/usr/bin/yacc -d"
export FLEX_LIB_DIR=/usr/lib64
export WRF_CHEM=1 # if using chemsitry on.
export WRF_KPP=1  # if using KPP preprocessor.

export NETCDF=$DIR/netcdf
export NETCDF_classic=1 #build non compressed netCDF.
export WRFIO_NCD_LARGE_FILE_SUPPORT=1

#for compiling ind running in parallel
export PATH=$DIR/mpich/bin:$PATH
export J="-j 2"
ulimit -s unlimited
export MP_STACK_SIZE=64000000
