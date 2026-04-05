#!/bin/bash

IMAGE=$1

echo "Pulling latest image..."
docker pull $IMAGE

echo "Removing old container if exists..."
docker rm -f react-app || true

echo "Starting new container..."
docker-compose up -d
