CONTAINER = $(shell docker container ls | grep "bin/rails server" | cut -c1-12)

c:
	docker-compose run web c

w:
	docker-compose run web tailwindcss:watch

seed:
	docker-compose run web db:seed

s:
	docker-compose -f docker-compose.dev.yml up

logs:
	docker attach $(CONTAINER)

up-build:
	./bin/entrypoint.dev.sh

migrate:
	docker-compose run web db:migrate

rollback:
	docker-compose run web db:rollback

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

base:
	docker container exec -it $(CONTAINER) $(arg)

sitemap:
	docker-compose run web sitemap:refresh

build-mac:
	@echo "Version?"; \
	read VERSION; \
	echo "Running: docker buildx build --platform linux/amd64 -t rayhanw/rails-resolver:v$$VERSION ."; \
	docker buildx build --platform linux/amd64 -t rayhanw/rails-resolver:v$$VERSION .

build:
	@echo "Version?"; \
	read VERSION; \
	echo "Running: docker build -t rayhanw/rails-resolver:v$$VERSION ."; \
	docker build -t rayhanw/rails-resolver:v$$VERSION .

ssh:
	ssh root@159.223.59.62

pin:
	bin/importmap pin $(arg)

unpin:
	bin/importmap unpin $(arg)

tasks:
	docker-compose run web -T

creds:
	docker-compose run --rm -e EDITOR=nano web credentials:edit
