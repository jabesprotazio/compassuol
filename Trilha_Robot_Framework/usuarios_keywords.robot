*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios


*** Variables ***
${nome_do_usuario}        herbert richards 
${senha_do_usuario}       teste123
${email_do_usuario}       testestesteste@gmail.com 

*** Keywords *** 
GET Endpoint /usuarios
    ${response}      GET On Session    ServeRest    /usuarios
    Set Global Variable   ${response}


POST Endpoint /usuarios
    &{payload}          Create Dictionary    nome={nome_do_usuario}  email={email_do_usuario}   password=123    administrador=true
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
