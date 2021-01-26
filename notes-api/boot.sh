#!/bin/bash
set -e

printf "starting db container --->\n"
if docker container ls --all | grep -q 'notes-db';
then
  printf "db container found --->\n"
  docker container start notes-db;
else
  printf "db container not found --->\n"
fi

printf "\n"

printf "starting api container --->\n"
if docker container ls --all | grep -q 'notes-api';
then
  printf "api container found --->\n"
  docker container start notes-db;
else
  printf "api container not found --->\n"
fi

printf "\n"

printf "boot script finished\n\n"