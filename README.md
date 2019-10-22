# Desafio Técnico - Ruby, Rails, Docker e Algoritmo de Dijkstra 

O objetivo deste desafio é classificar os candidatos de uma vaga utilizando a melhor localização e o nível de experiência de cada um em relação a vaga.

## O que foi utilizado?

- Ruby on Rails
- PostgreSQL 
- Docker

Para conseguir a menor distância entre as localizações, foi utilizado o algoritmo de Dijkstra e com base nisso foi gerado o score de cada candidatura.

## Iniciando

O projeto está utilizando Docker e para iniciar basta executar o comando:

```
docker-compose up --build
```

A porta 3000 ficará aberta para as requisições. `http://localhost:3000/`

## Migrations

Para criar as tabelas e rodar as migrations execute o comando:

```
docker-compose exec web rails db:create db:migrate
```

## Testes

Para rodar os testes é só executar:

```
docker-compose exec web rails test
```

## Formato de Erros

### 422 - Unprocessable Entity
`POSTs` que estiverem faltando campos obrigatórios irão retornar erro no seguinte formato:
```
{
    "status": "error",
    "errors": {
        "nome_do_campo": [
            "Mensagem de erro"
        ],
        ...
    }
}
```

### 404 - Not Found
`GET` que não existir o resource irá retornar no seguinte formato:

```
{
    "status": "error",
    "errors": {
        "resource": "Não existe."
    }
}
```

## Endpoints

### Vagas

Request

`POST /v1/vagas`

```
{
    "empresa": "Empresa Teste",
    "titulo": "Vaga teste",
    "descricao": "Criar os mais diferentes tipos de teste",
    "localizacao": "E",
    "nivel": 5
}
```

Response - Code: `201`

```
{
    "status": "success",
    "data": {
        "id": 2,
        "empresa": "Empresa Teste",
        "titulo": "Vaga teste",
        "descricao": "Criar os mais diferentes tipos de teste",
        "localizacao": "E",
        "nivel": 5,
        "created_at": "2019-10-21T23:43:37.698Z",
        "updated_at": "2019-10-21T23:43:37.698Z"
    }
}
```

--- 

### Pessoas

Request

`POST /v1/pessoas`

```
{
    "nome": "John Doez",
    "profissao": "Engenheiro de Software",
    "localizacao": "B",
    "nivel": 5
}
```

Response - Code: `201`

```
{
    "status": "success",
    "data": {
        "id": 1,
        "nome": "John Doez",
        "profissao": "Engenheiro de Software",
        "localizacao": "B",
        "nivel": 5,
        "created_at": "2019-10-21T23:49:56.441Z",
        "updated_at": "2019-10-21T23:49:56.441Z"
    }
}
```

--- 

### Registrar Candidatura

Request

`POST /v1/candidaturas`

```
{
    "id_pessoa": 1,
    "id_vaga": 1
}
```

Response - Code: `201`

```
{
    "status": "success",
    "data": {
        "id": 1,
        "vaga": {
            "id": 1
            "empresa": "Empresa Teste",
            "titulo": "Vaga teste",
            "descricao": "Criar os mais diferentes tipos de teste",
            "localizacao": "E",
            "nivel": 5,
            "created_at": "2019-10-21T22:29:04.918Z",
            "updated_at": "2019-10-21T22:29:04.918Z"
        },
        "pessoa": {
            "id": 1
            "nome": "John Doez",
            "profissao": "Engenheiro de Software",
            "localizacao": "B",
            "nivel": 5,
            "score": 75
        },
        "created_at": "2019-10-21T23:02:22.555Z",
        "updated_at": "2019-10-21T23:02:22.623Z"
    }
}
```

--- 

### Retornar Candidatos

Request

`GET /v1/vagas/{id_vaga}/candidaturas/ranking`

Response - Code: `200`

```
{
    "data": [
        {
            "id": 1,
            "nome": "John Doez",
            "profissao": "Engenheiro de Software",
            "localizacao": "B",
            "nivel": 5,
            "score": 75
        },
        {
            "id": 2,
            "nome": "John Doez 2",
            "profissao": "Engenheiro de Software",
            "localizacao": "A",
            "nivel": 2,
            "score": 25
        }
    ]
}
```

--- 