# Lambda Deployment Template

## Build Lambda

```bash
./build.sh [lambda-deployment-zip-file-name] [lambda-function-name]
```

## Deploy

Make S3 bucket to store the lambda function

e.g.

```bash
AWS_PROFILE=[your profile name] aws s3 mb s3://lambda-function-repo
```

Deploying the lambda to S3 then update Lambda to fetch from the S3 repo.

```bash
AWS_PROFILE=[your profile name] aws s3 cp lambda.zip s3://lambda-function-repo/
AWS_PROFILE=[your profile name] aws lambda update-function-code --function-name lambda-1 --s3-bucket lambda-function-repo --s3-key lambda1.zip
```
