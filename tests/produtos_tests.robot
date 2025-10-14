*** Settings ***
Documentation   Arquivo de Testes para Endpoint /produtos

Resource        ../keywords/produtos_keywords.robot
Resource        ../keywords/login_keywords.robot
Resource        ../support/fixtures/dynamics.robot


Suite Setup     Criar Sessao


*** Test Cases ***
Cenario: POST Cadastrar Produto 201
    [tags]      POSTPRODUTO
    Criar Produtos Validos 
    POST Endpoit /produtos
    Validar Status Code  201

Cenario: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTO
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code 200

Cenario: GET Procurar Produto ID 200
    [tags]      GETPRODUTOID
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    GET Endpoint Produto ID ${id_produto}
    Validar Status Code 200


Cenario: GET Todos Os Produtos 200
    [tags]    GET 
    Fazer Login e Armazenar Token
    Listar Todos Os Produtos
    Validar Status Code 200
    