# Solr Query

In this lab we will practice doing a simple query


Lab Goals:

* Do some simple queries

### STEP 1) Open Solr 

Open this URL in your browser: 

```bash
http://your-server-url:8983/solr
```

You will be redirected to the Solr admin console


### STEP 2) Index some data

```bash
    bin/post -c techproducts example/exampledocs/*
```

You should see the following output:
```console
java -classpath /home/ubuntu/solr/dist/solr-core-7.6.0.jar -Dauto=yes -Dc=techproducts -Ddata=files org.apache.solr.util.SimplePostTool example/exampledocs/books.csv example/exampledocs/books.json example/exampledocs/gb18030-example.xml example/exampledocs/hd.xml example/exampledocs/ipod_other.xml example/exampledocs/ipod_video.xml example/exampledocs/manufacturers.xml example/exampledocs/mem.xml example/exampledocs/money.xml example/exampledocs/monitor2.xml example/exampledocs/monitor.xml example/exampledocs/more_books.jsonl example/exampledocs/mp500.xml example/exampledocs/post.jar example/exampledocs/sample.html example/exampledocs/sd500.xml example/exampledocs/solr-word.pdf example/exampledocs/solr.xml example/exampledocs/test_utf8.sh example/exampledocs/utf8-example.xml example/exampledocs/vidcard.xml
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/techproducts/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
POSTing file books.csv (text/csv) to [base]
POSTing file books.json (application/json) to [base]/json/docs
POSTing file gb18030-example.xml (application/xml) to [base]
POSTing file hd.xml (application/xml) to [base]
POSTing file ipod_other.xml (application/xml) to [base]
POSTing file ipod_video.xml (application/xml) to [base]
POSTing file manufacturers.xml (application/xml) to [base]
POSTing file mem.xml (application/xml) to [base]
POSTing file money.xml (application/xml) to [base]
POSTing file monitor2.xml (application/xml) to [base]
POSTing file monitor.xml (application/xml) to [base]
POSTing file more_books.jsonl (application/json) to [base]/json/docs
POSTing file mp500.xml (application/xml) to [base]
POSTing file post.jar (application/octet-stream) to [base]/extract
POSTing file sample.html (text/html) to [base]/extract
POSTing file sd500.xml (application/xml) to [base]
POSTing file solr-word.pdf (application/pdf) to [base]/extract
POSTing file solr.xml (application/xml) to [base]
POSTing file test_utf8.sh (application/octet-stream) to [base]/extract
POSTing file utf8-example.xml (application/xml) to [base]
POSTing file vidcard.xml (application/xml) to [base]
21 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/techproducts/update...
Time spent: 0:00:04.355
```

### Step 3) Perform a query:

Navigate in your browser to the following url: 

```text
http://YOURPIPADDRESS:8983/solr/#/techproducts/query
```

If we scroll down and press on *Execute Query*, we will get the following JSON response:

```json
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":34,
    "params":{
      "q":"*:*",
      "_":"1548912117530"}},
  "response":{"numFound":52,"start":0,"maxScore":1.0,"docs":[
      {
        "id":"0812521390",
        "cat":["book"],
        "name":"The Black Company",
        "price":6.99,
        "price_c":"6.99,USD",
        "inStock":false,
        "author":"Glen Cook",
        "author_s":"Glen Cook",
        "series_t":"The Chronicles of The Black Company",
        "sequence_i":1,
        "genre_s":"fantasy",
        "_version_":1624151760927981568,
        "price_c____l_ns":699}]
}}
```

The results will be much longer, but this is snipped for brevity.

### Step 4: Do a query at the command line with curl command

Try the following at your command line:

**=> Type the following:**

```bash
curl "http://localhost:8983/solr/techproducts/select?indent=on&q=*:*"
```

You should get the same JSON output.


### Step 5: Do a single search term

To search for a term, enter it as the q parameter value in the Solr Admin UI Query screen, replacing `*:*` with the term you want to find.

Enter "foundation" and hit Execute Query again.

If you prefer curl, enter something like this:

