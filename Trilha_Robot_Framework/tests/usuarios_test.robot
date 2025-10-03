*** Settings ***
Documentation   Arquivo de Testes para Endpoint /Usuarios

Resource        ../keywords/usuarios_keywords.robot

    
Suite Setup     Criar Sessao


*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    GET Endpoint /usuarios
    Validar Status Code  200
       

Cenario: POST Cadastrar Usuario 201
    [tags]    POST
    Criar Dados Usuario Valido
    Post Endpoint /usuarios
    Validar Status Code  201
    Validar Se Mensagem Contem  Cadastro realizado com sucesso


Cenario: PUT Editar Usuario 200
    [tags]    PUT
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code  200

Cenario: DELETE Deletar Usuario 200
    [tags]    DELETE 
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code  200

Cenario: POST Criar Usuario De Massa Estatica 201
    [tags]      POSTMASSAESTATICA
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code  201
