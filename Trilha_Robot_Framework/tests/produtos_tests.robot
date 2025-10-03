*** Settings ***
Documentation   Arquivo de Testes para Endpoint /produtos
Resource        ../keywords/produtos_keywords.robot



*** Test Cases ***
Cenario: POST Criar Produto 201
    [tags]      POSTPRODUTO
    Criar Sessao 
    Fazer Login e Armazenar Token
    POST Endpoit /produtos
    Validar Status Code  201

Cenario: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTO
    Criar Sessao 
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code 200
