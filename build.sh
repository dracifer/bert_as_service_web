#!/usr/bin/env bash
# https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04
# exit on error
set -o errexit

sudo apt-get install python3-pip python3-dev libpq-dev postgresql postgresql-contrib

echo "Install poetry"
poetry install
echo "Finish poetry install"

# if [ ! -d backend/model/uncased_L-12_H-768_A-12 ];then
#     echo "downloading model"
#     mkdir -p backend/model
#     wget https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip
#     unzip uncased_L-12_H-768_A-12.zip -d backend/model/
#     rm uncased_L-12_H-768_A-12.zip
#     echo "done downloading model"
# fi

python3 web/manage.py collectstatic --no-input
python3 web/manage.py migrate
