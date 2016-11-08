<link rel='stylesheet' href='../assets/css/main.css'/>

[<< back to main index](../README.md)


Lab :  Profiling and Performance Tuning 
===========================================

### Overview
In this lab we will tune Impala for performance.

### Builds on
None

### Run time
approx. 15 minutes

### Working directory
~/MY_NAME/hadoop-sql/impala/perf

### Notes
Replace `MY_NAME` appropriately throughout this lab.


----------------------------
STEP 0:  Setup 'Credit Card' data
----------------------------
Setup data using this lab : [cc-data](../../cc-data/README.md).  
You can skip this step if you had done it already.

Be sure your database MY_NAME_db already exists.


----------------------------
Step : Verify that new accounts table has data
----------------------------
Start impala-shell, select some data:
```bash
    $ impala-shell 

    impala>
        INVALIDATE METADATA;
        use MY_NAME_db;
        SHOW TABLES;
        select * from accounts  limit 10;
```

Output may look like following:
```console
+----+-----------+--------+------------+-----------+---------------------------------+--------+-----------------------+-----------------+-------+-------+
| id | accountno | bankid | first_name | last_name | email                           | gender | address               | city            | state | zip   |
+----+-----------+--------+------------+-----------+---------------------------------+--------+-----------------------+-----------------+-------+-------+
| 1  | 1         | 1      | Ryan       | Johnston  | rjohnston0@mayoclinic.com       | Male   | 5 Hintze Terrace      | Laredo          | TX    | 78044 |
| 2  | 2         | 9      | Todd       | Martin    | tmartin1@europa.eu              | Male   | 878 Sheridan Point    | Columbia        | SC    | 29215 |
| 3  | 3         | 1      | Sharon     | Martin    | smartin2@archive.org            | Female | 2 Fremont Plaza       | Lubbock         | TX    | 79452
| 4  | 4         | 6      | Theresa    | Hughes    | thughes3@t-online.de            | Female | 34304 Darwin Road     | Washington      | DC    | 20099 |
| 5  | 5         | 4      | Mary       | Wright    | mwright4@alexa.com              | Female | 0570 Lotheville Lane  | Conroe          | TX    | 77305 |
| 6  | 6         | 7      | Margaret   | Fuller    | mfuller5@twitter.com            | Female | 307 Transport Parkway | Boise           | ID    | 83732 |
| 7  | 7         | 2      | Carolyn    | Martin    | cmartin6@mashable.com           | Female | 5 Grover Hill         | Shawnee Mission | KS    | 66205 |
| 8  | 8         | 8      | Aaron      | Castillo  | acastillo7@pagesperso-orange.fr | Male   | 9293 Hintze Hill      | Aiken           | SC    | 29805 |
| 9  | 9         | 8      | Juan       | George    | jgeorge8@mac.com                | Male   | 98 Ramsey Junction    | Garland         | TX    | 75049 |
| 10 | 10        | 0      | Jimmy      | Russell   | jrussell9@nymag.com             | Male   | 6521 Mendota Lane     | Philadelphia    | PA    | 19125 |
+----+-----------+--------+------------+-----------+---------------------------------+--------+-----------------------+-----------------+-------+-------+
```



----------------------------
Step : Explain more complex query
----------------------------

**=> EXECUTE THE FOLLOWING QUERY** 

```sql
impala>

   select location_city, avg(amount) as city_avg from transactions group by location_city order by city_avg limit 10;

  EXPLAIN select location_city, avg(amount) as city_avg from transactions group by location_city order by city_avg limit 10;

```

You should get something like the following;

```console
+------------------------------------------------------------------------------------+
| Explain String                                                                     |
+------------------------------------------------------------------------------------+
| Estimated Per-Host Requirements: Memory=288.00MB VCores=2                          |
| WARNING: The following tables are missing relevant table and/or column statistics. |
| tim_db.transactions                                                                |
|                                                                                    |
| 05:MERGING-EXCHANGE [UNPARTITIONED]                                                |
| |  order by: avg(amount) ASC                                                       |
| |  limit: 10                                                                       |
| |                                                                                  |
| 02:TOP-N [LIMIT=10]                                                                |
| |  order by: avg(amount) ASC                                                       |
| |                                                                                  |
| 04:AGGREGATE [FINALIZE]                                                            |
| |  output: avg:merge(amount)                                                       |
| |  group by: location_city                                                         |
| |                                                                                  |
| 03:EXCHANGE [HASH(location_city)]                                                  |
| |                                                                                  |
| 01:AGGREGATE [STREAMING]                                                           |
| |  output: avg(amount)                                                             |
| |  group by: location_city                                                         |
| |                                                                                  |
| 00:SCAN HDFS [tim_db.transactions]                                                 |
|    partitions=1/1 files=11 size=50.34MB                                            |
+------------------------------------------------------------------------------------+

```

What do you notice about the explain?



----------------------------
Step :  update the statistics on the transactions table
----------------------------

