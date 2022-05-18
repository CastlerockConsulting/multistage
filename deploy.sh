#! /bin/bash
# Cloudformation deploy script
#Sync the s3 bucket

export AWS_DEFAULT_REGION=us-east-1
export AWS_ENV="$1"
export AWS_STACK_NAME="$2"
export BUCKET="cf-castlerock"
echo Deploying AWS "$AWS_ENV" and AWS StackName: "$AWS_STACK_NAME"
echo Sync S3 bucket
aws s3 sync . "s3://${BUCKET}" --exclude ".git/*"
echo Done
echo Initialize deployment
aws cloudformation deploy --stack-name "${AWS_ENV}-${AWS_STACK_NAME}" --s3-bucket "$BUCKET" --template-file "environments/${AWS_ENV}/${AWS_STACK_NAME}.yaml" --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM