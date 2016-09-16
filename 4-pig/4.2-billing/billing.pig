-- pig-billing.pig

-- Pig Latin reference : http://pig.apache.org/docs/r0.11.1/basic.html

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME billing.pig';

-- TIP : Verify each step is working before going to the next one
-- you can use DUMP statements to verify the output is correct.
-- e.g :    A = ....
--          DUMP A;
-- verify that the output looks correct before going further.
-- once verified comment out the DUMP statements (because each DUMP statement will run MR job... it will just take more time)

tx_data = LOAD '/data/transactions/in/transactions.csv' USING PigStorage(',') AS 
(id:long, account_id:int, vendor_id:int, time:chararray, city:chararray, state:chararray, amount:double);

-- sh echo "==== dumping tx_data"
-- DUMP tx_data;

-- ## TODO-2 : extract account_id & amount
-- A = FOREACH tx_data  GENERATE ???,  ???  ;
-- sh echo "==== dumping A"
-- DUMP A ;
-- DESCRIBE A ;

-- ## TODO-3 : group by account_id
-- B = GROUP A by ??? ;
-- sh echo "==== dumping B"
-- DUMP B;
-- DESCRIBE B;

-- ## TODO-4 : then sum cost
-- ## hint : sum(amount) won't work, b/c amount is nested.
-- ##        we have to say   A.amount  
-- ##        inspect DESCRIBE B  output to see why.
-- invoice = FOREACH B GENERATE group, SUM(???.???) as total;
-- sh echo "==== dumping invoice"
-- DUMP invoice;

-- ## TODO-6 : now process all the files
-- change LOAD example from '/data/transactions/in/transactions.csv' --> '/data/transactions/in/'   (consume the entire dir)
-- ## NOTE : turn off any DUMP statements before running with large datasets !
-- ## Instructor can provide even larger datasets  to run on

-- ## TODO-7 : Save the result into HDFS - change MY_NAME
-- STORE invoice INTO 'MY_NAME/billing/pig-invoice';
