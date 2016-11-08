#!/bin/bash

# hortonworks
rsync -avz -e "ssh -i /Users/sujee/keys/es/hi1.pem"   .  ec2-user@54.162.53.94:a/hadoop-labs/

# cloudera 
rsync -avz -e "ssh -i /Users/sujee/keys/es/hi1.pem"   .  ec2-user@54.161.5.133:a/hadoop-labs/

