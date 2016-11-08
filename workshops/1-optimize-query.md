<link rel='stylesheet' href='../assets/css/main.css'/>

[<< back to main index](../README.md)

# Optimize Query


## Step 0 : Instructor Only : Stage JSON data in to HDFS
Follow [setup-clickstream.md](../../setup-clickstream.md)


## Group Exercise
Divide into 2 groups.
* One using Cloudera cluster
* Another using Hortonworks cluster

### Join
Here is a hive join query
```
    $   hive

    hive> 
          select clickstream.*, domains.*
                from clickstream join domains on
                (clickstream.domain = domains.domain)
                limit 10;
```

### Find top 10 categories by traffic
Modify the above query to calculate top-10 categories by traffic.

How long is the query taking?

## Optimize !
Try all the tricks you have learned to optimize this query.

Goal is to bring the run time as low as possible.
