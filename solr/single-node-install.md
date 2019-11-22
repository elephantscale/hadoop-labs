# Solr Intro:

## 1.1-Install-server

In this lab we will practice the installation of the Solr server.


Lab Goals:

* Install Solr and verify its operation
* Prepare to use this install for all subsequent labs

### STEP 1) Login to the server
 
Each student is provided his/her individual server and credentials

(Instructor: use m3.medium instance and Solr security group)

### STEP 2) Verify the environment

Verify that you have Java installed 
```bash
    java -version
```

If not installed

```bash
   sudo rm -f /var/lib/dpkg/lock-frontend
   sudo apt install default-jdk
   java -version
```   


### STEP 3) Download and install Solr

Solr is found here, [Solr web site]

```bash
https://www-eu.apache.org/dist/lucene/solr/8.3.0
```

Find out the link to download, copy the link, then use the wget (or curl) command to place the Solr bundle on your server, such as


```bash
    wget https://www-eu.apache.org/dist/lucene/solr/8.3.0/solr-8.3.0.tgz
```

Decompress and untar the bundle. Put solr in your home directory, like this:

```bash
    tar zxf solr-8.3.0.tgz
    mv solr-8.3.0 ~/solr
```

### Step 4) Check ulimit

If you start solr now, you will likely get this nasty warning:


```console
*** [WARN] *** Your open file limit is currently 1024.  
 It should be set to 65000 to avoid operational disruption. 
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh
*** [WARN] ***  Your Max Processes Limit is currently 31748. 
 It should be set to 65000 to avoid operational disruption. 
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh
```

So, let us avoid this problem by properly setting our ulimits. First, let's check to see our current ulimit:

```console
$ ulimit -n
1024
```

Let see our max ulmit: 

```console
$ cat /proc/sys/fs/file-max
810574
```

Plenty of room for improvement, right?

Let's change it to 65000, as solr recommends:

```console
$ sudo  nano /etc/sysctl.conf
```

add the following:

```console
fs.file-max = 65000
```

Run this:

```bash
sudo sysctl -p
```

Edit this file:

```console
$ sudo nano /etc/security/limits.conf
```

Add this:

```console
* soft     nproc          65000    
* hard     nproc          65000   
* soft     nofile         65000   
* hard     nofile         65000 
root soft     nproc          65000    
root hard     nproc          65000   
root soft     nofile         65000   
root hard     nofile         65000
```

Edit this file:

```console
$ sudo nano /etc/pam.d/common-session
```

Add this:

```console
session required pam_limits.so
```

Logout:

```console
$ exit
```

Log in again and type

```console
$ ulimit -n
65000
```

You should see 65000



### STEP 5) Start Solr

Assuming that `$SOLR_INSTALL/` is where you put your Solr

**=> Execute the following Commands:**


```bash
    export SOLR_INSTALL=$HOME/solr
    cd $SOLR_INSTALL
    ./bin/solr start -e cloud
```    

You will see the following output:

```console

Welcome to the SolrCloud example!

This interactive session will help you launch a SolrCloud cluster on your local workstation.
To begin, how many Solr nodes would you like to run in your local cluster? (specify 1-4 nodes) [2]:
```

**=> Select the Defaults value of 2 for number of nodees.**

```console
Ok, let's start up 2 Solr nodes for your example SolrCloud cluster.
Please enter the port for node1 [8983]:

Please enter the port for node2 [7574]:
```

**=> Select the Defaults value of `8983` and `7574` respectively for node1 and node2 port.**

You will observe the following output:

```console
Starting up Solr on port 8983 using command:
"bin/solr" start -cloud -p 8983 -s "example/cloud/node1/solr"

Waiting up to 180 seconds to see Solr running on port 8983 [\]
Started Solr server on port 8983 (pid=34942). Happy searching!

Starting up Solr on port 7574 using command:
"bin/solr" start -cloud -p 7574 -s "example/cloud/node2/solr" -z localhost:9983

Waiting up to 180 seconds to see Solr running on port 7574 [\]
Started Solr server on port 7574 (pid=35036). Happy searching!


INFO  - 2017-07-27 12:28:02.835; org.apache.solr.client.solrj.impl.ZkClientClusterStateProvider; Cluster at localhost:9983 ready
```

