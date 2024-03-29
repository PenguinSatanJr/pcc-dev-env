#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER penguin WITH PASSWORD 'penguin';
    CREATE DATABASE recipes;
    GRANT ALL PRIVILEGES ON DATABASE recipes TO penguin;
    CREATE USER "penguin-test" WITH PASSWORD 'penguin-test';
    CREATE DATABASE "recipes-test";
    GRANT ALL PRIVILEGES ON DATABASE "recipes-test" TO "penguin-test";
EOSQL
