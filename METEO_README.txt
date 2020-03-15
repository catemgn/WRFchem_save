
! NOTE: useful info for WRF data and utilities: https://www.climatescience.org.au/sites/default/files/werner_data_utilities.pdf


SELECTION OF DATA (GFS)
Dataset: https://rda.ucar.edu/datasets/ds083.3/

To select data: Data Access (log required) -> Get a Subset -> Refine your selection:

Input Data Format: WMO_GRIB2 (default)
Output Format:  Same as input
Valid Date Range: PUT DATA RANGE. Fo IGP 2 months for each season.
Parameter(s): All available
Vertical Level(s): All available
Gridded Product: Analysis
Grid: 0.25° x 0.25° from 0E to 359.75E and 90N to 90S (1440 x 721 Longitude/Latitude) (default)
Spatial Selection: for IGP North:40 South:10 East:100  West:60

Download Method: Web Download
When receiving notiication that data are ready, selct Download options: csh download script
.

FOR RETRIVING DATA FROM CSH DOWNLOAD SCRIPT
#
csh download_CODENAME.csh pxr9MZZ6

for  untar all:

for file in *.tar; do tar -xvf "$file"; done

for renaming extension:

rename .grib2.spasub.mogno385138 .grib2 *.grib2.spasub.mogno385138
