<link rel='stylesheet' href='../assets/css/main.css'/>

# Hive And Spark


## Step 2 : In Terminal 1 : Start Hive Shell
```bash
    $   hive
```

Inspect the tables and run a query on 'clickstream' table.

```sql
    hive>
        show tables;

        select * from clickstream limit 10;

        select action, count(*) as total from clickstream group by action;
```


## Step 3 : In Terminal 2 Start Spark shell

```bash
    $    spark-shell
```

Type this in Spark Shell
```
    sc.setLogLevel("WARN")
```

Go to http://localhost:4040 in the browser.


## Step 4 : Inspect Hive Tables
Do this in Spark-Shell

```scala

scala>

    sqlContext.tableNames

    val t = sqlContext.table("clickstream")

    t.printSchema

    t.show

    sqlContext.sql("select * from clickstream limit 10").show

    sqlContext.sql("select action, count(*) as total from clickstream group by action").show
```
