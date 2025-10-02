#Sessão para configuração, documentação, imports de arquivos 
*** Settings ***
Documentation   Arquivos simples para requisições HTTP em API ServeRest 
Library         RequestsLibrary
Resource        ./usuarios_keywords.robot
Resource        ./login_keywords.robot
Resource        ./produtos_keywords.robot
Resource        ./common.robot

#Sessão para criação dos casos de testes
*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    Criar Sessao 
    GET Endpoint/usuarios
    # Validar Status Code  200
    Validar Quantidade  ${219}
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

Cenario: POST Realizar Login 200
    [tags]       POSTLOGIN
    Criar Sessao
    POST Endpoint /login 
    Validar Status Code  200

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

Cenario: POST Criar Usuario De Massa Estatica 201
    [tags]      POSTMASSAESTATICA
    Criar Sessao 
    Criar usuario Estatico Valido
    Validar Status Code  201
    

#Sessão para criação de Keywords Personalizada s
*** Keywords ***
Criar Sessao
    Create Session    ServeRest    https://serverest.dev
