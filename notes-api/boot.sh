#!/bin/bash
set -e

printf "starting db container --->\n"
if docker container ls --all | grep -q 'notes-db';
then
  printf "db container found --->\n"
  docker container start notes-db
fi
printf "db container started --->\n"

printf "\n"

printf "starting api container --->\n"
if docker container ls --all | grep -q 'notes-api';
then
  printf "api container found --->\n"
  docker container start notes-db
fi
printf "api container started --->\n"

printf "\n"

printf "all containers are up and running"