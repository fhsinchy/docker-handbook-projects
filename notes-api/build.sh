#!/bin/bash
set -e

if docker network ls | grep -q 'notes-api-network';
then
  printf "network found --->\n"
else
  printf "creating network --->\n"
  docker network create notes-api-network;
  printf "network created --->\n"
fi

printf "\n"

if docker volume ls | grep -q 'notes-db-data';
then
  printf "volume found --->\n"
else
  printf "creating volume --->\n"
  docker volume create notes-db-data;
  printf "volume created --->\n"
fi

printf "\n"

printf "starting db container --->\n"
if docker container ls --all | grep -q 'notes-db';
then
  printf "db container found --->\n"
  docker container start notes-db
else
  docker container run \
    --detach \
    --name=notes-db \
    --env POSTGRES_DB=notesdb \
    --env POSTGRES_PASSWORD=secret \
    --network=notes-api-network \
    postgres:12;
fi
printf "db container started --->\n"

printf "\n"

cd api;
printf "creating api image --->\n"
docker image build . --tag notes-api;
printf "api image created --->\n"
printf "starting api container --->\n"
if docker container ls --all | grep -q 'notes-api';
then
  printf "api container found --->\n"
  docker container start notes-api
else
docker container run \
    --detach \
    --volume notes-api-db-data:/var/lib/postgresql/data \
    --name=notes-api \
    --env DB_HOST=notes-db \
    --env DB_DATABASE=notesdb \
    --env DB_PASSWORD=secret \
    --publish=3000:3000 \
    --network=notes-api-network \
    notes-api;
docker container exec notes-api npm run db:migrate;
fi
printf "api container started --->\n"

cd ..
printf "\n"

printf "build script finished\n\n"