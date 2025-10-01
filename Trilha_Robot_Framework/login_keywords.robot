*** Settings ***
Documentation       Keywords e Variaveis para Ações do Endpoint /usuarios


*** Variables ***
${email_para_login}       belt@qa.com.br
${senha_para_login}       teste 

*** Keywords *** 

POST Endpoint /login 
    &{payload}          Create Dictionary  email=belt@qa.com.br   password=teste
    ${response}         POST On Session    ServeRest    /login    data=&{payload}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}