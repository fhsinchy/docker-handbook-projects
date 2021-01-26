#!/bin/bash
set -e

if docker container ls | grep -q 'notes-api';
then
  printf "stopping api container --->\n"
  docker container stop notes-api;
  printf "api container stopped --->\n"
else
  printf "api container not found --->\n"
fi

printf "\n"

if docker container ls | grep -q 'notes-db';
then
  printf "stopping db container --->\n"
  docker container stop notes-db;
  printf "db container stopped --->\n"
else
  printf "db container not found --->\n"
fi

printf "\n"

printf "shutdown script finished\n\n"