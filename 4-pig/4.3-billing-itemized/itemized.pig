-- pig-billing-itemized.pig

-- ## TODO : set the name of job
SET job.name 'MY_NAME itemized.pig';

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);

sh echo "==== dumping tx_data"
DUMP tx_data;

-- ## extract  account_id, vendor_id, amount
-- A = FOREACH tx_data  GENERATE ???, ???, ??? ;
-- sh echo "==== dumping A"
-- DUMP A ;
-- DESCRIBE A ;


-- ## group by account_id and vendor_id
-- B = GROUP A by (???, ???)  ; 
sh echo "==== dumping B";
DUMP B;
DESCRIBE B;

-- ## then sum cost
itemized = FOREACH B GENERATE group, SUM(???) as total;
sh echo "==== dumping itemized";
DUMP itemized;

-- ## TODO : now process all the files (change LOAD example )

-- ## TODO : change MY_NAME / store the file into HDFS
-- STORE total_by_cid_rid INTO 'MY_NAME/itemized-billing/out';


