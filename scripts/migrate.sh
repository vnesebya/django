#!/bin/sh
# Выполняет команды внутри контейнеров
# 2020 (с) Москаленко Алексей

git pull
echo "Применяем manage.py makemigration..."
docker exec app python manage.py makemigrations
echo "Применяем manage.py migrate..."
docker exec app python manage.py migrate

