-- top-spenders.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME top.pig';

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);

-- sh echo "==== dumping tx_data"
-- DUMP tx_data;

A = foreach tx_data generate account_id, amount;
B = group A by account_id;
C = foreach B generate group, SUM(A.amount) as total;
sh echo "==== dumping C"
dump C;

-- ## Now we have total per customer

-- ## TODO-1 : sort the invoice by total
-- sorted = order C by ??? ??? ;

-- ## TODO-2 : we need top 10
-- top10 = limit sorted ??? ;
-- sh echo "==== dumping top10"
-- dump top10  ;

-- ## TODO-3 : how many map reduce jobs did this script run?
-- ## can you account for all MR jobs?