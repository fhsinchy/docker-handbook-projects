#!/bin/bash
set -e

NETWORK_NAME_BACKEND="fullstack-notes-application-network-backend"
NETWORK_NAME_FRONTEND="fullstack-notes-application-network-frontend"
DB_CONTAINER_VOLUME_NAME="notes-db-data"
API_IMAGE_NAME="notes-api"
CLIENT_IMAGE_NAME="notes-client"
ROUTER_IMAGE_NAME="notes-router"
API_CONTAINER_NAME="notes-api"
CLIENT_CONTAINER_NAME="notes-client"
ROUTER_CONTAINER_NAME="notes-router"
DB_CONTAINER_NAME="notes-db"

if docker container ls --all | grep -q $ROUTER_CONTAINER_NAME;
then
  printf "removing router container --->\n"
  docker container rm $ROUTER_CONTAINER_NAME;
  printf "router container removed --->\n"
else
  printf "router container not found --->\n"
fi

if docker container ls --all | grep -q $CLIENT_CONTAINER_NAME;
then
  printf "removing client container --->\n"
  docker container rm $CLIENT_CONTAINER_NAME;
  printf "client container removed --->\n"
else
  printf "client container not found --->\n"
fi

printf "\n"

if docker container ls --all | grep -q $API_CONTAINER_NAME;
then
  printf "removing api container --->\n"
  docker container rm $API_CONTAINER_NAME;
  printf "api container removed --->\n"
else
  printf "api container not found --->\n"
fi

printf "\n"

if docker container ls --all | grep -q $DB_CONTAINER_NAME;
then
  printf "removing db container --->\n"
  docker container rm $DB_CONTAINER_NAME;
  printf "db container removed --->\n"
else
  printf "db container not found --->\n"
fi

printf "\n"

if docker volume ls | grep -q $DB_CONTAINER_VOLUME_NAME;
then
  printf "removing db data volume --->\n"
  docker volume rm $DB_CONTAINER_VOLUME_NAME;
  printf "db data volume removed --->\n"
else
  printf "db data volume not found --->\n"
fi

printf "\n"

if docker network ls | grep -q $NETWORK_NAME_BACKEND;
then
  printf "removing backend network --->\n"
  docker network rm $NETWORK_NAME_BACKEND;
  printf "backend network removed --->\n"
else
  printf "backend network not found --->\n"
fi

printf "\n"

if docker network ls | grep -q $NETWORK_NAME_FRONTEND;
then
  printf "removing frontend network --->\n"
  docker network rm $NETWORK_NAME_FRONTEND;
  printf "frontend network removed --->\n"
else
  printf "frontend network not found --->\n"
fi

printf "\n"

printf "destroy script finished\n\n"