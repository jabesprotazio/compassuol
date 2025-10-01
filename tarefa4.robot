*** Settings ***

*** Variables ***

&{MESES}   Janeiro=1    Fevereiro=2    Março=3    Abril=4    Maio=5    Junho=6    Julho=7    Agosto=8    Setembro=9    Outubro=10    Novembro=11    Dezembro=12



*** Test Cases ***    
Caso de teste para imprimir 
    Imprimindo conforme solicitado


*** Keywords ***

Imprimindo conforme solicitado
    Log To Console  O mês de Janeiro corresponde a  ${MESES.Janeiro}
    Log To Console  O mês de Fevereiro corresponde a  ${MESES.Fevereiro}
    Log To Console  O mês de Março corresponde a  ${MESES.Março}
    Log To Console  O mês de Abril corresponde a  ${MESES.Abril}
    Log To Console  O mês de Maio corresponde a  ${MESES.Maio}
    Log To Console  O mês de Junho corresponde a  ${MESES.Junho}
    Log To Console  O mês de Julho corresponde a ${MESES.Julho}
    Log To Console  O mês de Agosto corresponde a ${MESES.Agosto}
    Log To Console  O mês de Setembro corresponde a ${MESES.Setembro}
    Log To Console  O mês de Outubro corresponde a ${MESES.Outubro}
    Log To Console  O mês de Novembro corresponde a ${MESES.Novembro}
    Log To Console  O mês de Dezembro corresponde a ${MESES.Dezembro}
