#Sessão para configuração, documentação, imports de arquivos 
*** Settings ***
Documentation   Arquivos simples para requisições HTTP em API ServeRest 
Library         RequestsLibrary


#Sessão para variáveis para utilização
*** Variables ***



#Sessão para criação dos casos de testes
*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    Criar Sessao 
    GET Endpoint/usuarios
    # Validar Status Code  200
    Validar Quantidade  ${6}
    Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]    POST
    Criar Sessao
    Post Endpoint /usuarios
    Validar Status Code  201
    Validar Se Mensagem Contem  Cadastro realizado com sucesso

Cenario: PUT Editar Usuario 200
    [tags]    PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code 201

Cenario: DELETE Usuario 200
    [tags]    DELETE 
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code 200

#Sessão para criação de Keywords Personalizada s
*** Keywords ***
Criar Sessao
    Create Session    ServeRest    https://serverest.dev

GET Endpoint /usuarios
    ${response}      GET On Session    ServeRest    /usuarios
    Set Global Variable   ${response}


POST Endpoint /usuarios
    &{payload}          Create Dictionary    nome=ja  email=ja@gmail.com   password=123    administrador=true
    ${response}         POST On Session    ServeRest    /usuarios    data=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}          Create Dictionary    nome=jer priestt  email=teiprewaslll@gmail.com   password=123    administrador=true
    ${response}         PUT On Session    ServeRest    /usuarios/ZjZmyZpay2HtAUsM    data=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}      

DELETE Endpoint /usuarios
    ${response}               DELETE On Session   ServeRest    /usuarios/ZjZmyZpay2HtAUsM
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}

Validar Status Code
    [Arguments]       ${status_code}
    Should Be True    ${response.status_code} == ${status_code}       

Validar Quantidade
    [Arguments]       ${quantidade}
    Should Be Equal      ${response.json()['quantidade']}       ${quantidade}

Validar Se Mensagem Contem
    [Arguments]       ${mensagem}
    Should Be Equal      ${response.json()['message']}       ${mensagem}  

Printar Conteudo Response
    Log To Console      Response: ${response.json()[]}