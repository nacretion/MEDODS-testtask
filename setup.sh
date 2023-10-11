#!/bin/bash

docker-compose up -d

docker-compose exec web bash -c 'until nc -z db 5432; do sleep 1; done'

docker-compose exec web bash -c 'rails db:create db:migrate'

docker-compose exec web bash -c 'rails test'

echo "Все готово!"
