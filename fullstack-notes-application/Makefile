#################
## Production ##
################
start:
	docker container start db api client router
build:
	./boot.sh
stop:
	docker container stop router client api db
destroy: stop
	docker network rm fullstack-notes-application-network;
	docker container rm router client api db;
	docker image rm notes-router notes-client notes-api notes-db;

##################
## Development ##
#################
dev-start:
	docker-compose up
dev-build:
	docker-compose up --build
dev-stop:
	docker-compose stop
dev-destroy:
	docker-compose down --volume