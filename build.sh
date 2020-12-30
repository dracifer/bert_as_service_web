#!/usr/bin/env bash
# exit on error
set -o errexit

poetry install

if [ ! -d backend/model/uncased_L-12_H-768_A-12 ];then
    mkdir -p backend/model
    wget https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip
    unzip uncased_L-12_H-768_A-12.zip -d backend/model/
fi

#poetry shell
#bert-serving-start -model_dir backend/model/uncased_L-12_H-768_A-12 -num_worker=1
python3 manage.py collectstatic --no-input
python3 manage.py migrate
