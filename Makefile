setup:
	@make build
	@make up 
	@make composer-update
build:
	docker compose build 
stop:
	docker compose stop
up:
	docker compose up -d

composer-update:
	docker exec staging02-app bash -c "composer update"
node:
	docker exec staging02-app bash -c "nvm install v18.17.1"
	
optimize:
	docker exec staging02-app bash -c "php artisan optimize:fresh"
data:
	docker exec staging02-app bash -c "php artisan migrate:fresh --seed"

bash:
	docker exec -it staging02-app bash

fresh:
	docker compose restart
rmi:
	docker image rm -f staging02-staging02-app
