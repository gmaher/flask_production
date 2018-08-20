#!/bin/bash

#fail if any command in this script fails
set -eu

ID=$(docker ps -f ancestor=flask_production | sed -n 2p | awk '{print $1}')

if [ "$ID" == "" ]; then
  echo "NO RUNNING CONTAINERS WITH ANCESTOR FLASK_PRODUCTION PROCEEDING TO BUILD"
else
  echo "FOUND RUNNING DOCKER CONTAINER WITH ID $ID"
  docker kill $ID
fi


docker build -t flask_production .
echo "FINISHED BUILDING IMAGE"

docker run -dp 9999:8999 flask_production
echo "FINISHED STARTING CONTAINER"
