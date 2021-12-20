#!/bin/bash
# Выполняет команды внутри контейнеров
# 2021 (с) Москаленко Алексей

function loaddata (){
echo "Loaddata: Database $1, App $2"
docker-compose exec django \
    python manage.py loaddata \
    --database $1 \
    --app=$2 \
    --format=json \
    --traceback \
    --force-color \
    all.json
}

loaddata default users
loaddata default location