#!/bin/bash
set -e

API_CONTAINER_NAME="notes-api"
DB_CONTAINER_NAME="notes-db"

if docker container ls | grep -q $API_CONTAINER_NAME;
then
  printf "stopping api container --->\n"
  docker container stop $API_CONTAINER_NAME;
  printf "api container stopped --->\n"
else
  printf "api container not found --->\n"
fi

printf "\n"

if docker container ls | grep -q $DB_CONTAINER_NAME;
then
  printf "stopping db container --->\n"
  docker container stop $DB_CONTAINER_NAME;
  printf "db container stopped --->\n"
else
  printf "db container not found --->\n"
fi

printf "\n"

printf "shutdown script finished\n\n"