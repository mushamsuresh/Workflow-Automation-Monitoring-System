#!/bin/bash

# Set your own values
BUCKET_NAME=workflow-csv-upload-$(uuidgen | cut -d'-' -f1)
TABLE_NAME=WorkflowData

echo "Creating S3 bucket: $BUCKET_NAME"
aws s3 mb s3://$BUCKET_NAME

echo "Creating DynamoDB table: $TABLE_NAME"
aws dynamodb create-table \
    --table-name $TABLE_NAME \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --table-class STANDARD

echo "Bucket and table created successfully."
