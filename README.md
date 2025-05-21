# 🚀 Workflow Automation & Monitoring System

Welcome to the Workflow Automation & Monitoring System! This project lets you seamlessly automate the process of ingesting CSV data uploaded to an AWS S3 bucket straight into a DynamoDB table, powered by AWS Lambda magic. Whether you’re looking to automate data pipelines, streamline analytics, or simply reduce manual data handling—this project has you covered!

---

## 🛠️ Components & Architecture

- **S3 Bucket**: Your landing zone for fresh CSV files
- **DynamoDB Table**: A public, scalable NoSQL database to store and query your ingested data
- **Lambda Function**: Auto-triggered on each new upload, parsing and pushing your data
- **Lambda Layer**: Houses all required Python dependencies (like `boto3`), keeping your Lambda lean

![Architecture Diagram](docs/architecture.png) <!-- (Add an actual diagram to docs/architecture.png for extra flair!) -->

---

## ⚡ How It Works

1. **Drop your CSV**: Upload a `.csv` file to the designated S3 bucket.
2. **Auto-Trigger**: The S3 event fires off the Lambda function.
3. **Ingestion**: Lambda parses the CSV and writes each row into DynamoDB.
4. **Query Away**: Instantly use DynamoDB for analytics, dashboards, or reporting.

---

## 🚀 Quickstart

### 1. Configure AWS CLI

```bash
aws configure
```

### 2. Launch the Infrastructure

```bash
cd infrastructure
./deploy.sh
```

### 3. Deploy Lambda & Layer

```bash
cd lambda
pip install -r requirements.txt -t python
cd ..
zip -r lambda.zip lambda/
aws lambda update-function-code --function-name csvDynamoIngestor --zip-file fileb://lambda.zip

# (Optional) Create and attach Lambda Layer for dependencies
cd layer
./build_layer.sh
```

### 4. Upload Your First CSV

```bash
aws s3 cp sample-data/sample.csv s3://<your-bucket-name>/
```

---

## 📝 Sample CSV

```csv
id,name,email
1,Alice,alice@example.com
2,Bob,bob@example.com
```

---

## 🔍 Querying DynamoDB

Use the AWS Console or any AWS SDK to query by `id` or any other field—your data is ready for action!

---

## 🌟 Why You'll Love This

- **Zero manual data entry**: Let Lambda do the heavy lifting!
- **Instant analytics**: Data is ready for queries as soon as it lands.
- **Plug & Play**: Add new data sources or adjust schemas easily.
- **Cloud Native**: Built entirely with AWS best practices.

---

## 📄 License

MIT

---

## 💡 Get Involved!

Have ideas for new features, want to report a bug, or just want to say hi? Open an issue or pull request! Contributions are always welcome.

---