```bash
curl "http://localhost:8983/solr/techproducts/select?q=foundation"
```

You’ll see something like this:

```json
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":8,
    "params":{
      "q":"foundation"}},
  "response":{"numFound":4,"start":0,"maxScore":2.7879646,"docs":[
      {
        "id":"0553293354",
        "cat":["book"],
        "name":"Foundation",
        "price":7.99,
        "price_c":"7.99,USD",
        "inStock":true,
        "author":"Isaac Asimov",
        "author_s":"Isaac Asimov",
        "series_t":"Foundation Novels",
        "sequence_i":1,
        "genre_s":"scifi",
        "_version_":1574100232473411586,
        "price_c____l_ns":799}]
}}
```

The response indicates that there are 4 hits ("numFound":4). We’ve only included one document the above sample output, but since 4 hits is lower than the rows parameter default of 10 to be returned, you should see all 4 of them.



### Step 6: Search for only the id term

Put "id" (without quotes) in the "fl" box and hit Execute Query again. Or, to specify it with curl:


```bash
curl "http://localhost:8983/solr/techproducts/select?q=foundation&fl=id"
```

You should get the following results.

```json
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":8,
    "params":{
      "q":"foundation",
      "fl":"id"}},
  "response":{"numFound":4,"start":0,"maxScore":2.7384994,"docs":[
      {
        "id":"0553293354"},
      {
        "id":"UTF8TEST"},
      {
        "id":"SOLR1000"},
      {
        "id":"/home/ubuntu/solr/example/exampledocs/test_utf8.sh"}]
  }}
```

### Step 7: Perform a Field Search

Let us try to search one specific field only: the *category*: `cat`.

Go to the search bar and type `cat:electronics`. Run your query again.

To do this in the command line with curl, you can do the following:

```bash
curl "http://localhost:8983/solr/techproducts/select?q=cat:electronics"
```

The response:

```json
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":29,
    "params":{
      "q":"cat:electronics"}},
  "response":{"numFound":12,"start":0,"maxScore":0.9614112,"docs":[
      {
        "id":"SP2514N",
        "name":"Samsung SpinPoint P120 SP2514N - hard drive - 250 GB - ATA-133",
        "manu":"Samsung Electronics Co. Ltd.",
        "manu_id_s":"samsung",
        "cat":["electronics",
          "hard drive"],
        "features":["7200RPM, 8MB cache, IDE Ultra ATA-133",
          "NoiseGuard, SilentSeek technology, Fluid Dynamic Bearing (FDB) motor"],
        "price":92.0,
        "price_c":"92.0,USD",
        "popularity":6,
        "inStock":true,
        "manufacturedate_dt":"2006-02-13T15:26:37Z",
        "store":"35.0752,-97.032",
        "_version_":1624151762036326400,
        "price_c____l_ns":9200}
      }
}
```

The result is snipped for brevity. You should get 12 responses.

### Step 8: Do a phrase search

If we want to search for a phrase (as opposed to just multiple individual words) we put it in double quotes.

Try searching for `"CAS Latency"` by putting that in the search box.

To do this with `curl`, the space has to be converted into a `+` sign in the url, like this:

```bash
curl "http://localhost:8983/solr/techproducts/select?q=\"CAS+latency\""
```

### Step 9: Combine Multiple Searches

When you search for multiple terms, Solr will return results with any of the terms, though those with more than one will be scored higher.

You can combine the results of multiple searches by prefixing each term with a `+` sign.  To exclude the result of a term, you can prefix it with
a `-` sign.

Find the results of `"+electronics +music"`.  You will now get those that must contain **both** terms. You should get one result. 

With `curl`, we have to encode the `+` sign as a `%2B` since the `+` sign will be interpreted as a space.

```bash
curl "http://localhost:8983/solr/techproducts/select?q=%2Belectronics+%2Bmusic"
```

To get results that contain `electronics` but **NOT** `music`, then you would enter the term like this: `"+electronics -music"` or with curl as follows:

```bash
curl "http://localhost:8983/solr/techproducts/select?q=%2Belectronics+-music"
```

Either way, you should get only a single result.


