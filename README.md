## Utilidade
Cria o usuário no PostgreSQL que permite o monitoramento pelo Zabbix.

## Instalação:
Para fazer a instalação é necessário executar um comando no servidor que roda o PostgreSQL e no Zabbix-Server

### Servidor PostgreSQL
Criar usuário permissão no banco de dados:
```
DB_PASSWORD='sua_senha_aqui' bash -c "$(curl -s https://raw.githubusercontent.com/O3Cloud-com-br/postgres-monitor/refs/heads/main/create_postgres_monitor_user.sh)"
```

### Zabbix-Server

### Ativar template
- Vá na configuração do Host e adicione o template.
- Configuration > Hosts, clique no host em questão
- No campo Templates, pesquise por "PostgreSQL by Zabbix agent 2" e clique em "Update"

### Configurar macros

- Vá na configuração do Host e adicione o template.
- Configuration > Hosts, clique no host em questão
- acesse Aba Macros
- crie as seguintes macros:

| Macro            | Value                  |
| ---------------- | ---------------------- |
| `{$PG.DATABASE}` | `vr`                   |
| `{$PG.PASSWORD}` | `DB@m0nit0r`           |
| `{$PG.URI}`      | `tcp://localhost:8745` |
| `{$PG.USER}`     | `zbx_monitor`          |


### Acelerar início da coleta(opcional)
- Acesse o Firewall do cliente e reiniciar o serviço do Zabbix-Proxy

## Observação
A exposição de senha de um usuário com permissão de pg_monitor não representa risco à segurança.

Esse tipo de permissão possui o papel de veritcar o status do banco de dados, visualizar métricas de desempenho e acessar logs básicos.

Ele não tem privilégios de leitura ou escrita em tabelas de dados.
