#!/bin/bash 

# Run this script to make the system environment tests. From command line:
# $ source run_machine_tests.sh

# W A R N I N G ! This file is set up to check for Intel compiler. To check for GNU compiler, substitue ifort-> gfortran and icc-> gcc throughout the commands.  


# First and foremost, it is very important to have a gfortran compiler, as well as gcc and cpp. To test whether these exist on the system, type the following:
 which ifort  # or gfortran with GNU.
 which icpc    
 which icc    # or gcc with GNU.

#If you have these installed, you should be given a path for the location of each.

#We recommend using a Fortran compiler that supports Fortran2003 standard (version 4.6 or later). To determine the version of gfortran you have, type:

icc --version # or gcc --version with GNU

#Create a new, clean directory called Build_WRF, and another one called TESTS.
#There are a few simple tests that can be run to verify that the fortran compiler is built properly, and that it is compatible with the C compiler.

#NOTE: If any of these tests fail, you will need to contact the systems administrator at your institution for help, as these are specific to your particular environment, and we do not have the resources to support these types of errors.

#Below is a tar file that contains the tests. Download the tar file and place it in the TESTS directory.

#Fortran and C Tests Tar File

#To unpack the tar file, type:

tar -xf Fortran_C_tests.tar

#There are 7 tests available, so start at the top and run through them, one at a time.

#Test #1: Fixed Format Fortran Test: TEST_1_fortran_only_fixed.f

#Type the following in the command line:

ifort  TEST_1_fortran_only_fixed.f   # or gfortran.
./a.out

#The following should print out to the screen:
#SUCCESS test 1 fortran only fixed format

#Test #2: Free Format Fortran: TEST_2_fortran_only_free.f90
#Type the following in the command line:

ifort TEST_2_fortran_only_free.f90
./a.out

#The following should print out to the screen:
#Assume Fortran 2003: has FLUSH, ALLOCATABLE, derived type, and ISO C Binding
#SUCCESS test 2 fortran only free format


#Test #3: C: TEST_3_c_only.c
#Type the following in the command line:

icc TEST_3_c_only.c
./a.out

#The following should print out to the screen:
#SUCCESS test 3 c only

#Test #4: Fortran Calling a C Function (our gcc and gfortran have different defaults, so we force both to always use 64 bit [-m64] when combining them): TEST_4_fortran+c_c.c, and TEST_4_fortran+x_f.f90
#Type the following in the command line:

icc -c -m64 TEST_4_fortran+c_c.c
ifort -c -m64 TEST_4_fortran+c_f.f90
ifort -m64 TEST_4_fortran+c_f.o TEST_4_fortran+c_c.o
./a.out

#The following should print out to the screen:
#C function called by Fortran
#Values are xx = 2.00 and ii = 1
#SUCCESS test 4 fortran calling c



#In addition to the compilers required to manufacture the WRF executables, the WRF build system has scripts as the top level for the user interface. The WRF scripting system uses, and therefore having the following is necessary:csh, perl,sh.

#To test whether these scripting languages are working properly on the system, there are 3 tests to run. These tests were included in the "Fortran and C Tests Tar File".

#Test #5:csh In the command line, type:
./TEST_csh.csh

#The result should be:
#SUCCESS csh test

#Test #6:perl In the command line, type:
./TEST_perl.pl

#The result should be:
#SUCCESS perl test


#Test #7:sh In the command line, type:
./TEST_sh.sh
#The result should be:
#SUCCESS sh test
