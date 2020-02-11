
# Recover GFS metoe data

From shell, do the following:

Recover data:
csh download_CODENAME.csh YOUR_PASSWORD

for untar all:
for file in *.tar; do tar -xvf "$file"; done

rename extension to grib2:
rename .grib2.spasub.mogno385138 .grib2 *.grib2.spasub.mogno385138
                                                                              
