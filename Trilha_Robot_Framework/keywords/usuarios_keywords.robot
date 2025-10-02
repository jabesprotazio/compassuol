*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios
Resource            ../support/base.robot

*** Variables ***
${nome_do_usuario}        herbert richards 
${senha_do_usuario}       teste123
${email_do_usuario}       testestesteste@qa.com.br

*** Keywords *** 
GET Endpoint /usuarios
    [Tags]    GET
    ${response}      GET On Session    ServeRest    /usuarios
    Set Global Variable   ${response}


POST Endpoint /usuarios
    ${response}         POST On Session    ServeRest    /usuarios    json=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}          Create Dictionary    nome=jer priestt  email=teiprewaslll@gmail.com       password=123    administrador=true
    ${response}         PUT On Session    ServeRest    /usuarios/ZjZmyZpay2HtAUsM    data=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}      

DELETE Endpoint /usuarios
    ${response}               DELETE On Session   ServeRest    /usuarios/ZjZmyZpay2HtAUsM
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}

Validar Quantidade
    [Arguments]       ${quantidade}
    Should Be Equal      ${response.json()['quantidade']}       ${quantidade}


Validar Se Mensagem Contem
    [Arguments]       ${mensagem}
    Should Be Equal      ${response.json()['message']}       ${mensagem}  

Printar Conteudo Response
    Log To Console      Response: ${response.json()["usuarios"][2]["identificacao"]["RG"]}

Cadastrar Usuario Estatico Valido
    ${json}                  Importar JSON Estatico      json_usuario_ex.json
    ${payload}               Set Variable      ${json["user_valido"]}  
    Set Global Variable      ${payload}
    POST Endpoint /usuarios

Cadastrar Usuario Dinamico Valido 
    ${payload}      Criar dados Usuario Valido
    Set Global Variable      ${payload}
    POST Endpoint /usuarios