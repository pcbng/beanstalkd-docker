#!/bin/bash

# WARNING: ECR repo should exist before starting the script

USAGE="Usage: ./push-image-to-ecr.sh <image-name> <image-tag>"

if [ $# -ne 2 ]; then
    echo $USAGE
    exit 1;
fi

export ECR_REGION="us-east-1"
export IMAGE_NAME=$1
export IMAGE_TAG=$2

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)

ECR_URL="$AWS_ACCOUNT_ID.dkr.ecr.$ECR_REGION.amazonaws.com"

$(aws ecr get-login --no-include-email --region $ECR_REGION)

docker pull registry.hub.docker.com/library/$IMAGE_NAME:$IMAGE_TAG
docker tag registry.hub.docker.com/library/$IMAGE_NAME:$IMAGE_TAG $ECR_URL/$IMAGE_NAME:$IMAGE_TAG
docker push $ECR_URL/$IMAGE_NAME:$IMAGE_TAG