#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

sleep 10
DBTEST=0
DBTEST=`psql -h db -U postgres -tAc "SELECT 1 FROM pg_database WHERE datname='pta_database'"`
echo $DBTEST

if [ $DBTEST -eq "1" ]
then
    echo "pta_database already exists"
else
    echo "Creating pta_database"
    psql -h db -U postgres -tAc "CREATE USER pta_user WITH password 'pta_password'"
    psql -h db -U postgres -tAc "CREATE DATABASE pta_database WITH owner pta_user"
    psql -h db -U postgres -tAc "GRANT ALL privileges on all tables in schema public to pta_user"
fi

echo "Migrate changes to the database"
python manage.py flush --no-input
python manage.py makemigrations
python manage.py migrate
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin','admin.admin@example.com', 'changeme')"
python manage.py collectstatic --no-input --clear

exec "$@"
