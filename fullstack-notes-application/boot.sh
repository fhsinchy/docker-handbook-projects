#!/bin/bash
set -e

API_CONTAINER_NAME="notes-api"
CLIENT_CONTAINER_NAME="notes-client"
ROUTER_CONTAINER_NAME="notes-router"
DB_CONTAINER_NAME="notes-db"

if docker container ls --all | grep -q $DB_CONTAINER_NAME;
then
  printf "starting db container --->\n"
  docker container start $DB_CONTAINER_NAME;
  printf "db container started --->\n"
else
  printf "db container not found --->\n"
fi

printf "\n"

if docker container ls --all | grep -q $API_CONTAINER_NAME;
then
  printf "starting api container --->\n"
  docker container start $API_CONTAINER_NAME;
  printf "api container started --->\n"
else
  printf "api container not found --->\n"
fi

printf "\n"

if docker container ls --all | grep -q $CLIENT_CONTAINER_NAME;
then
  printf "starting client container --->\n"
  docker container start $CLIENT_CONTAINER_NAME;
  printf "client container started --->\n"
else
  printf "client container not found --->\n"
fi

printf "\n"

if docker container ls --all | grep -q $ROUTER_CONTAINER_NAME;
then
  printf "starting router container --->\n"
  docker container start $ROUTER_CONTAINER_NAME;
  printf "router container started --->\n"
else
  printf "router container not found --->\n"
fi

printf "\n"

printf "boot script finished\n\n"