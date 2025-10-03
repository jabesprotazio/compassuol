*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios
Resource            ../support/base.robot
Resource            ../support/fixtures/dynamics.robot


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
    ${response}         PUT On Session    ServeRest    /usuarios/${response.json()["_id"]}    json=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}      

DELETE Endpoint /usuarios
    ${response}               DELETE On Session   ServeRest    /usuarios/${response.json()["_id"]}
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}

Validar Quantidade
    [Arguments]       ${quantidade}
    Should Be Equal      ${response.json()['quantidade']}       ${quantidade}
    
Pegar Dados Usuario Estatico Valido
    ${json}          Importar JSON Estatico      json_usuario_ex.json
    ${payload}       Set Variable                ${json["user_valido"]}