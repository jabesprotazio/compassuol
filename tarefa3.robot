*** Settings ***
Documentation

*** Variables ***

@{MESES}   Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro


*** Test Cases ***

Caso de teste para imprimir 
    Imprimindo conforme solicitado



*** Keywords ***

Imprimindo conforme solicitado
    Log To Console   ${MESES[0]}
    Log To Console   ${MESES[1]}
    Log To Console   ${MESES[2]}
    Log To Console   ${MESES[3]}
    Log To Console   ${MESES[4]}
    Log To Console   ${MESES[5]}
    Log To Console   ${MESES[6]}
    Log To Console   ${MESES[7]}
    Log To Console   ${MESES[8]}
    Log To Console   ${MESES[9]}
    Log To Console   ${MESES[10]}
    Log To Console   ${MESES[11]}
