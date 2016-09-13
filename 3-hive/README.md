<link rel='stylesheet' href='../assets/css/main.css'/>
[Main Index](../../README.md)

-----

# Hive Quick Intro

## Hive Clients
### 1 - Classic client 'Hive'
Oldest, works reasonably well.
```bash
    $   hive

    hive> 
        show tables;

```


### 2 - Beeline
New client for Hive2 Server.

```bash
    $  beeline

    -- connecting
    beeline> !connect jdbc:hive2://

    beeline> !connect jdbc:hive2://server_ip:10000


    ...

    beeline>  show tables;

    # try help
    beeline> help


```

### Executing beeline in script mode

```
    $   beeline -u jdbc:hive2://   -n username  -p  password   -f  file.q
```

`beeline --help`  for more options.

## Hints
* To see column names set the following property in hive shell
```sql
        set hive.cli.print.header=true;
```

* To see current DB 
```sql
         set hive.cli.print.current.db=true;
```
Hive prompt will indicate the current db.