<link rel='stylesheet' href='../../assets/css/main.css'/>
[main index](../../README.md)

---- 

# Pig Intro Lab : learning pig concepts

## Working dir : 
    `~/MY_NAME/hadoop-dev-labs/4-pig/4.1-intro`

## STEP 1: Verify Pig is installed and configured properly
Invoke Pig in command line as follows:
```
        $   pig
```
Read the console output.  
Make sure pig can connect to HDFS and MapReduce.  
Exit pig shell by typing    `quit;`

## STEP 2:  Lab setup

### Go to the correct working directory:
Update MY_NAME accordingly.
```bash
    $   cd  ~/MY_NAME/hadoop-dev-labs/4-pig/4.1-pig
```


## STEP 3:  Edit the Pig script

Edit file :    `~/MY_NAME/hadoop-dev-labs/4-pig/4.1-pig/intro.pig`.  

Use one of the three, in order of preference
* NoIDE editor in the browser
* nano intro.pig
* vi intro.pig

Fix TODO items and save the file.   
And run the script as follows.

```bash
    $  pig intro.pig
```

## TIPS

**To print/echo something from pig script**
```pig
    sh echo "hello there... "
```

**To change the name of pig script supply 'job.name' parameter** 
```
    $ pig -Djob.name="hello"  script.pig
```

**Turning off logging in pig** 
```
    $   pig script.pig   2> logs
    #  all logs will be sent to logs file
```
**'echoing' execution line by line   (like sh -x)** 
```
    $   pig   < script.pig
```
