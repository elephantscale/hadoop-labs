<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Lab HIVE-9: Using Tez With Hive


### Overview
Hive  &  Tez

### Builds on
None

### Run time
approx. 10 minutes

### Note
Tez only works on Hortonworks Hadoop distribution


## Step 1: Launch Hive Shell
```bash
    $  hive
    # or beeline
```

## Step 2: Run a simple aggregate query in MR mode
```sql
    hive>
            set hive.cli.print.current.db=true;

            use MY_NAME_db;

            set hive.execution.engine=mr;  

            select account_id, SUM(amount) as total from transactions group by account_id order by total desc limit 10;
```

Note the time taken by query

## Step 3 : Query using Tez

```sql
    hive>
            set hive.execution.engine=tez;  

            select account_id, SUM(amount) as total from transactions group by account_id order by total desc limit 10;
```

Note the time taken.

Run the query again a few times, and notice the time taken.  
Can you explain the behavior?


## Step 4 : Try a Join query
Join transactions & vendors

```sql
    hive>

    select  vendors.category,  SUM(transactions.amount) as total
        from transactions join vendors on (transactions.vendor_id = vendors.id) group by vendors.category ;

```


Observe the run behavior.
