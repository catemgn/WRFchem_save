
#!/bin/bash

#Run this script to install required libraries for WRF-Chem. In command line type:
# $source install_libraries.sh


#Set environmental variables

echo "############## SETTING NEVIORNMENTAL VARIABLES ###########"

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

echo "All environmental variables set correctly!"


#Installing HDF5 library: thiws is necessary if you want to use compressed netcdf...But also other changes are needed in the configuration flags.

#echo "############## INSTALLING HDF5 LIBRARY #############"
#tar xzvf hdf5-1.8.20.tar.gz
#cd hdf5-1.8.20
#./configure --prefix=$DIR/hdf5 --disable-shared --disable-dap --enable-fortran
#make
#make install
#export PATH=$DIR/hdf5/bin:$PATH
#cd ..

#Installing MPICH library

echo "##############INSTALLING MPICH LIBRARY #############"
tar xzvf mpich-3.0.4.tar.gz
cd mpich-3.0.4
./configure --prefix=$DIR/mpich
make
make install
export PATH=$DIR/mpich/bin:$PATH
cd ..


#Installing zlib library
echo "##############INSTALLING zlib  LIBRARY #############"
tar xzvf zlib-1.2.7.tar.gz
cd zlib-1.2.7
./configure --prefix=$DIR/grib2
make
make install
cd ..

#installing libpng
echo "##############INSTALLING libpng LIBRARY #############"
tar xzvf libpng-1.2.50.tar.gz
cd libpng-1.2.50
./configure --prefix=$DIR/grib2
make
make install
cd ..

#installing JasPer
echo "##############INSTALLING JasPer LIBRARY #############"
tar xzvf jasper-1.900.1.tar.gz
cd jasper-1.900.1
./configure --prefix=$DIR/grib2
make
make install
cd ..


#Installing NETCDF library

echo "##############INSTALLING NETCDF LIBRARY ##############"

tar xzvf netcdf-4.1.3.tar.gz
cd netcdf-4.1.3
./configure --prefix=$DIR/netcdf --disable-netcdf-4 --disable-dap --disable-shared
make
make install
export PATH=$DIR/netcdf/bin:$PATH
export NETCDF=$DIR/netcdf
cd ..

echo "All libraries installed correctly!"
