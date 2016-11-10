#!/bin/bash

### Setup clickstream data
# run it from hadoop-labs/scripts directory


set -x  # echo commands
set -e  # exit on first error

#  copy sample file
hdfs   dfs -mkdir  -p  /data/clickstream/in-json 
hdfs   dfs   -put   ../data/click-stream/clickstream.json    /data/clickstream/in-json/
hdfs   dfs -mkdir  -p  /data/clickstream/in/
hdfs   dfs   -put   ../data/click-stream/clickstream.csv    /data/clickstream/in/

#  generate clickstream data
python ../data/click-stream/gen-clickstream.py
hdfs dfs -put clickstream*.csv   /data/clickstream/in/
python ../data/click-stream/gen-clickstream-json.py
hdfs dfs -put   *.json   /data/clickstream/in-json/

## Domains
hdfs  dfs -mkdir  -p  /data/domains/in-json/
hdfs  dfs -mkdir  -p  /data/domains/in/
hdfs dfs -put   ../data/click-stream/domain-info.csv   /data/domains/in/
hdfs dfs -put   ../data/click-stream/domain-info.json  /data/domains/in-json/

## Create Hive tables
hive -S -f clickstream.q

