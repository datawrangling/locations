truncate table locations;

set foreign_key_checks=0; 
set sql_log_bin=0; 
set unique_checks=0;

ALTER TABLE locations DISABLE KEYS;

LOAD DATA LOCAL INFILE 'sample_cities.txt'
INTO TABLE locations
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
(geonameid, name, latitude, longitude, country_code, cc2, fipscode, county, population);

ALTER TABLE locations ENABLE KEYS;

set foreign_key_checks=1; 
set unique_checks=1;