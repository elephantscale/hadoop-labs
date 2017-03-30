-- TODO : update MY_NAME


use MY_NAME_db;

-- PUT PROPER PATH TO JAR AND UNCOMMENT
-- ADD JAR /PATH TO YOUR JAR
set hive.auto.convert.join = false;

CREATE EXTERNAL TABLE offers (
    start_date STRING,
    end_date STRING,
    vendor_id INT ,
    discount DOUBLE)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE
LOCATION '/data/offers/in-json/'  ;
