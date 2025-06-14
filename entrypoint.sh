#!/bin/bash
set -e

# Wait for PostgreSQL to be available
until pg_isready -h db -U postgres; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

# Run migrations and then start server
bundle exec rails db:prepare

exec "$@"