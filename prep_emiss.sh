#!/bin/bash

#SCRIPT FOR AUTOMATISE PREPARING EMISSIONS AND BC AND SAVE  THEM TO RUNNING DIR FOLDER.

ulimit -s 64000000

# running directiory where wrfinput* and wrfbdy* are.
OUT_DIR_AF=/scratch/local/caterina/WRFChem_runs/run_nest_premon_2019
# for bio, wes,exo, and  bc needs to have shorter path..
OUT_DIR_short=/scratch/local/caterina/WRFChem_runs/run_nest_premon_2019/

#detail of simulation start/end times and #domains.
startime='2019-04-01_00:00:00'
endtime='2019-05-01_00:00:00'
domains=2
domains_bc=1

#anthro emiss parameters
out_interval=3600
anthro_yrs_offset=+4
serial_output=.false.

#biogenic emiss parameters
start_lai=3
end_lai=5

#mozbc parameters
file_bc=premon0001.nc


#------RUN ANTHRO_EMISS-----

cd ANTHRO/src/

#set path & inputs
sed -e "s=__run_dir__=$OUT_DIR_AF=g" -e "s=__domains__=$domains=g"  -e "s=__start_time__=$startime=g" -e "s=__end_time__=$endtime=g" -e "s=__yrs_offset__=$anthro_yrs_offset=g" -e "s=__serial_output__=$serial_output=g" -e "s=__output_interval__=$out_interval=g"  edgar5_new.inp  > temp_edgar5_new.inp 

#run and save files in running directory
./anthro_emis < temp_edgar5_new.inp
mv wrfchemi* $OUT_DIR_AF
cd ../../



#--------RUN FIRE_EMISS------

cd FIRE/src/

sed -e "s=__run_dir__=$OUT_DIR_AF=g" -e "s=__domains__=$domains=g" -e "s=__start_time__=$startime=g" -e "s=__end_time__=$endtime=g" FINN_2019.inp > temp_FINN_2019.inp

./fire_emis < temp_FINN_2019.inp
mv wrffire* $OUT_DIR_AF
cd ../../


#----RUN BIOEMISS----

cd BIOGENIC/

sed -e "s=__run_dir__=$OUT_DIR_short=g" -e "s=__domains__=$domains=g" -e "s=__start_lai_mth__=$start_lai=g" -e "s=__end_lai_mth__=$end_lai=g" bioemiss.inp > temp_bioemiss.inp

./megan_bio_emiss < temp_bioemiss.inp
mv wrfbiochemi* $OUT_DIR_short
cd ../


#-----RUN WESELY & EXOCOLDENS----

cd WESCOLDENS/

sed -e "s=__run_dir__=$OUT_DIR_short=g" -e "s=__domains__=$domains=g" wesely.inp >temp_wesely.inp
cp temp_wesely.inp temp_exo_coldens.inp

./wesely < temp_wesely.inp
mv wrf_season* $OUT_DIR_short
./exo_coldens < temp_exo_coldens.inp
mv exo_coldens_d0* $OUT_DIR_short
cd ../


#----RUN MOZBC-----

cd MOZBC_new/

sed -e "s=__run_dir_bc__=$OUT_DIR_short=g" -e "s=__file_bc__=$file_bc=g" CAM_CHEM.inp >temp_CAM_CHEM.inp

./mozbc < temp_CAM_CHEM.inp
#cd ../
