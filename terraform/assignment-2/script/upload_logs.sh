#!/bin/bash

BUCKET_NAME="${var.stage}-logs-bucket"
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Upload system log
aws s3 cp /var/log/cloud-init.log s3://$BUCKET_NAME/logs/${INSTANCE_ID}/

# Upload app logs
if [ -d /app/logs ]; then
  aws s3 cp /app/logs s3://$BUCKET_NAME/app/logs/${INSTANCE_ID}/ --recursive
fi
