#!/bin/bash

source ./runner
pip install --upgrade virtualenv
virtualenv env
source env/bin/activate
pip install djangocms-installer
djangocms main
python main/manage.py makemigrations
python main/manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(email='"$EMAIL"', is_superuser=True).delete(); User.objects.create_superuser('"$ADMIN"', '"$EMAIL"', '"$ADMIN_PASS"')" | /bin/bash -c "python main/manage.py shell" 
sed -i -e 's/ALLOWED_HOSTS\ \=\ \[\]/ALLOWED_HOSTS\ \=\ \["*"\]/g' main/main/settings.py

