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
	docker network rm fullstack-notes-application-network-backend fullstack-notes-application-network-frontend;
	docker container rm router client api db;
	docker image rm notes-router notes-client notes-api;

##################
## Development ##
#################
dev-start:
	docker-compose up --detach
dev-build:
	docker-compose up --detach --build
dev-stop:
	docker-compose stop
dev-destroy:
	docker-compose down --volume