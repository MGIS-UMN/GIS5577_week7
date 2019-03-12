# GIS5577 Week 7

This is the repository for Week 7 class exercises

The purpose of this weeks class is to revisit database design and think about the structure of a database with Entity Relationship Diagrams. We will also begin loading and using raster datasets


### Datasets can be found in the shapefile directory
1. States 
Cartographic boundaries of the US States

### GeoTiffs
1. glc2000_nodata_clipped.tif (WGS84, 4326)
1. meris_2010_clipped_nodata.tif (WGS84, 4326)


### Homework
1. Read Masteriing PostGIS Chapter 5
1. Understand the flags for loading a raster dataset

### Loading Rasters
1. Creating the sql file
```
raster2pgsql -C -x -I -Y -F -t 250x250 -s 4326 [raster_path] [raster_table] > [filelocation]

-C: add raster constraints
-x: spatial extent constraint. This is important if you have a global raster
-I: add GIST spatial index
-Y: use copy statements (faster) than inserts
-F: add the filename to the new table
-t: tile size. Must use two positive integers with the letter x between them
-s: spatial reference id
```
2. Loading the dataset to the database
```
psql –h -U x5000 -d x500 –f [filelocation]

psql –h -U x5000 -d x500 < [filelocation]
```


Piping information directly into the database. If the file is big this takes a long time.
```
raster2pgsql -C -x -I -Y -F -t 250x250 -s 4326 [raster_path] [raster_table] | psql –h -U x5000 -d x500 –f [filelocation]
```

