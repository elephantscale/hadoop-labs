<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Lab 3.4 : Hive Partitions

## Step 1: Hive Shell
```bash

    $   hive

    hive>   
        show databases;
```


## Step 2: Create partition table
```sql
    hive>
        set hive.cli.print.current.db=true;

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
        LOCATION '/user/ec2-user/MY_NAME/transactions/in-part/'  ; -- <-- change MYNAME


        select * from transactions_p limit 10;
        -- should return no rows

        -- display partitions
        show partitions transactions;

```


## STEP 3: Create some data to be uploaded
```
    $   cd  ~/MY_NAME/hadoop-labs/
    $   python data/cc-data/gen-cc-data.py
```
This will generate a few transaction data files.


## STEP 4: Load data into partitions
In this step, we are going to load data directly from local computer  (not staging into HDFS).

```sql
    hive> 
        load data local inpath './transaction-2015-01-01.csv' INTO TABLE transactions_p partition (dt='2015-01-01');

        load data local inpath './transaction-2015-01-02.csv' INTO TABLE transactions_p partition (dt='2015-01-02');

```

Note :  We have to manually specify the partition.


## STEP 5:  Using partitions
Lets run some queries using partitions
```sql
    hive>   
        -- display partitions
        show partitions transactions;

        -- count all data in table
        select count(*) from transactions_p;

        -- partition specific
        select count(*) from transactions_p where dt='2015-01-01';
        select count(*) from transactions_p where dt='2015-01-02';
```

Note the count results.

## STEP 6:  Verify data layount in HDFS
You can browse `/user/ec2-user/MY_NAME/transactions/in-part/`  directory or use
```
    $   hdfs dfs -ls -R   /user/ec2-user/MY_NAME/transactions/in-part/
```