You will now be asked to create a collection. Note that we will **NOT** be selecting the default collection in this case:

```console
Now let's create a new collection for indexing documents in your 2-node cluster.
Please provide a name for your new collection: 
```

**=> Type in `techproducts` at the prompt and hit enter.**

Type in the name `techproducts` at the prompt at hit enter. 

It will now as you how many shards you want. The default 
value of `2` is fine.

**=> Select the default value of `2`.**

```console
How many shards would you like to split techproducts into? [2]
```

It will now as you how many replicas per shard you want. In this case the default of 2 is also fine.

**=> Again Select the default value of `2`.**

```console
How many replicas per shard would you like to create? [2]
```
**=> Again Select the default value of `2`.**


It will now ask you about the configsets. In this case you will **NOT** be selecting the default.


```console
Please choose a configuration for the techproducts collection, available options are:
_default or sample_techproducts_configs 
```

**=> Type in `sample_techproducts_configs` and hit enter.**

You should see the following output:

```console
Created collection 'techproducts' with 2 shard(s), 2 replica(s) with config-set 'techproducts'

Enabling auto soft-commits with maxTime 3 secs using the Config API

POSTing request to Config API: http://localhost:8983/solr/techproducts/config
{"set-property":{"updateHandler.autoSoftCommit.maxTime":"3000"}}
Successfully set-property updateHandler.autoSoftCommit.maxTime to 3000


SolrCloud example running, please visit: http://localhost:8983/solr
```


### Step 6) Check Solr Status

Call the following:

```bash
bin/solr status
```

You should get the following results:
 
```console
Found 2 Solr nodes:

Solr process 6690 running on port 7574
INFO  - 2019-02-05 15:10:33.723; org.apache.solr.util.configuration.SSLCredentialProviderFactory; Processing SSL Credential Provider chain: env;sysprop
{
  "solr_home":"/home/ubuntu/solr/example/cloud/node2/solr",
  "version":"8.3.0 719cde97f84640faa1e3525690d262946571245f - nknize - 2018-12-07 14:47:52",
  "startTime":"2019-02-05T15:09:52.467Z",
  "uptime":"0 days, 0 hours, 0 minutes, 41 seconds",
  "memory":"107.5 MB (%21.9) of 490.7 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}


Solr process 6518 running on port 8983
INFO  - 2019-02-05 15:10:34.729; org.apache.solr.util.configuration.SSLCredentialProviderFactory; Processing SSL Credential Provider chain: env;sysprop
{
  "solr_home":"/home/ubuntu/solr/example/cloud/node1/solr",
  "version":"8.3.0 719cde97f84640faa1e3525690d262946571245f - nknize - 2018-12-07 14:47:52",
  "startTime":"2019-02-05T15:09:46.861Z",
  "uptime":"0 days, 0 hours, 0 minutes, 48 seconds",
  "memory":"85.1 MB (%17.3) of 490.7 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}

```

### STEP 6) Verify If Solr Is Up And Running

Open this URL in your browser: 

```bash
http://your-server-url:8983/solr
```

You will be redirected to the Solr admin console


### STEP 7) Answer the following questions:

1 What is the value of the lucene-spec version property for your Solr server?

2 What is the log level of the org.apache.solr.core.SolrConfig class?

3 What is the value of the maxDoc property for the cores present?

4 What is the value of the java.vm.vendor Java system property?

5 What is the segment count for the cores present?

6 What is the response time of pinging your server?

7 What is the top term for the manu field? (Hint: select the manu field in the schema
browser, and click the Load Term Info button.)

8 What is the current size of your documentCache? (Hint: think stats.)

9 What is the analyzed value of the name Belkin Mobile Power

Hint: select the name field on the Analysis page


