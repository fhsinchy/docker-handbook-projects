#################
## Production ##
################
start:
	./boot.sh
stop:
	docker container stop router client api db
destroy: stop
	docker network rm fullstack-note-application-network
	docker container rm router client api db; \
	docker image rm notes-router notes-client notes-api notes-db;

##################
## Development ##
#################
dev:
	docker-compose up
dev-build:
	docker-compose up --build
dev-stop:
	docker-compose stop
dev-destroy:
	docker-compose down --volume