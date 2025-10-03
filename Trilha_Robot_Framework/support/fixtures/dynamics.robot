*** Settings ***
Documentation       Keywords e Variaveis para Ações Gerais
Library             FakerLibrary    locale=pt_BR


*** Keywords *** 
Criar Dados Usuario Valido
    ${nome}        FakerLibrary.Name
    ${email}       FakerLibrary.Email
    &{payload}     Create Dictionary    nome=${nome}    email=${email}    password=senha123    administrador=true
    Log To Console           ${payload}
    Set Global Variable      ${payload}

# Criar Produtos Validos 
