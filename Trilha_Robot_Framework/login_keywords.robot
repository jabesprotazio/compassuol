*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios


*** Variables ***
${email_para_login}       fulano@qa.com
${senha_para_login}       teste

*** Keywords *** 

POST Endpoint /login 
    &{payload}          Create Dictionary  email=${email_para_login}   password=${senha_para_login}
    ${response}         POST On Session    ServeRest    /login    data=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}

Validar Ter Logado
    Should Be Equal    ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty   ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login 
    Validar Ter Logado
    ${token}        Set Variable        ${response.json()["authorization"]}
    Log To Console      Token Salvo:     ${token}
    Set Global Variable    ${token}