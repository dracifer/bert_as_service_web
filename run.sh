#!/usr/bin/env bash
# https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04

#python3 web/manage.py runserver 0.0.0.0:8000
poetry run gunicorn --pythonpath web --bind 0.0.0.0:8000 bert_sim_main.wsgi
