#################
## Production ##
################
start:
	docker container start notes-db notes-api notes-client notes-router
build:
	./boot.sh
stop:
	docker container stop notes-router notes-client notes-api notes-db
destroy: stop
	docker network rm fullstack-notes-application-network-backend fullstack-notes-application-network-frontend;
	docker container rm notes-router notes-client notes-api notes-db;
	docker image rm notes-router notes-client notes-api;

##################
## Development ##
#################
dev-start:
	docker-compose up --detach
dev-build:
	docker-compose up --detach --build; docker-compose exec api npm run db:migrate
dev-shell:
	docker-compose exec api bash
dev-stop:
	docker-compose stop
dev-destroy:
	docker-compose down --volume