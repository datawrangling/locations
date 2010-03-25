LOAD DATA LOCAL INFILE 'sample_cities.txt'
INTO TABLE locations
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
(geonameid, name, latitude, longitude, country_code, cc2, fipscode, county, population);