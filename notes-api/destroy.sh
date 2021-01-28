#!/bin/bash
set -e

NETWORK_NAME="notes-api-network"
DB_CONTAINER_VOLUME_NAME="notes-db-data"
API_CONTAINER_NAME="notes-api"
DB_CONTAINER_NAME="notes-db"

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

if docker network ls | grep -q $NETWORK_NAME;
then
  printf "removing network --->\n"
  docker network rm $NETWORK_NAME;
  printf "network removed --->\n"
else
  printf "network not found --->\n"
fi

printf "\n"

printf "destroy script finished\n\n"