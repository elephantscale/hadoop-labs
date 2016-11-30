<link rel='stylesheet' href='assets/css/main.css'/>

# Instructor Setup

### To be completed by Instructor

## 1 - Copy labs to cluster
```bash

    rsync -avz -e ssh ~/ElephantScale/hadoop-labs   user@host-name:a
    #or
    scp -r ~/ElephantScale/hadoop-labs   user@host-name:a

```

## 2 - Execute the setup script

``` bash
    # change MYNAME
    $  cd  ~/MY_NAME/hadoop-labs/scripts

    $  ./setup-data.sh
```

## 3 - Verify data in HDFS UI
