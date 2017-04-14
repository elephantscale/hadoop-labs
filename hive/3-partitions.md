<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Lab HIVE-3 : Hive Partitions

## Step 1: Stage the data in HDFS
We can load data into Hive
* from local computers
* and from HDFS
We will stage our data in HDFS.

Execute these in shell (not in Hive shell)
```bash
  # make an staging directory
  $ hdfs dfs -mkdir -p MY_NAME/staging/

  # copy some files into staging
  $ hdfs dfs -cp /data/transactions/in/transaction-2015-01-01.csv    MY_NAME/staging/
  $ hdfs dfs -cp /data/transactions/in/transaction-2015-01-02.csv    MY_NAME/staging/
```

## Step 2: Start Hive Shell
```bash

    $   hive

    hive>   
        show databases;
```


## Step 3: Create partition table

**=> Fix 'MY_NAME' in table definition below **

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


        -- see table structure
        DESC transactions_p;

        select * from transactions_p limit 10;
        -- should return no rows

        -- display partitions
        show partitions transactions_p;

```


## STEP 4: Load data into partitions
In this step, we are going to load data into partitions.

```sql
    hive>
        load data inpath 'MY_NAME/staging/transaction-2015-01-01.csv' INTO TABLE transactions_p partition (dt='2015-01-01');

        load data inpath 'MY_NAME/staging/transaction-2015-01-02.csv' INTO TABLE transactions_p partition (dt='2015-01-02');

```

Note :  We have to specify the partition.

**=> Using HDFS browser, check the staging directory.  Are the data files still there?  why / why not? **



## STEP 5:  Using partitions
Lets run some queries using partitions
```sql
    hive>   
        -- display partitions
        show partitions transactions_p;

        -- count all data in table
        select count(*) from transactions_p;

        -- partition specific
        select count(*) from transactions_p where dt='2015-01-01';
        select count(*) from transactions_p where dt='2015-01-02';
```

Note the count results.

**==> Exit hive shell by typing `Ctrl+d`  (Control and 'd' key)**  


## STEP 6:  Verify data layount in HDFS
You can browse `/user/ec2-user/MY_NAME/transactions/in-part/`  directory or use
```
    $   hdfs dfs -ls -R   /user/ec2-user/MY_NAME/transactions/in-part/
```
