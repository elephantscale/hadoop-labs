-- FOR EACH lab
-- answer : labs-private/solutions/hadoop-solutions/pig/foreach-answer.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME foreach.pig';

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);

sh echo "==== dumping tx_data"
-- DUMP tx_data;

-- ## TODO-2 : lets extract account_id and amount
-- A = FOREACH tx_data GENERATE ??? , ???;
-- sh echo "==== dumping A"
-- DUMP A;
-- DESCRIBE A;
-- ## To see the execution plan uncomment this
-- EXPLAIN A;

-- ## Save and run the script as follows
-- ##    $   pig   foreach.pig


-- ## TODO-3 : generate account_id, amount and amount_in_cents
-- B = FOREACH .....
-- sh echo "==== dumping B"
-- DUMP B;
-- DESCRIBE B;
