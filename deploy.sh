#!/bin/bash

IMAGE=$1

export IMAGE_NAME=$IMAGE

docker pull $IMAGE
docker-compose down || true
docker-compose up -d
