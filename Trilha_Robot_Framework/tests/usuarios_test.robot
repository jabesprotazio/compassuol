*** Settings ***
Documentation   Arquivo de Testes para Endpoint /Usuarios




*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    Criar Sessao 
    GET Endpoint/usuarios
    # Validar Status Code  200
    Validar Quantidade  ${160}
    # Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]    POST
    Criar Sessao
    Post Endpoint /usuarios
    # Validar Status Code 201
    Validar Se Mensagem Contem  Cadastro realizado com sucesso


Cenario: PUT Editar Usuario 200
    [tags]    PUT
    Criar Sessao
    PUT Endpoint /usuarios
    # Validar Status Code 201

Cenario: DELETE Usuario 200
    [tags]    DELETE 
    Criar Sessao
    DELETE Endpoint /usuarios
    # Validar Status Code 200

Cenario: POST Criar Usuario De Massa Estatica 201
    [tags]      POSTMASSAESTATICA
    Criar Sessao 
    Cadastrar Usuario Estatico Valido
    Validar Status Code  201
    
Cenario: POST Criar Usuario De Massa Dinamica 201
    [tags]       
    Criar Sessao 
    Cadastrar Usuario Dinamico Valido 
    Validar Status Code  201


