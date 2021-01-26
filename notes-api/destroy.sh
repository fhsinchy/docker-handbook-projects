#!/bin/bash
set -e

if docker container ls --all | grep -q 'notes-api';
then
  printf "removing api container --->\n"
  docker container rm notes-api
  printf "api container removed --->\n"
fi

printf "\n"

if docker container ls --all | grep -q 'notes-db';
then
  printf "removing db container --->\n"
  docker container rm notes-db
  printf "db container removed --->\n"
fi

if docker volume ls | grep -q 'notes-db-data';
then
  printf "removing db data volume --->\n"
  docker volume rm notes-db-data
  printf "db data volume removed --->\n"
fi

if docker network ls | grep -q 'notes-api-network';
then
  printf "removing network --->\n"
  docker network rm notes-api-network
  printf "network removed --->\n"
fi

if docker image ls | grep -q 'notes-api';
then
  printf "removing api image --->\n"
  docker image rm notes-api
  printf "api image removed --->\n"
fi

printf "all data have been destroyed"