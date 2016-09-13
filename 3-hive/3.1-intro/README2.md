<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Lab 3.1b: Hive Table Setup

## Objective
Create Hive tables and stage data in HDFS

## Working dir 
`~/MY_NAME/hadoop-dev-labs/data/cc-data`


## STEP 1: Create Hive Tables
Remember to replace `MY_NAME` accordingly for each table.  
Start Hive or beeline shell.

```sql

    hive>    
            set hive.cli.print.current.db=true;
            
            -- see databases
            show databases;

            -- create your own database
            create database MY_NAME_db;
            show databases;

            use MY_NAME_db;
```

### Transactions Table

```sql
    hive>

        CREATE EXTERNAL TABLE transactions (
            id INT,
            account_id INT,
            vendor_id INT,
            time STRING,
            city STRING,
            state STRING ,
            amount DOUBLE)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        stored as textfile
        LOCATION '/user/ec2-user/MY_NAME/transactions/in/'  ;  -- <-- replace MY_NAME

```

### Vendors Table

```sql

    hive>
            CREATE EXTERNAL TABLE vendors (
                id INT,
                name STRING,
                city STRING,
                state STRING ,
                category STRING ,
                swipe_rate DOUBLE)
            ROW FORMAT DELIMITED
            FIELDS TERMINATED BY ','
            stored as textfile
            LOCATION '/user/ec2-user/MY_NAME/vendors/in/'  ;   -- <-- replace MY_NAME


```

### Accounts Table

```sql
    hive>

        CREATE EXTERNAL TABLE accounts (
            id INT,
            accountNo INT,
            bankID INT,
            first_name STRING,
            last_name STRING,
            email STRING,
            gender STRING,
            address STRING,
            city STRING,
            state STRING,
            zip STRING)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        stored as textfile
        LOCATION '/user/ec2-user/MY_NAME/accounts/in/'  ;   -- <-- replace MY_NAME

```



## STEP 2:  Run queries
Lets see data in table.
```sql
    hive >  
        set hive.cli.print.header=true;

        select * from transactions limit 10;

        select * from accounts limit 10;

        select * from vendors limit 10;
```

Queries should return no data.

## STEP 3:  Stage Data in Hive Tables.
Replace 'MY_NAME' accordingly.  
These commands should be run on Linux shell (*not* hive shell).   
Exit Hive shell if you haven't.

```bash

    cd  ~/MY_NAME/hadoop-dev-labs/data/cc-data

    # generate CC data
    python gen-cc-data.py

    # transactions
    hdfs  dfs -mkdir -p  MY_NAME/transactions/in
    hdfs dfs -put  transactions.csv   MY_NAME/transactions/in/
    hdfs dfs -put  transaction*.csv   MY_NAME/transactions/in/


    # vendors
    hdfs  dfs -mkdir -p MY_NAME/vendors/in/
    hdfs dfs -put vendors.csv   MY_NAME/vendors/in/

    # accounts
    hdfs  dfs -mkdir -p MY_NAME/accounts/in/
    hdfs dfs -put accounts.csv   MY_NAME/accounts/in/

    # offers
    hdfs  dfs -mkdir -p MY_NAME/offers/in/
    hdfs  dfs -mkdir -p MY_NAME/offers/in-json/
    hdfs dfs -put offers.csv   MY_NAME/offers/in/
    hdfs dfs -put offers.json   MY_NAME/offers/in-json/

```


## STEP 4:  Run queries again
Lets see data in table.
```sql
    hive >  
        set hive.cli.print.header=true;

        select * from transactions limit 10;

        select * from accounts limit 10;

        select * from vendors limit 10;
```

============

