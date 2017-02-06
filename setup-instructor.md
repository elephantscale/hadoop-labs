<link rel='stylesheet' href='assets/css/main.css'/>

# Instructor Setup

### To be completed by Instructor

## 1 - Copy labs to cluster
```bash
    
    # target dir is :  ~/a

    rsync -avz -e ssh ~/ElephantScale/hadoop-labs   ec2-user@host-name:a
    #or
    scp -r ~/ElephantScale/hadoop-labs   ec2-user@host-name:a

```

## 2 - Execute the setup script

``` bash
    # change MYNAME
    $  cd  ~/a/hadoop-labs/scripts

    $  ./setup-data.sh

    $  ./setup-clickstream.sh
```

## 3 - Verify data in HDFS UI
