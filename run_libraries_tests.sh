#!/bin/bash

# Run this script to make the libraries compatibility  tests. From command line:
# $ source libraries_tests.sh

# W A R N I N G ! This file is set up to check for Intel compiler. To check for GNU compiler, substitue ifort-> gfortran and icc-> gcc throughout the commands. 


#Once the target machine is able to make small Fortran and C executables (what was verified in the System Environment Tests section), and after the NetCDF and MPI libraries are constructed (two of the libraries from the Building Libraries section), to emulate the WRF code's behavior, two additional small tests are required. We need to verify that the libraries are able to work with the compilers that are to be used for the WPS and WRF builds.
#NOTE: If any of these tests fail, you will need to contact the systems administrator at your institution for help, as these are specific to your particular environment, and we do not have the resources to support these types of errors.

tar -xf Fortran_C_NETCDF_MPI_tests.tar

#There are 2 tests::
#Test #1: Fortran + C + NetCDF

#The NetCDF-only test requires the include file from the NETCDF package be in this directory. Copy the file here:

cp ${NETCDF}/include/netcdf.inc .

#Compile the Fortran and C codes for the purpose of this test (the -c option says to not try to build an executable). Type the following commands:

ifort -c 01_fortran+c+netcdf_f.f
icc -c 01_fortran+c+netcdf_c.c
ifort 01_fortran+c+netcdf_f.o 01_fortran+c+netcdf_c.o -L${NETCDF}/lib -lnetcdff -lnetcdf

./a.out

#The following should be displayed on your screen:
#C function called by Fortran
#Values are xx = 2.00 and ii = 1
#SUCCESS test 1 fortran + c + netcdf



#Test #2: Fortran + C + NetCDF + MPI
#The NetCDF+MPI test requires include files from both of these packages be in this directory, but the MPI scripts automatically make the mpif.h file available without assistance, so no need to copy that one. Copy the NetCDF include file here:

cp ${NETCDF}/include/netcdf.inc .

#Note that the MPI executables mpif90 and mpicc are used below when compiling. Issue the following commands:

mpif90 -c 02_fortran+c+netcdf+mpi_f.f
mpicc -c 02_fortran+c+netcdf+mpi_c.c
mpif90 02_fortran+c+netcdf+mpi_f.o 02_fortran+c+netcdf+mpi_c.o -L${NETCDF}/lib -lnetcdff -lnetcdf

mpirun ./a.out

#The following should be displayed on your screen:
#C function called by Fortran
#Values are xx = 2.00 and ii = 1
#status = 2
#SUCCESS test 2 fortran + c + netcdf + mpi
