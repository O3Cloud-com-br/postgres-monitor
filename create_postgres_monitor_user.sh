#!/bin/bash

# Variáveis de conexão ao banco de dados
DB_HOST='127.0.0.1'
DB_PORT='8745'
DB_USER='postgres'
#DB_PASSWORD='senha do banco de dados'

# Queries SQL
SQL_CREATE_USER="CREATE USER zbx_monitor WITH PASSWORD 'DB@m0nit0r' INHERIT;"
SQL_GRANT_PERMISSION="GRANT pg_monitor TO zbx_monitor;"

# Executa o comando psql com as queries
PGPASSWORD=$DB_PASSWORD psql \
    -h $DB_HOST \
    -p $DB_PORT \
    -U $DB_USER \
    -c "$SQL_CREATE_USER" \
    -c "$SQL_GRANT_PERMISSION"