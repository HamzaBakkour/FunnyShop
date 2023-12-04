#!/bin/sh

echo "Started wsgi-entrypoint.sh"

until cd /app/backend/funnyshopAPI
do
    echo "Waiting for server volume..."
done

echo "wsgi-entrypoint.sh, starting migrating"


until python manage.py makemigrations
do
    echo "Waiting for db to be ready... [makemigrations]"
    sleep 2
done




until python manage.py migrate
do
    echo "Waiting for db to be ready... [migrate]"
    sleep 2
done



python manage.py collectstatic --noinput


gunicorn funnyshopAPI.wsgi --bind 0.0.0.0:8000 --workers 4 --threads 4

#####################################################################################
# Options to DEBUG Django server
# Optional commands to replace abouve gunicorn command

# Option 1:
# run gunicorn with debug log level
# gunicorn server.wsgi --bind 0.0.0.0:8000 --workers 1 --threads 1 --log-level debug

# Option 2:
# run development server
# DEBUG=True ./manage.py runserver 0.0.0.0:8000
