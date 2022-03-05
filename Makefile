c:
	docker-compose run web c

w:
	docker-compose run web tailwindcss:watch

seed:
	docker-compose run web db:seed
