#!/bin/bash

printf "creating network --->\n"
docker network create notes-api-network
printf "network created --->\n"

printf "\n"

cd db; \
printf "creating db image --->\n"
docker image build . --tag notes-db; \
printf "db image created --->\n"
printf "starting db container --->\n"
docker container run \
    --detach \
    --name=db \
    --env POSTGRES_DB=notesdb \
    --env POSTGRES_PASSWORD=secret \
    --network=notes-api-network \
    notes-db;
printf "db container started --->\n"

cd ..
printf "\n"

cd api; \
printf "creating api image --->\n"
docker image build . --tag notes-api; \
printf "api image created --->\n"
printf "starting api container --->\n"
docker container run \
    --detach \
    --name=api \
    --env-file .env \
    --publish=3000:3000 \
    --network=notes-api-network \
    notes-api;
printf "api container started --->\n"

cd ..
printf "\n"

printf "all containers are up and running"