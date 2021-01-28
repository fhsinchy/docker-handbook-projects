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

DB_NAME="notesdb"
DB_PASSWORD="secret"

if docker network ls | grep -q $NETWORK_NAME_BACKEND;
then
    printf "backend network found --->\n"
else
    printf "creating backend network --->\n"
    docker network create $NETWORK_NAME_BACKEND;
    printf "backend network created --->\n"
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
    --network=$NETWORK_NAME_BACKEND \
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
      --network=$NETWORK_NAME_BACKEND \
      $API_IMAGE_NAME;
  docker container exec $API_CONTAINER_NAME npm run db:migrate;
fi
printf "api container started --->\n"

cd ..
printf "\n"

if docker network ls | grep -q $NETWORK_NAME_FRONTEND;
then
    printf "frontend network found --->\n"
else
    printf "creating frontend network --->\n"
    docker network create $NETWORK_NAME_FRONTEND;
    printf "frontend network created --->\n"
fi

printf "\n"

cd client;
printf "creating client image --->\n"
docker image build . --tag $CLIENT_IMAGE_NAME;
printf "client image created --->\n"
printf "starting client container --->\n"
if docker container ls --all | grep -q $CLIENT_CONTAINER_NAME;
then
  docker container start $CLIENT_CONTAINER_NAME
else
    docker container run \
        --detach \
        --name=$CLIENT_CONTAINER_NAME \
        --network=$NETWORK_NAME_FRONTEND \
        $CLIENT_IMAGE_NAME;
fi
printf "client container started --->\n"

cd ..
printf "\n"

cd nginx;
printf "creating router image --->\n"
docker image build . --tag $ROUTER_IMAGE_NAME;
printf "router image created --->\n"
if docker container ls --all | grep -q $ROUTER_CONTAINER_NAME;
then
    printf "router container found --->\n"
else
    printf "creating router container --->\n"
    docker container create \
        --publish=8080:80 \
        --name=$ROUTER_CONTAINER_NAME \
        $ROUTER_IMAGE_NAME;
    printf "router container created --->\n"
    printf "adding router to backend network --->\n"
    docker network connect $NETWORK_NAME_BACKEND $ROUTER_CONTAINER_NAME
    printf "router added to backend network --->\n"
    printf "adding router to frontend network --->\n"
    docker network connect $NETWORK_NAME_FRONTEND $ROUTER_CONTAINER_NAME
    printf "router added to frontend network --->\n"
fi
printf "starting router container --->\n"
docker container start $ROUTER_CONTAINER_NAME;
printf "router container started --->\n"

cd ..
printf "\n"

printf "build script finished\n\n"