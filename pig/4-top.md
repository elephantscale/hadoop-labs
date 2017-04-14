<link rel='stylesheet' href='../../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Pig Lab : Calculate Top-10 Customers

## Working Dir
`MY_NAME/hadoop-labs/pig/`

**(Instructor : Answer  `/labs-solutions/hadoop/pig/billing-answer.pig`)**

## Step 1 : Go to working directory
```bash
    $   cd MY_NAME/hadoop-labs/pig/
```

## STEP 2:  Edit the Pig script
Edit file :    `~/MY_NAME/hadoop-labs/pig/4-top.pig`.  
Fix TODO items and save the file.   
And run the script as follows.

```bash
    $  pig 4-top.pig  2> log
```


Q : How many mapreduce jobs are launched?
    can we co-relate Pig statements and MR jobs?

Q : Inspect the Job DAG Pig prints after the job run
(may be have to scroll up/through Pig output to see this)
