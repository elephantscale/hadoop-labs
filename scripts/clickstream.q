CREATE EXTERNAL TABLE x_clickstream (
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



CREATE EXTERNAL TABLE x_domains (
    domain STRING,
    category STRING )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/data/domains/in'    ;
