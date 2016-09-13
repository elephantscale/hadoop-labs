-- TODO 1 : replace 'MY_NAME' with your username
-- TODO 2 : replace 'LOGIN_NAME' with actual login name (e.g ubuntu or ec2-user)


use MY_NAME_db;


CREATE EXTERNAL TABLE invoices (
    customer_id INT,
    total INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/ec2-user/MY_NAME/invoices'  ;
