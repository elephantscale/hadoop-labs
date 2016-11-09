<link rel='stylesheet' href='assets/css/main.css'/>

[<< back to main index](README.md)

# Clickstream Setup


## CLickstream
For this lab we are going to use clickstream data in JSON format.  
Follow the steps to 

```bash

    #  be in the working directory
    $   cd  ~/MY_NAME/hadoop-labs
```

```bash
    #  create an HDFS directory
    hdfs   dfs -mkdir  -p  /data/clickstream/in-json 

    #  copy sample file
    hdfs   dfs   -put   data/click-stream/clickstream.json    /data/clickstream/in-json/

    hdfs   dfs -mkdir  -p  /data/clickstream/in/

    hdfs   dfs   -put   data/click-stream/clickstream.csv    /data/clickstream/in/

```

Let's generate some more clickstream data and stage into HDFS.

```
    python data/click-stream/gen-clickstream.py
    hdfs dfs -put clickstream*.csv   /data/clickstream/in/

    #  generate data
    python data/click-stream/gen-clickstream-json.py

    #  copy data to HDFS
    hdfs dfs -put   *.json   /data/clickstream/in-json/

    #  verify data in HDFS
    # Use the HDFS UI
```

## Domains
```bash

    hdfs  dfs -mkdir  -p  /data/domains/in-json/
    hdfs  dfs -mkdir  -p  /data/domains/in/


    hdfs dfs -put   data/click-stream/domain-info.csv   /data/domains/in/
    hdfs dfs -put   data/click-stream/domain-info.json  /data/domains/in-json/

```

## Hive Tables
```sql

    $  hive
    hive>

        CREATE EXTERNAL TABLE clickstream (
            ts BIGINT,
            ip STRING,
            userid STRING,
            action STRING,
            domain STRING,
            campaign_id STRING,
            cost INT,
            session_id STRING )
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        stored as textfile
        LOCATION '/data/clickstream/in' ;


        CREATE EXTERNAL TABLE domains (
            domain STRING,
            category STRING )
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        stored as textfile
        LOCATION '/data/domains/in'    ;
```