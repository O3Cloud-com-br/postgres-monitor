**Utilidade:**
Cria o usuário no postgress que permite o monitoramento.

**Execução:**
`PGPASSWORD='senha do banco ./setup_postgres_monitor_user.sh'`

`curl https://raw.githubusercontent.com/O3Cloud-com-br/postgres-monitor/refs/heads/main/create_postgres_monitor_user.sh`


**Observação**
A exposição de senha de um usuário com permissão de pg_monitor não representa risco à segurança.

Esse tipo de permissão possui o papel de veritcar o status do banco de dados, visualizar métricas de desempenho e acessar logs básicos.

Ele não tem privilégios de leitura ou escrita em tabelas de dados.