```
  impala>
    COMPUTE STATS transactions;
```

**=> Run the explain command again** 

```
  impala>
     EXPLAIN select location_city, avg(amount) as city_avg from transactions group by location_city order by city_avg limit 10;

```

Do you see the warning about statistics?

----------------------------
Step :  Explain a query involving a join between two tables.
----------------------------

```sql
  impala>

    select t.id, t.account_id, a.last_name, a.first_name, t.transaction_date, t.amount FROM transactions t JOIN accounts  a on a.id = t.id limit 10;
```

The results should be as follows:

```console

ip-10-157-143-105.ec2.internal:21000] > select t.id, t.account_id, a.last_name, a.first_name, t.transaction_date, t.amount FROM transactions t JOIN accounts a on a.id = t.id limit 10;;
Query: select t.id, t.account_id, a.last_name, a.first_name, t.transaction_date, t.amount FROM transactions t JOIN accounts a on a.id = t.id limit 10
+----+------------+-----------+------------+---------------------+--------+
| id | account_id | last_name | first_name | transaction_date    | amount |
+----+------------+-----------+------------+---------------------+--------+
| 1  | 5715       | Johnston  | Ryan       | 2015-01-01 00:00:00 | 62.81  |
| 2  | 8236       | Martin    | Todd       | 2015-01-01 00:00:00 | 157.33 |
| 3  | 2500       | Martin    | Sharon     | 2015-01-01 00:00:01 | 14.86  |
| 4  | 6032       | Hughes    | Theresa    | 2015-01-01 00:00:02 | 203.46 |
| 5  | 6859       | Wright    | Mary       | 2015-01-01 00:00:03 | 231.98 |
| 6  | 9694       | Fuller    | Margaret   | 2015-01-01 00:00:04 | 2.13   |
| 7  | 9411       | Martin    | Carolyn    | 2015-01-01 00:00:05 | 270.31 |
| 8  | 5490       | Castillo  | Aaron      | 2015-01-01 00:00:06 | 176.84 |
| 9  | 1565       | George    | Juan       | 2015-01-01 00:00:06 | 12.5   |
| 10 | 8180       | Russell   | Jimmy      | 2015-01-01 00:00:07 | 257.15 |
+----+------------+-----------+------------+---------------------+--------+
Fetched 10 row(s) in 0.63s
[ip-10-157-143-105.ec2.internal:21000] >

```

Let's see the explain command


**=> Run the explain command again** 


```sql
EXPLAIN select t.id, t.account_id, a.last_name, a.first_name, t.transaction_date, t.amount 
FROM transactions t JOIN accounts  a on a.id = t.id limit 10;
```


```console
+------------------------------------------------------------------------------------+
| Explain String                                                                     |
+------------------------------------------------------------------------------------+
| Estimated Per-Host Requirements: Memory=2.03GB VCores=2                            |
| WARNING: The following tables are missing relevant table and/or column statistics. |
|       .accounts,       .transactions                                               |
|                                                                                    |
| 04:EXCHANGE [UNPARTITIONED]                                                        |
| |  limit: 10                                                                       |
| |                                                                                  |
| 02:HASH JOIN [INNER JOIN, BROADCAST]                                               |
| |  hash predicates: t.id = a.id                                                    |
| |  runtime filters: RF000 <- a.id                                                  |
| |  limit: 10                                                                       |
| |                                                                                  |
| |--03:EXCHANGE [BROADCAST]                                                         |
| |  |                                                                               |
| |  01:SCAN HDFS [tim_db.accounts a]                                                |
| |     partitions=1/1 files=1 size=86.91KB                                          |
| |                                                                                  |
| 00:SCAN HDFS [tim_db.transactions t]                                               |
|    partitions=1/1 files=11 size=50.34MB                                            |
|    runtime filters: RF000 -> t.id                                                  |
+------------------------------------------------------------------------------------+
```
----------------------------
Step :  Run COMPUTE STATS on both tables.
----------------------------

```sql
  impala>
     COMPUTE STATS transactions;
     COMPUTE STATS accounts;
```


----------------------------
Step : CREATE PARQUET TABLES for both tables
----------------------------

```sql
  impala> 
     CREATE TABLE transactions_parquet stored as parquet as select * from transactions;
     CREATE TABLE accounts_parquet stored as parquet as select * from accounts;
     COMPUTE STATS transactions_parquet;
     COMPUTE STATS accounts_parquet;
```


Check the contents of both new tables to make sure they are fine.


----------------------------
Step :  Do a summary
----------------------------

```sql

impala>
   
  select t.id, t.account_id, a.last_name, a.first_name, t.transaction_date, t.amount FROM transactions t JOIN accounts  a on a.id = t.id limit 10;

  summary;
```

Check out the summary report of the query.


----------------------------
Step :  Do a profile 
----------------------------

```sql
  impala>
      profile;
```

What do you see?  Note that the profile was done on the queries following.



