#!/bin/bash
# Запускает создание суперпользователя внутри контейнера
# 2020 (c) Москаленко Алексей


docker exec -it app python manage.py createsuperuser

