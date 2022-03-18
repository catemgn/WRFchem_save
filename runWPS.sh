# THIS SCRIPT RUNS WPS EXECUTABLES FOR namelist.wps

#set input and output directory for meteo files.
export INPUT_DIR=/geos/d21/s1878599/METEO_DATA_WRF/IGP19/postmon/new_gdas1.fnl0p25
export OUT_DIR01=../WRF/run_delhi/run_parent_postmon_12km3km2019/
export OUT_DIR02=../WRF/run_delhi/run_nest_postmon_12km3km2019/

# run geogrid.
./geogrid.exe

# run ungrib.
ln -sf ungrib/Variable_Tables/Vtable.GFS Vtable
./link_grib.csh $INPUT_DIR
./ungrib.exe

#run metgrid.
./metgrid.exe

# move meteo file to output directory.
mv met_em.d01* $OUT_DIR01
mv met_em.d02* $OUT_DIR02

#remove local files from WPS directory.
rm geo_em*
rm GRIB*
rm FILE*
