*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /login  
Resource            ../support/base.robot
Resource            ../keywords/login_keywords.robot

*** Keywords *** 
POST Endpoint /login
    Criar Dados Usuario Valido
    ${response}             POST On Session    ServeRest    /login    ${payload}
    Log To Console          Response: ${response.content}
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