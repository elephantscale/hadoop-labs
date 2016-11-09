<link rel='stylesheet' href='assets/css/main.css'/>

# Lab : Setup CC Data

**Note : Replace MY_NAME appropriately throughout the lab.** 


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

```sql

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
        LOCATION '/data/transactions/in/'  ;

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
        LOCATION '/data/vendors/in/'  ;


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
        LOCATION '/data/accounts/in/'  ;


        set hive.cli.print.header=true;

        show tables;

        select * from transactions limit 10;

        select * from accounts limit 10;

        select * from vendors limit 10;
```


