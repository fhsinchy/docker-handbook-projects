#################
## Production ##
################
start:
	./boot.sh
build:
	./build.sh
stop:
	./shutdown.sh
destroy: stop
	./destroy.sh

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