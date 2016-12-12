#!/bin/bash

### Setup credit card data
# run it from hadoop-labs/scripts directory

set -x # turn on echo
set -e  # exit on first error


echo "===== starting ====="
sudo -u hdfs  hdfs  dfs -mkdir /user/$USER
sudo -u hdfs  hdfs  dfs -chown $USER  /user/$USER
sudo -u hdfs   hdfs dfs -mkdir   /data
sudo -u hdfs  hdfs dfs -chown $USER /data


# generate CC data
python ../data/cc-data/gen-cc-data.py

# transactions
hdfs  dfs -mkdir -p  /data/transactions/in
hdfs dfs -put  ../data/cc-data/transactions.csv   /data/transactions/in/
hdfs dfs -put  transaction*.csv   /data/transactions/in/


# vendors
hdfs  dfs -mkdir -p  /data/vendors/in/
hdfs dfs -put ../data/cc-data/vendors.csv   /data/vendors/in/

# accounts
hdfs  dfs -mkdir -p   /data/accounts/in/
hdfs dfs -put ../data/cc-data/accounts.csv   /data/accounts/in/

# offers
hdfs  dfs -mkdir -p    /data/offers/in/
hdfs  dfs -mkdir -p    /data/offers/in-json/
hdfs dfs -put ../data/cc-data/offers.csv    /data/offers/in/
hdfs dfs -put ../data/cc-data/offers.json   /data/offers/in-json/


# Text data
hdfs  dfs -mkdir -p  /data/text_fomc
hdfs  dfs -put  ../data/text/FOMC20080916meeting.txt   /data/text_fomc/

hdfs  dfs -mkdir -p  /data/text_moby
hdfs  dfs -put  ../data/text/moby-dick.txt   /data/text_moby/

hdfs  dfs -mkdir -p  /data/text_sotu
hdfs  dfs -put  ../data/text/sotu-2014-obama.txt   /data/text_sotu/

echo "=========== done ========="
echo ""