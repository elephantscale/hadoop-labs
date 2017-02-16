<link rel='stylesheet' href='../assets/css/main.css'/>

[<< back to main index](../README.md)

Lab : RDD Caching
=====================

### Overview
Understanding RDD caching

### Depends On 
None

### Run time
15-20 mins


## STEP 1: Inspect data

Under `/data/twinkle` directory we have created some large data files for you.  Verify this by using HDFS file browser

## STEP 2: Start Spark Server / Shell

```bash
    $  spark-shell   --executor-memory 2G  --driver-memory 2G
```

Also set the logging level to INFO (so Spark will print out job execution times on console)

```scala
    scala> 
            sc.setLogLevel("INFO")
```


### STEP 3: Recording Caching times
Download and inspect the Excel worksheet : [caching-worksheet](caching-worksheet.xlsx).   
We are going to fill in the values here to understand how caching performs.

It looks like this:

<img src="../assets/images/3.6a.png" style="border: 5px solid grey; max-width:100%;"/>


### STEP 4: Load RDD

Load a big file (e.g 500M.data)
    
```scala
    // scala
    val f = sc.textFile("/data/twinkle/500M.data")
```


**=> Count the number of lines in this file**    
Hint : `count()`  

**=> Notice the time took**   
Look for output like this in Spark Shell console

```console
Job 1 finished: count at <console>:30, took __3.792822__ s
```

**=> Do the same count() operation a few times until the execution time 'stablizes'**  
**=> Record the time in spreadsheet.**  
**=> Can you explain the behavior of count() execution time ?**


### STEP 5:  Cache

**=> Cache the file using  `cache()` action.**  
    
```scala
    f.cache()
```

**=> Run the `count()` again. Notice the time.   Can you explain this behavior ?  :-)** 

**=> Run count() a few more times and note the execution times.**  
**=> Record the time in spreadsheet.**  
**=> Do the timings make sense?** 


### STEP 6:  Understanding Cache storage

Go to spark shell UI @ port 4040  
**=> Inspect 'storage' tab**  

<img src="../assets/images/3.6b.png" style="border: 5px solid grey; max-width:100%;"/>

**=> Can you see the cached RDD?  What is the memory size?**  
**=> What are the implications?** 

### STEP 7:  Cache a larger file

**=> Try to cache 1G.data (`/data/twinkle/1G.data`) file and do count()**  
Is caching successful ?
If not, try starting Spark shell with more memory


### Step 8 : Caching RDD vs. Dataframe
We will load the same data using RDD API and Dataframe API will compare cache performance.

```scala
    // RDD
    val rdd = sc.textFile("data/twinkle/100M.data")
    rdd.cache
    rdd.count  // force caching


    // dataset
    val ds = spark.read.textFile("data/twinkle/100M.data")
    ds.cache
    ds.count  // force caching

```

Now check the 'Storage' tab in Spark Shell UI (port 4040).  

Here is a sample output.

<img src="../assets/images/3.6c-rdd-ds-cache.png" style="border: 5px solid grey; max-width:100%;"/>

** ==> Discuss your findings **



### Step 9 : Reducing memory footprint 

There are various levels of memory caching.  Here are a couple:  

* Raw caching (`rdd.persist(org.apache.spark.storage.StorageLevel.MEMORY_ONLY)`)  
* Serialized Caching (`rdd.persist(org.apache.spark.storage.StorageLevel.MEMORY_ONLY_SER)`)


**=> Try both options `f.persist(....)` .  Monitor memory consumption in storage tab**

**NOte: Caching level can not be changed after an RDD cached.  You have to 'uncache / unpersist' the RDD and then cache it again**

```scala
        rdd.persist(org.apache.spark.storage.StorageLevel.MEMORY_ONLY) // same as rdd.cache()
        rdd.unpersist()
        rdd.persist(org.apache.spark.storage.StorageLevel.MEMORY_ONLY_SER)
```


### Group discussion

* mechanics of caching
* implications of caching vs memory



### BONUS LAB : Caching data from Amazon S3

We have some data files stored in Amazon S3.  Here are couple of path names
* s3n://elephantscale-public/data/twinkle/100M.data
* s3n://elephantscale-public/data/twinkle/200M.data
* s3n://elephantscale-public/data/twinkle/500M.data
* and more...

If you have trouble with s3n protocol, you can first download the files with URL like

* https://s3.amazonaws.com/elephantscale-public/data/twinkle/100M.data
* https://s3.amazonaws.com/elephantscale-public/data/twinkle/200M.data

**=> Try loading these files.  Measure performance time before and after caching.**  

```scala
    // scala
    val f = sc.textFile("s3n://elephantscale-public/data/twinkle/200M.data")
    f.count() // measure time.. do it a couple of times
    f.cache() 
    f.count() // measure time.. do it a couple of times
```


### Further Reading

* [Understanding Spark Caching by Sujee Maniyam](http://sujee.net/2015/01/22/understanding-spark-caching/)
