*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios
Resource            ../support/base.robot


*** Keywords *** 
POST Endpoit /produtos 
    &{header}           Create Dictionary     Authorization=${token}
    Fazer Login e Armazenar Token
    Criar Produtos Validos 
    ${response}         POST On Session        ServeRest    /produtos    data=&{new_product}        headers=${header}
    Log To Console      Response: ${response.content}
    Set Global Variable       ${response}

    


DELETE Endpoint /produtos
    &{header}           Create Dictionary     Authorization=${token}
    ${response}               DELETE On Session   ServeRest    /produtos/${id_produto}    headers=${header}
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}

Validar Ter Criado Produto 
    Should Be Equal    ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Not Be Empty   ${response.json()["_id"]}
    

Criar Um Produto e Armazenar ID
    POST Endpoit /produtos 
    Validar Ter Criado Produto 
    ${id_produto}        Set Variable        ${response.json()["_id"]}
    Log To Console      ID do Produto Salvo:     ${id_produto}
    Set Global Variable    ${id_produto}

GET Endpoint Produto ID
    [Arguments]      ${id_produto}
    [Tags]    GETPRODUTOID
    &{header}           Create Dictionary     Authorization=${token}
    ${response}      GET On Session    ServeRest    /produtos/${id_produto}    headers=${header}
    Set Global Variable   ${response}

Listar Todos Os Produtos
    [Tags]    GETTODOSPRODUTOS
    Fazer Login e Armazenar Token
    ${response}      GET On Session    ServeRest    /produtos    headers=${header}
    Set Global Variable   ${response}