c:
	docker-compose run web c

w:
	docker-compose run web tailwindcss:watch

seed:
	docker-compose run web db:seed

s:
	docker-compose -f docker-compose.dev.yml up

build:
	./bin/entrypoint.dev.sh
