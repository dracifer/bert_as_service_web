#!/usr/bin/env bash
# exit on error
set -o errexit

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
