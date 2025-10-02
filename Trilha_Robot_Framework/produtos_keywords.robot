*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios


*** Keywords *** 
POST Endpoit /produtos 
    &{header}           Create Dictionary     Authorization=${token}
    &{payload}          Create Dictionary     nome=Xbox 003     preco=1900         descricao=i7      quantidade=100  
    ${response}         POST On Session        ServeRest    /produtos    data=&{payload}        headers=${header}
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
