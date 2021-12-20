#!/bin/bash
# Выполняет команды внутри контейнеров
# 2021 (с) Москаленко Алексей

function dumpdata (){
echo "Dumpdata: Database $1, App $2"
docker-compose exec django sh -c "if [ ! -d $2/fixtures ]; then mkdir -p $2/fixtures; fi"
docker-compose exec django \
    python manage.py dumpdata \
    --database=$1 \
    --format=json \
    --indent=2 \
    --natural-foreign \
    --natural-primary \
    --output=$2/fixtures/all.json \
    --traceback \
    --force-color \
    $2
}

dumpdata default users
dumpdata default location


