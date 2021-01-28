#!/bin/bash
set -e

NETWORK_NAME="notes-api-network"
DB_CONTAINER_VOLUME_NAME="notes-db-data"
API_IMAGE_NAME="notes-api"
API_CONTAINER_NAME="notes-api"
DB_CONTAINER_NAME="notes-db"

DB_NAME="notesdb"
DB_PASSWORD="secret"

if docker network ls | grep -q $NETWORK_NAME;
then
  printf "network found --->\n"
else
  printf "creating network --->\n"
  docker network create $NETWORK_NAME;
  printf "network created --->\n"
fi

printf "\n"

if docker volume ls | grep -q $DB_CONTAINER_VOLUME_NAME;
then
  printf "volume found --->\n"
else
  printf "creating volume --->\n"
  docker volume create $DB_CONTAINER_VOLUME_NAME;
  printf "volume created --->\n"
fi

printf "\n"

printf "starting db container --->\n"
if docker container ls --all | grep -q $DB_CONTAINER_NAME;
then
  docker container start $DB_CONTAINER_NAME
else
  docker container run \
    --detach \
    --volume $DB_CONTAINER_VOLUME_NAME:/var/lib/postgresql/data \
    --name=$DB_CONTAINER_NAME \
    --env POSTGRES_DB=$DB_NAME \
    --env POSTGRES_PASSWORD=$DB_PASSWORD \
    --network=$NETWORK_NAME \
    postgres:12;
fi
printf "db container started --->\n"

printf "\n"

cd api;
printf "creating api image --->\n"
docker image build . --tag $API_IMAGE_NAME;
printf "api image created --->\n"
printf "starting api container --->\n"
if docker container ls --all | grep -q $API_CONTAINER_NAME;
then
  docker container start $API_CONTAINER_NAME
else
  docker container run \
      --detach \
      --name=$API_CONTAINER_NAME \
      --env DB_HOST=$DB_CONTAINER_NAME \
      --env DB_DATABASE=$DB_NAME \
      --env DB_PASSWORD=$DB_PASSWORD \
      --publish=3000:3000 \
      --network=$NETWORK_NAME \
      $API_IMAGE_NAME;
  docker container exec $API_CONTAINER_NAME npm run db:migrate;
fi
printf "api container started --->\n"

cd ..
printf "\n"

printf "build script finished\n\n"