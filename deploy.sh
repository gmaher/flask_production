#!/bin/bash

#fail if any command in this script fails
set -eu

ID=$(sudo docker ps -f ancestor=flask_production | sed -n 2p | awk '{print $1}')

if [ "$ID" == "" ]; then
  echo "NO RUNNING CONTAINERS WITH ANCESTOR FLASK_PRODUCTION PROCEEDING TO BUILD"
else
  echo "FOUND RUNNING DOCKER CONTAINER WITH ID $ID"
  sudo docker kill $ID
fi


sudo docker build -t flask_production .
echo "FINISHED BUILDING IMAGE"

sudo docker run -dp 9999:8999 flask_production
echo "FINISHED STARTING CONTAINER"
