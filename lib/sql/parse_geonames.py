#!/usr/bin/env python
# encoding: utf-8
"""
parse_geonames.py

1,2,5,6,8,9,10,11,12,15 


The main 'geoname' table has the following fields :
---------------------------------------------------
1 geonameid         : integer id of record in geonames database
2 name              : name of geographical point (utf8) varchar(200)
5 latitude          : latitude in decimal degrees (wgs84)
6 longitude         : longitude in decimal degrees (wgs84)
9 country code      : ISO-3166 2-letter country code, 2 characters
10 cc2               : alternate country codes, comma separated, ISO-3166 2-letter country code, 60 characters
11 admin1 code       : fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for 
12 admin2 code       : code for the second administrative division, a county in the US, see file admin2Codes.txt; 
15 population        : bigint (4 byte int)

Created by Peter Skomoroch on 2010-03-25.
Copyright (c) 2010 Data Wrangling LLC. All rights reserved.
"""

import sys
import os


def main():
  for line in sys.stdin: 
    fields = line.strip().split('\t')
    for i, x in enumerate(fields):
      if len(x) == 0:
        fields[i] = ' '
    #[7, 13, 13, 2117, 8, 9, 1, 3, 2, 0, 2, 0, 0, 0, 7, 2, 1, 16, 10]
    geonameid = fields[0]
    name = fields[1]
    latitude = fields[4]
    longitude = fields[5]
    country_code = fields[8]
    cc2 = fields[9]
    admin1_code = fields[10]
    admin2_code = fields[11]
    population = fields[14]
    
    print '\t'.join([geonameid,name, latitude,longitude,country_code,cc2,admin1_code,admin2_code,population])


if __name__ == '__main__':
  main()

