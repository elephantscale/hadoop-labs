<link rel='stylesheet' href='../assets/css/main.css'/>
[Main Index](../README.md)

-----
# MR2 : Map Reduce Examples - Word Count

`Word Count`  is the `hello world` of Hadoop!

## STEP 1: Setup some data
```bash
    $    cd <my name>  # go to your workspace
    $    hdfs dfs  -mkdir  -p MY_NAME/twinkle/in
    $    hdfs dfs  -put  hadoop-dev-labs/data/twinkle/sample.txt   MY_NAME/twinkle/in/
```


## STEP 2: Try wordcount
```
    $  hadoop org.apache.hadoop.examples.WordCount
```
Will print out usage.  
e.g
```bash
    $  hadoop org.apache.hadoop.examples.WordCount   MY_NAME/twinkle/in   MY_NAME/twinkle/out
```

Inspect the result in output dir  `MYNAME/twinkle/out`
```bash
    $ hdfs dfs -cat   MY_NAME/twinkle/out/*
```


## BONUS Lab) word-count on large files:
If you haven't done so, generate some files
```bash
    $  cd <my name>  # go to your workspace
    $  cd hadoop-dev-labs/data/twinkle
    $  ./create-data-files.sh
```
This will produce files of various sizes.  
Copy 1G.data files into HDFS.  
```bash
    $   hdfs   dfs -put   1G.data  MY_NAME/twinkle/in
```

Now re-run the wordcount example on the large file  `MY_NAME/twinkle/in`.  
How many Maps are launched ?  
Can you figure out why?  
