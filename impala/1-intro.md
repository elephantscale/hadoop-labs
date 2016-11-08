<link rel='stylesheet' href='../assets/css/main.css'/>

[<< back to main index](../README.md)

Lab :  Intro To Impala
===========================================

### Overview

In this lab we will build and query an impala table

### Builds on
None

### Run time
approx. 15 minutes

### Working directory
MY_NAME/hadoop-sql/impala/

### Notes
Replace `MY_NAME` appropriately throughout this lab.


----------------------------
STEP 0:  Setup 'Credit Card' data
----------------------------
Setup data using this lab : [cc-data](../../cc-data/README.md).  
You can skip this step if you had done it already.

----------------------------
Step 1: Start the Impala Shell
----------------------------
We are going to start the impala shell.

```bash

   $  impala-shell
   *********************
   Welcome to the Impala Shell. Copyright (c) 2015 Cloudera, Inc. All rights reserved.
   ...
   *******************
```

Now we are in the impala shell.  Let's see what databases we have.

**=> Enter the SHOW DATABASES COMMAND** 
```sql
   impala> 

         SHOW DATABASES;
```

What is the result?   Why?

You may not see your database, though if you are on a shared machine you might. The reason why
is that hive metadata is not automatically loaded into impala.


----------------------------
Step : Update the metadata 
----------------------------

**=> Invalidate metadata, and then Enter the SHOW DATABASES COMMAND** 

```sql
   impala> 
         INVALIDATE METADATA;
         SHOW DATABASES;
```


----------------------------
Step : Verify that impala can read the data 
----------------------------

Start the impala shell again.

We are going to start the impala shell.

**=> DO A SELECT STATEMENT** 

```sql
   impala>
        use MYNAME_db;
        select * from transactions limit 10;
```


```console
   Query: select * from transactions limit 10
   +--------+------------+-----------+---------------------+---------------+----------------+--------+
   | id     | account_id | vendor_id | transaction_date    | location_city | location_state | amount |
   +--------+------------+-----------+---------------------+---------------+----------------+--------+
   | 100001 | 3617       | 5         | 2015-01-02 00:00:00 | El Paso       | TX             | 167.02 |
   | 100002 | 6111       | 9         | 2015-01-02 00:00:00 | Tacoma        | WA             | 116.61 |
   | 100003 | 9942       | 7         | 2015-01-02 00:00:01 | New Orleans   | LA             | 225.14 |
   | 100004 | 5842       | 5         | 2015-01-02 00:00:02 | Savannah      | GA             | 228.01 |
   | 100005 | 6282       | 7         | 2015-01-02 00:00:03 | Henderson     | NV             | 181.52 |
   | 100006 | 4231       | 4         | 2015-01-02 00:00:04 | Henderson     | NV             | 11.46  |
   | 100007 | 485        | 5         | 2015-01-02 00:00:05 | Boise         | ID             | 119.46 |
   | 100008 | 9302       | 9         | 2015-01-02 00:00:06 | Baltimore     | MD             | 157.81 |
   | 100009 | 2080       | 5         | 2015-01-02 00:00:06 | Tacoma        | WA             | 195.94 |
   | 100010 | 2146       | 4         | 2015-01-02 00:00:07 | Austin        | TX             | 145.63 |
   +--------+------------+-----------+---------------------+---------------+----------------+--------+
   Fetched 10 row(s) in 0.42s
```

----------------------------
Step : Do A More Complex Query
----------------------------

**=> EXECUTE THE FOLLOWING QUERY** 

```sql
   impala> 
      select location_city, avg(amount) as city_avg from transactions group by location_city order by city_avg limit 10;
```

You should get something like the following;

```console
Query: select location_city, avg(amount) as total from transactions group by location_city order by total desc limit 10
+---------------+-------------------+
| location_city | total             |
+---------------+-------------------+
| Hartford      | 151.5453329521629 |
| Peoria        | 151.5219756078939 |
| Baltimore     | 151.5003414013226 |
| El Paso       | 151.2739027675028 |
| New Orleans   | 151.1378479742521 |
| Savannah      | 151.1279420679726 |
| Topeka        | 151.1048647053224 |
| Springfield   | 151.0702846253035 |
| San Francisco | 151.0360279807659 |
| Tacoma        | 150.894510612307  |
+---------------+-------------------+
Fetched 10 row(s) in 0.53s
```

Note the time.   Not too bad. 


----------------------------
Step : Try the same query in hive
----------------------------

```sql
   $ hive

   hive> 
         use MY_NAME_db;

         select location_city, avg(amount) as city_avg from transactions group by location_city order by city_avg limit 10;
```

The results should look something like this. Note the time elapsed.

Wow!  Impala is a lot faster than Hive (for this situation anyway).

```console
Query ID = ec2-user_20160727084747_f443a0a1-c4cd-4228-838c-bcaadd9056b5
Total jobs = 2
Launching Job 1 out of 2
......
Starting Job = job_1469478104374_0001, Tracking URL = http://ip-10-148-5-223.ec2.internal:8088/proxy/application_1469478104374_0001/
Kill Command = /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/lib/hadoop/bin/hadoop job  -kill job_1469478104374_0001
Hadoop job information for Stage-1: number of mappers: 5; number of reducers: 1
2016-07-27 08:47:40,419 Stage-1 map = 0%,  reduce = 0%
2016-07-27 08:47:54,899 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 12.32 sec
MapReduce Total cumulative CPU time: 12 seconds 320 msec
Ended Job = job_1469478104374_0001
Launching Job 2 out of 2
Kill Command = /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/lib/hadoop/bin/hadoop job  -kill job_1469478104374_0002
...
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2016-07-27 08:48:01,179 Stage-2 map = 0%,  reduce = 0%
2016-07-27 08:48:13,508 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 2.31 sec
MapReduce Total cumulative CPU time: 2 seconds 310 msec
Ended Job = job_1469478104374_0002
MapReduce Jobs Launched:
Stage-Stage-1: Map: 5  Reduce: 1   Cumulative CPU: 12.32 sec   HDFS Read: 52811625 HDFS Write: 748 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 2.31 sec   HDFS Read: 5522 HDFS Write: 283 SUCCESS
Total MapReduce CPU Time Spent: 14 seconds 630 msec
OK
Hartford	151.54533295216316
Peoria	151.52197560789398
Baltimore	151.50034140132217
El Paso	151.27390276750288
New Orleans	151.13784797425234
Savannah	151.1279420679721
Topeka	151.1048647053222
Springfield	151.07028462530337
San Francisco	151.03602798076594
Tacoma	150.89451061230733
Time taken: 42.115 seconds, Fetched: 10 row(s)
```

