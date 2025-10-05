#!/usr/bin/env bash
set -e

gunzip -c /demo-data/demo-20250901-3m.sql.gz | psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"