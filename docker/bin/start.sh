#!/bin/bash
cd /app
./manage.py collectstatic --noinput
./manage.py migrate --no-input
uwsgi --ini uwsgi.ini
