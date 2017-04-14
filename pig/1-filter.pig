-- Filter
-- answer : labs-private/solutions/hadoop-solutions/pig/filter-answer.pig

-- Pig Latin Ref : https://pig.apache.org/docs/r0.7.0/piglatin_ref2.html

-- ## TODO : set the name of job
SET job.name 'MY_NAME filter.pig';

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);

-- DUMP tx_data;


-- ## TODO : filter amounts > 100
-- A = FILTER tx_data BY ..... ;
-- DUMP A;
-- DESCRIBE A;

-- ## TODO : filter amount > 100 and state = 'TX'
-- B = FILTER .....  ;
-- DUMP B;
-- DESCRIBE B;
