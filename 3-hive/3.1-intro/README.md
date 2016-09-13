<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Lab 3.1: Hive Table Setup

**Note : Replace MY_NAME appropriately throughout the lab.** 

**Hints : 
* To see column names set the following property in hive shell
```sql
        set hive.cli.print.header=true;
```

* To see current DB 
```sql
         set hive.cli.print.current.db=true;
```
Hive prompt will indicate the current db.


## Step 0 : Instructor will demo this lab on screen first

## Step 1 : Hive vs. Beeline
There are two shells for interacting with Hive.
* Hive : oldest 
* Beeline : newest, faster

### Hive Shell
```bash

    $   hive

    hive>   show databases;
```

### Beeline Shell
```sql
    
    $  beeline

    beeline>   !connect jdbc:hive2://
    -- enter for user / pass

    -- or !connect jdbc:hive2://server_ip:10000


    beeline> show databases;
```

## Step 2: Start Hive Shell
Login to the Hadoop cluster using SSH  (Instructor will provide details).

And fire up Hive shell (Hive / Beeline)

```bash
    $  hive

    # or 

    $ beeline
```

## Step 2: Create your own database
Change 'MY_NAME' accordingly.

```sql

    hive>    
            -- see databases
            show databases;

            -- create your own database
            create database MY_NAME_db;
            show databases;
```

## STEP 3: Create a Hive tables

Make sure to use your own DB.

```sql

    hive>
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
        LOCATION '/data/transactions/in/'  ;

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
            LOCATION '/data/vendors/in/'  ;


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
        LOCATION '/data/accounts/in/'  ;

```



## STEP 4:  Run queries
Lets see data in table.
```sql
    hive >  
        set hive.cli.print.header=true;

        select * from transactions limit 10;

        select * from accounts limit 10;

        select * from vendors limit 10;
```


