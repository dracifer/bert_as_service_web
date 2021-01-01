#!/usr/bin/env bash
# https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04
# exit on error
set -o errexit

sudo apt-get install python3-pip python3-dev libpq-dev postgresql postgresql-contrib

echo "Install poetry"
poetry install
echo "Finish poetry install"

poetry run python3 web/manage.py collectstatic --no-input
poetry run python3 web/manage.py migrate

# or run the poetry shell first and run python commands manually
# poetry shell
