use MY_NAME_db;

CREATE EXTERNAL TABLE transactions_p (
            id INT,
            account_id INT,
            vendor_id INT,
            time STRING,
            city STRING,
            state STRING ,
            amount DOUBLE)
PARTITIONED BY (dt STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/data/transactions/in-part/'  ;
