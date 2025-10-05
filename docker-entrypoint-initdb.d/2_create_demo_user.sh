#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER demo WITH PASSWORD '$DEMO_USER_PASS';
	GRANT ALL PRIVILEGES ON DATABASE demo TO demo;
	\c demo
	-- Дать право на использование схемы
	ALTER DATABASE demo OWNER TO demo;
	ALTER SCHEMA bookings OWNER TO demo;
	GRANT pg_write_all_data TO demo;
	GRANT pg_read_all_data TO demo;

EOSQL
