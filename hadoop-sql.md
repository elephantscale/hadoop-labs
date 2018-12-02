<link rel='stylesheet' href='assets/css/main.css'/>

SQL Analytics in Hadoop
=======================

Viewing the files:
-----------------
Markdown files are plain text files and can be viewed in any text editor.

For best viewing experience we recommend the following setup

* Get Chrome browser from : https://www.google.com/chrome/browser/desktop/

* Install **Markdown Preview Plus Plugin** for Chrome.  
Go to this url in Chrome & click add to Chrome.  
    https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl?hl=en-US  
If this link does not work, search for markdown-preview-plus in https://chrome.google.com/webstore

* Once installed, go to 'Window --> Extensions' menu of Chrome ;   Find 'Markdown Preview Plus' plugin ;  set 'Allow access to file urls'

* Open any .md file using Chrome (File --> Open)


Editors
-------
We recommend using a 'programmer's editor' to view these files. These editors have integrated file browser and allows navigating through files quickly.

* For Windows : [Atom](https://atom.io), [Sublime](http://www.sublimetext.com/), [NodePad++](http://notepad-plus-plus.org/), [Textpad](http://www.textpad.com/)

* For Mac : [Atom](https://atom.io), [Sublime](http://www.sublimetext.com/),  [TextWrangler](http://www.barebones.com/products/textwrangler/)

* For Linux : [Atom](https://atom.io), [Sublime](http://www.sublimetext.com/), GEdit, Vim

# Labs

#### Setup
- [Setup by instructor](setup-instructor.md) - To be completed by _instructor only_

#### Hadoop & HDFS
- [HADOOP-1 : Hadoop Intro](intro/1-hadoop-intro.md)
- [HDFS-1 : HDFS Intro](hdfs/1-hdfs-intro.md) - demo by instructor

#### MapReduce - Optional demo by instructor
- [MR-1 : MapReduce GREP](mapreduce/1-grep.md)

#### Hive
- [HIVE-0 : Hive background](hive/README.md) - Read this first
- [HIVE-1 : Hive intro](hive/1-intro.md)
- [HIVE-2 : Hive billing](hive/2-billing.md)
- [HIVE-3 : Hive partitions](hive/3-partitions.md)
- [HIVE-4 : Hive join](hive/4-join.md)
- [HIVE-5 : Stats](hive/5-stats.md)
- [HIVE-6 : JSON format](hive/6-json.md)
- [HIVE-7 : Quartiles](hive/7-histograms.md)
- [HIVE-8 : Spark & Tez Engines](hive/8-engines.md)
- [HIVE-9 : Data formats](hive/9-data-formats.md)
- [HIVE-10 : Hive text processing](hive/10-text.md)
- [HIVE-11 : Bonus : Optimize queries](hive/11-optimize.md)


#### Impala (only on Cloudera Distribution)
- Setup: We will use a Cloudera cluster for Impala.
  - 1 : Instructor only : Run [instructor setup](setup-instructor.md) on cluster
  - 2 : Students : Create Hive tables using [setup-ccdata](setup-ccdata.md)
- [IMPALA-1 : Intro](impala/1-intro.md)
- [IMPALA-2 : Performance](impala/2-perf.md)

#### Spark
- [SPARK-1 : Spark Shell](spark/1-spark-shell.md)
- [SPARK-2 : RDDs](spark/2-RDD.md)
- [SPARK-3 : Caching](spark/3-caching.md)
- [SPARK-4 : Spark SQL](spark/4-spark-sql.md)
- [SPARK-5 : Spark and Hive](spark/5-spark-and-hive.md)
- [SPARK-6 : Data formats](spark/6-data-formats.md)

#### Workshops
- [WORKSHOP-1 : optimize query](workshops/1-optimize-query.md)
