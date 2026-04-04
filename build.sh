#!/bin/bash

BRANCH=$1
USER=$2
BUILD=$3

if [ "$BRANCH" == "dev" ]; then
  REPO="dev"
else
  REPO="prod"
fi

IMAGE=$USER/$REPO:$BUILD
LATEST=$USER/$REPO:latest

docker build -t $IMAGE -t $LATEST .

echo $IMAGE > image_name.txt
echo $LATEST > image_latest.txt
