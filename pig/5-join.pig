-- join.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME join.pig';

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);


vendors = LOAD '/data/vendors/in/' USING PigStorage(',') AS (id:int, name:chararray,city:chararray, state:chararray, category:chararray, swipe_rate:double);
DUMP vendors;

-- ## TODO-1 : join by vendor_id
joined = JOIN tx_data by ????,  vendors  by ????;
DESCRIBE joined;
DUMP joined;
-- ## do all records show up?


-- ## TODO-2 : outer join
-- outer_join = JOIN tx_data by ???? LEFT OUTER, vendors  by ????;
-- DESCRIBE outer_join;
-- DUMP outer_join;
-- ## do all records show up?
-- ## what is the values for 'missing fields'
