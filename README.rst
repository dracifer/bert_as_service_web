Set server host IP to ALLOWED_HOSTS in settings.py

Config Database as usually recommended by the cloud platform

Install/Update necessary software

Install poetry as most dependenceis are handled by it. or use virtualenv or conda

## for Ubuntu18.04
sudo apt-get update
sudo apt install software-properties-common
sudo apt-get install python3-pip
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
source $HOME/.poetry/env
