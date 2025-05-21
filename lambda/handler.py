import boto3
import csv
import os
from urllib.parse import unquote_plus

dynamodb = boto3.resource('dynamodb')
s3 = boto3.client('s3')

TABLE_NAME = os.environ['DYNAMODB_TABLE']

def lambda_handler(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = unquote_plus(event['Records'][0]['s3']['object']['key'])

    table = dynamodb.Table(TABLE_NAME)

    response = s3.get_object(Bucket=bucket, Key=key)
    lines = response['Body'].read().decode('utf-8').splitlines()

    reader = csv.DictReader(lines)
    with table.batch_writer() as batch:
        for row in reader:
            batch.put_item(Item=row)

    return {
        'statusCode': 200,
        'body': f'Successfully inserted data from {key} into {TABLE_NAME}'
    }
