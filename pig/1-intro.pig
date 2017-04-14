-- intro.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME  intro.pig';


-- loading with schema
tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS
  (id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);
DESCRIBE tx_data;

-- loading without schema (annonymous)
tx_data2 = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',');
DESCRIBE tx_data2;

-- Loadig using HCatalog
-- specify   -useHCatalog flag during running
--     $   pig -useHCatalog   1-intro.pig
-- ## TODO-2 : Fix the db name
tx_data3 = LOAD  'MY_NAME_db.transactions' using org.apache.hive.hcatalog.pig.HCatLoader();
DESCRIBE tx_data3;


-- ## TODO-3 : Save and run the script :
-- ##      $    pig -useHCatalog intro.pig
-- ## Inspect the YARN UI, can you see your job running?
-- ## BREAK : Wait for Instructor


-- ## TODO-4 : DUMP data out
-- ## uncomment the following lines, run the script, inspect the output
-- ## check YARN UI, what do you see now?
-- sh echo "==== dumping tx_data"
-- DUMP tx_data;

-- # now lets store the records in hdfs
-- ## TODO-5 : Store tx_data in HDFS (change MY_NAME)
-- sh echo "==== storing tx_data"
-- STORE tx_data into 'MY_NAME/tx/pigout';
-- # uncomment above line and run the script
