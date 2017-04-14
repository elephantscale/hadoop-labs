-- creates Hive tables

-- TODO 1 : replace 'MY_NAME' with your username
-- use your own database
use MY_NAME_db;

CREATE EXTERNAL TABLE accounts (
    id INT,
    accountNo INT,
    bankID INT,
    first_name STRING,
    last_name STRING,
    email STRING,
    gender STRING,
    address STRING,
    city STRING,
    state STRING,
    zip STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/data/accounts/in/'  ;

CREATE EXTERNAL TABLE transactions (
    id INT,
    account_id INT,
    vendor_id INT,
    time STRING,
    city STRING,
    state STRING ,
    amount DOUBLE)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/data/transactions/in/'  ;

CREATE EXTERNAL TABLE vendors (
    id INT,
    name STRING,
    city STRING,
    state STRING ,
    category STRING ,
    swipe_rate DOUBLE)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/data/vendors/in/'  ;

CREATE EXTERNAL TABLE offers (
    start_date STRING,
    end_date STRING,
    vendor_id INT ,
    discount DOUBLE)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE
LOCATION '/data/offers/in-json/'  ;
