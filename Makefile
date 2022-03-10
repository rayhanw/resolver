CONTAINER = $(shell docker container ls | grep "bin/rails server" | cut -c1-12)

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

migrate:
	docker-compose run web db:migrate

test:
	docker container exec -t $(CONTAINER) rspec -fd

routes:
	docker-compose run web routes

restart:
	docker-compose restart web

g:
	docker-compose run web g $(arg)

d:
	docker-compose run web d $(arg)

build-mac:
	@echo "Version?"; \
	read VERSION; \
	echo "Running: docker buildx build --platform linux/amd64 -t rayhanw/rails-resolver:v$$VERSION ."; \
	docker buildx build --platform linux/amd64 -t rayhanw/rails-resolver:v$$VERSION .
