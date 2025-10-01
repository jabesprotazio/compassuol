*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios


*** Variables ***
${token_auth}        Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJlbHRAcWEuY29tLmJyIiwicGFzc3dvcmQiOiJ0ZXN0ZSIsImlhdCI6MTc1OTI2MDQyMiwiZXhwIjoxNzU5MjYxMDIyfQ.W71MYGVKLvUP8QHQfxWiQkVq9wofIHCr20N4WKapeec

*** Keywords *** 
POST Endpoit /produtos 
    &{header}           Create Dictionary     Authorization=${token_auth}
    &{payload}          Create Dictionary     nome="MouseT"     preco=400         descricao="Mouse"      quantidade=100  
    ${response}         POST On Session        ServeRest    /produtos    data=&{payload}        headers=${header}
    Log To Console      Response: ${response.content}
    Set Global Variable       ${response}