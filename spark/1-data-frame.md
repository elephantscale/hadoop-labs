<link rel='stylesheet' href='../assets/css/main.css'/>

# Dataframe



## Step 0 : Instructor Only : Stage JSON data in to HDFS
Follow [setup-clickstream.md](../setup-clickstream.md)


## Step 2 : Start Spark shell

```bash
    $    spark-shell
```

And set the log level to WARN
```
    scala> 
            sc.setLogLevel("WARN")
```


## Step 3 : Load JSON into Dataframe
Issue the following commands in Spark-shell

```scala

    val clickstream = sqlContext.read.json("/data/clickstream/in-json/clickstream.json")

    // inspect the schema
    clickstream.printSchema

    // inspect data
    clickstream.show
```

## Step 4 : Methods available on Dataframe
Use tab completion to explore methods available

```
    clickstream.  HIT THE TAB KEY
```


## Step 5 : Querying Dataframes

**Find records that have cost > 100**
```scala

    val over100 = clickstream.filter(clickstream("cost") > 100)
    over100.show

    // count the records
    over100.count
```

**Count records where action = 'click'**  
```scala

    clickstream.filter(clickstream("action") === "clicked").count
```

**Count the number of visits from each domain**    
```scala

    clickstream.groupBy("domain").count.show
```

## Step 6 : Querying Using SQL

```scala

    //  register the data frame as a temporary table
    clickstream.registerTempTable("clickstream")

    // try sql queries
    sqlContext.sql("select * from clickstream").show

    // find all facebook traffic
    sqlContext.sql("select * from clickstream where domain = 'facebook.com'").show

    // count traffic per domain from highest to lowest
    sqlContext.sql("select domain, count(*) as total from clickstream  group by domain order by total desc").show

```


## Step 7 : Load all JSON data
Let's load all JSON files in `/data/clickstream/in-json` directory

```scala

    val clicks = sqlContext.read.json("/data/clickstream/in-json/")
    clicks.count

    clicks.groupBy("domain").count.show

    // repeat instructions from step 6
```