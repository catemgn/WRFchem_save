For compiling WPS, the same env var used for WRF must be set (see WRF_readme.txt)

Some useful reminders:

GEOGRID

Remeber to link the GEOGRID.TBL before running geogrid.exe (see also userguide):

cd geogrid
ln -svf GEOGRID.TBL.ARW_CHEM GEOGRID.TBL


UNGRIB

remeber to link the Vtable.GFS:
ln -sf ungrib/Variable_Tables/Vtable.GFS Vtable
