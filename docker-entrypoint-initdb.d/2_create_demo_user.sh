#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER demo WITH PASSWORD '$DEMO_USER_PASS';
	GRANT ALL PRIVILEGES ON DATABASE demo TO demo;
	\c demo
	CREATE SCHEMA bookings;
	-- Дать право на использование схемы
	GRANT USAGE ON SCHEMA bookings TO demo;

	-- Дать все права на все таблицы в схеме
	GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA bookings TO demo;

	-- Дать права на выполнение всех функций
	GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA bookings TO demo;
EOSQL
