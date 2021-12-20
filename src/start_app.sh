#!/bin/bash

echo "Start gunicorn"
gunicorn -b 0.0.0.0:8080 app.wsgi:application

