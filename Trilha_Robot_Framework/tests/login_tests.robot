*** Settings ***
Documentation   Arquivo de Testes para Endpoint /login
Resource        ../support/base.robot



*** Test Cases ***

Cenario: POST Realizar Login 200
    [tags]       POSTLOGIN
    Criar Sessao
    POST Endpoint /login 
    Validar Status Code  200