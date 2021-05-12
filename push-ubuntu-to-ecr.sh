#!/bin/bash

export ECR_REGION="us-east-1"
export IMAGE_NAME="ubuntu"
export IMAGE_TAG="15.04"

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)

ECR_URL="$AWS_ACCOUNT_ID.dkr.ecr.$ECR_REGION.amazonaws.com"

$(aws ecr get-login --no-include-email --region $ECR_REGION)

docker pull registry.hub.docker.com/library/$IMAGE_NAME:$IMAGE_TAG
docker tag registry.hub.docker.com/library/$IMAGE_NAME:$IMAGE_TAG $ECR_URL/$IMAGE_NAME:$IMAGE_TAG
docker push $ECR_URL/$IMAGE_NAME:$IMAGE_TAG