<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Lab : Hive Joins

## Step 1 : Inspect Tables

Launch Hive shell

```
    $  hive
```

```sql
    hive>
        set hive.cli.print.header=true;
        set hive.cli.print.current.db=true;

        show databases;
        use MY_NAME_db;

        show tables;

        desc transactions;
        desc vendors;

        select * from transactions limit 10;
        select * from vendors limit 10;
```

## Step 2 : Join 'transactions' and 'vendors' table

```sql
    hive>
        select transactions.*,  vendors.* from transactions join vendors on (transactions.vendor_id = vendors.id) limit 10; 
```

## Step 3 : More Joins
`vendors` table has `category` field.  
Calculate total money spent on each category.  Update the above join query.  Fill in values for '???'

```sql
    hive>
        select  vendors.category,  SUM(???) as total 
        from transactions join vendors on (transactions.vendor_id = vendors.id) group by ??? ; 

```

## Step 4  Pretty Print

Pretty print the numbers displayed.

Hint : checkout [format_number](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+UDF) function

## Bonus Lab 1 :  Calculate amount owed to each vendor
In `vendor` table you will find a column `swipe_rate`.  This is the rate they pay to accept credit card payments.

For example, 
* if swipe_rate is 3%
* customer paid $100 
* the vendor gets  : $100 x .97 = $97 

Calculate the final amount of money to be paid to each vendor.


## Bonus Lab 2 : Map side Join
Hive can cache small tables in memory.  This will speed up the join operation.

MapJoin syntax is:
```sql

    select /*+ MAPJOIN (small_table) */ big_table.*, small_table.* from ....

    -- for example
    select /*+ MAPJOIN (vendors) */ transactions.*,  vendors.* from .....
```

