<link rel='stylesheet' href='../assets/css/main.css'/>

# Spark Shell

### Depends On
[Hadoop setup](../setup-instructor.md)

## Step 1 : Login to Hadoop Node
Follow instructions for your environment.

## Step 2 : Start Spark shell

```bash
    $    spark-shell
```

** ==> Configuring UI options **  
Spark Shell by default publishes a UI on port number 4040.  
How ever when multiple apps are running, and port 4040 already taken, Spark Shell will try to find an open port (4041, 4042 ..etc)

Specifying a custom port
```bash
    $   spark-shell  --conf spark.ui.port=4060
```

Turn off UI altogether  
```bash
    $   spark-shell  --conf spark.ui.enabled=false
```

## Step 3 : Set the log level to WARN
Type this in Spark Shell
```scala
    sc.setLogLevel("WARN")
```

## Step 4 : Inspect the Shell UI
Look at the console log to identify the Spark Shell UI port.

```console
INFO Utils: Successfully started service 'SparkUI' on port 4042.
```

(In the above example port number of 4042).   

Access Spark Shell UI as http://hadoop_node_ip_address:port_number  

(Instructor will provide more details)


## Step 5 : Load a file 
Let's load  `/etc/hosts` file in Spark Shell.
Issue the following commands in Spark-shell

```scala

        val f = sc.textFile("file:///etc/hosts")

        // count how many lines are there
        f.count

        // print the first line
        f.first

        // print all lines
        f.collect

        // better print
        f.foreach(println)
```

** => Inspect the Spark Shell UI (port 4040) ** 

## Step 6 : Load a HDFS file
Let's load  a sample clickstream data from `/data/clickstream/in/clickstream.csv'.
Try the following in Spark-shell

```scala

    val a = sc.textFile("/data/clickstream/in/clickstream.csv")

    // count the lines
    a.count

    // print the lines
    a.collect
    a.foreach(println)


```

## Step 7 : Loading Entire Directory
Now let's load all data in `clickstream/in` directory.

```scala

    val a = sc.textFile("/data/clickstream/in/")

    // count the lines
    a.count

```


** => Inspect the Spark Shell UI  ** 
