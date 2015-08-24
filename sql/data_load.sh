#! /bin/bash

psql -h 192.168.59.103 -U docker  -d hmda  < mil2013.sql

#echo "\i cbsa2010.sql;"
#psql -d hmda -f mil2013.sql;
