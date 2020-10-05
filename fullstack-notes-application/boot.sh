#!/bin/bash

printf "creating network --->\n"
docker network create fullstack-note-application-network
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
    --network=fullstack-note-application-network \
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
    --network=fullstack-note-application-network \
    notes-api;
printf "api container started --->\n"

cd ..
printf "\n"

cd client; \
printf "creating client image --->\n"
docker image build . --tag notes-client; \
printf "client image created --->\n"
printf "starting client container --->\n"
docker container run \
    --detach \
    --name=client \
    --network=fullstack-note-application-network \
    notes-client;
printf "client container started --->\n"

cd ..
printf "\n"

cd nginx; \
printf "creating router image --->\n"
docker image build . --tag notes-router; \
printf "router image created --->\n"
printf "starting router container --->\n"
docker container run \
    --detach \
    --name=router \
    --publish=8080:80 \
    --network=fullstack-note-application-network \
    notes-router;
printf "router container started --->\n"

cd ..
printf "\n"

printf "all containers are up and running"