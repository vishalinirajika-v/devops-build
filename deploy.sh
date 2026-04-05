#!/bin/bash

IMAGE=$1

echo "Pulling latest image..."
docker pull $IMAGE

echo "Removing old container if exists..."
docker rm -f react-app || true

echo "Starting new container..."

export IMAGE_NAME=$IMAGE

docker-compose down || true
docker-compose up -d
