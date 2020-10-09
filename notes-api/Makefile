#################
## Production ##
################
start:
	docker container start db api
build:
	./boot.sh
stop:
	docker container stop api db
destroy: stop
	docker network rm notes-api-network
	docker container rm api db
	docker image rm notes-api

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