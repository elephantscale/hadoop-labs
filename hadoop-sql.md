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

* Open any *.md file using Chrome (File --> Open)


Editors
-------
We recommend using a 'programmer's editor' to view these files. These editors have integrated file browser and allows navigating through files quickly.

* For Windows : [Sublime](http://www.sublimetext.com/), [NodePad++](http://notepad-plus-plus.org/), [Textpad](http://www.textpad.com/)

* For Mac : [Sublime](http://www.sublimetext.com/),  [TextWrangler](http://www.barebones.com/products/textwrangler/)

* For Linux : [Sublime](http://www.sublimetext.com/), GEdit, Vim


Labs
----

* **Setup**
  - [1 - Instructor Setup](setup-instructor.md) - To be completed by _instructor only_
  - [2 - Student Setup](setup-student.md)


1. **Hadoop & HDFS** 
    - [1.1 - Hadoop Intro](1-hadoop-hdfs/1.1-hadoop.md)
    - [1.2 - HDFS Intro](1-hadoop-hdfs/1.2-hdfs.md) - demo by instructor

2. **MapReduce** - Optional demo by instructor
    - [2.1 - MapReduce GREP](2-mapreduce/2.1-grep.md)

3. **Hive**
   - **Part I**
   - [3.0 - Hive background](3-hive/README.md) - Read this first
   - [3.1 - Hive intro](3-hive/3.1-intro/README.md)
   - [3.2 - Hive billing](3-hive/3.2-billing/README.md)
   - [3.3 - Hive join](3-hive/3.3-join/README.md)
   - [3.4 - Hive partitions](3-hive/3.4-partitions/README.md)
   - [3.5 - Hive text processing](3-hive/3.5-text/README.md)
   
   - **Part II**
   - [3.6 - JSON format](3-hive/3.6-json/README.md)
   - [3.7 - Quartiles](3-hive/3.7-quartiles/README.md)
   - [3.8 - Histograms](3-hive/3.8-histograms/README.md)
   - [3.9 - Tez](3-hive/3.9-tez/README.md)

4. **Impala**
   - **Setup**: We will use a Cloudera cluster for Impala.
      - Login to Cloudera cluster (Instructor will provide detaisl)
      - Run [setup1](setup-1.md) on cluster
   - [4.1 - Intro](impala/1-intro.md)
   - [4.2 - Performance](impala/2-perf.md)

5. Spark
   - 5.1 - Spark Setup (*Instructor only*).  
     Follow steps in [setup-clickstream](setup-clickstream.md) 
   - 5.2 - [Dataframes](spark/1-data-frame.md)
   - 5.3 - [Spark & Hive](spark/2-spark-and-hive.md)

6. Workshops
   - 6.1 : [optimize query](workshops/1-optimize-query.md)
