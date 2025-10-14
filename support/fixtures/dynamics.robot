*** Settings ***

Documentation       Keywords e Variaveis para Ações Gerais
Library             FakerLibrary    locale=pt_BR
Library             Collections


*** Keywords *** 
Criar Dados Usuario Valido
    ${nome}        FakerLibrary.Name     
    ${email}       FakerLibrary.Email      
    &{payload}     Create Dictionary    nome=${nome}    email=${email}    password=testes  administrador=true  
    Log To Console           ${payload}
    Set Global Variable      ${payload}

Criar Produtos Validos 
    ${nome}        FakerLibrary.Name
    ${preco}       FakerLibrary.Random Int    min=100   max=1000
    ${descricao}   FakerLibrary.Text     max_nb_chars=50
    ${quantidade}  FakerLibrary.Int  min=1    max=100
    &{new_product}     Create Dictionary    nome=${nome}    preco=${preco}    descricao=${descricao}    quantidade=${quantidade}
    Log To Console           ${new_product}
    Set Global Variable      ${new_product}

