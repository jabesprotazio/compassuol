*** Settings ***
Documentation   keyword para produzir um email customizado
Library         String 

*** Variables ***
&{PESSOA}       nome=James       sobrenome=Silva

*** Test Cases ***
Caso de teste de exemplo 01
    ${EMAIL_GERADO}    Uma keyword para customizar um EMAIL    ${PESSOA.nome}      ${PESSOA.sobrenome}
    Log     Email gerado: ${EMAIL_GERADO}   

*** Keywords ***
Uma keyword para customizar um email
    [Arguments]     ${NOME}     ${SOBRENOME}
    ${STRING_RANDOM}    Generate Random String    8      [LOWER][NUMBERS]
    ${EMAIL}        Set Variable    ${NOME}.${SOBRENOME}.${STRING_RANDOM}@testerobot.com 
    [RETURN]      ${EMAIL}