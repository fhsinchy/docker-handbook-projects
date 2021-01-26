#!/bin/bash
set -e

if docker container ls | grep -q 'notes-api';
then
  printf "stopping api container --->\n"
  docker container stop notes-api
  printf "api container stopped --->\n"
fi

printf "\n"

if docker container ls | grep -q 'notes-db';
then
  printf "stopping db container --->\n"
  docker container stop notes-db
  printf "db container stopped --->\n"
fi

printf "all containers have been stopped"