#!/bin/sh
set -e
# ^ 'set -e' means: stop the script if any command fails (prevents silent errors)

echo "Starting Django entrypoint script..."

# 1. Wait for database (only if DATABASE_URL is set)
if [ -n "$DATABASE_URL" ]; then
  echo "Waiting for database..."
  sleep 3
  # You could replace sleep with a proper "wait-for-it" script
fi

# 2. Apply database migrations
echo "Running migrations..."
uv run python manage.py migrate --noinput

# 3. Collect static files (CSS, JS, images)
echo "Collecting static files..."
uv run python manage.py collectstatic --noinput


# 5. Start Gunicorn (production server)
echo "Starting Gunicorn..."
exec "$@"
# ^ 'exec "$@"' runs whatever CMD was passed in Dockerfile