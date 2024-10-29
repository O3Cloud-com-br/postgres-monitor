#!/bin/bash

# Variáveis de conexão ao banco de dados
DB_HOST='127.0.0.1'
DB_PORT='8745'
DB_USER='postgres'
#DB_PASSWORD='coloque sua senha do banco de dados'

# Verifica se a variável DB_PASSWORD foi definida
if [ -z "$DB_PASSWORD" ]; then
  echo "Erro: A variável DB_PASSWORD não foi definida."
  exit 1
fi

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
