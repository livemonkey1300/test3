#!/bin/bash

pip install --upgrade virtualenv
virtualenv env
source env/bin/activate
pip install djangocms-installer
djangocms main
python main/manage.py makemigrations
python main/manage.py migrate
