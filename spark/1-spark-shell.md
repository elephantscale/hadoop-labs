<link rel='stylesheet' href='../assets/css/main.css'/>

# Spark Shell

## Working Directory
spark-shell

## Depends On
[Hadoop setup](../setup-instructor.md)

## Step 1 : Login to Hadoop Node
Follow instructions for your environment.

## Step 2 : Start Spark shell

```bash
    $    spark-shell
```

## Step 3 : Set the log level to WARN
Type this in Spark Shell
```scala
    sc.setLogLevel("WARN")
```

## Step 4 : Inspect the Shell UI
Go to http://host_name:4040 in the browser.  Instructor will provide details.


## Step 5 : Load a file 
Let's load  `/etc/hosts` file in Spark Shell.
Issue the following commands in Spark-shell

```scala

        val f = sc.textFile("file:///etc/hosts")

        # count how many lines are there
        f.count

        # print the first line
        f.first

        # print all lines
        f.collect
```

** => Inspect the Spark Shell UI (port 4040) ** 

## Step 6 : Load a HDFS file
Let's load  a sample clickstream data from `/data/clickstream/in/clickstream.csv'.
Try the following in Spark-shell

```scala

    val h = sc.textFile("/data/clickstream/in/clickstream.csv")

    # count the lines
    h.count

    # print the lines
    h.collect

```

Now let's load all data in `clickstream/in` directory.

```scala

    val h = sc.textFile("/data/clickstream/in/")

    # count the lines
    h.count
```

** => Inspect the Spark Shell UI (port 4040) ** 
