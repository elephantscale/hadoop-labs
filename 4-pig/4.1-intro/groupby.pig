-- GROUPBY lab

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME groupby.pig';

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);

-- DUMP tx_data;

-- ## TODO-2 : group by account_id
-- grouped_by_account = GROUP tx_data BY ???  ;
-- DUMP   grouped_by_account;
-- DESCRIBE grouped_by_account;

-- ## TODO-3 : special groupby- ALL
-- grpd = GROUP tx_data ___;
-- DUMP grpd;
-- DESCRIBE grpd;
