#!/bin/sh

until cd /app/backend
do
    echo "Waiting for server volume..."
done

cd /app/backend/funnyshopAPI


celery -A funnyshopAPI worker --loglevel=info --concurrency 1 -E
