*** Settings ***
Documentation       Keywords e Variaveis para Ações Gerais
Library             OperatingSystem
Library             BuiltIn

*** Keywords *** 

Validar Status Code
    [Arguments]           ${status_code}
    ${status_code}        Convert To Integer    ${status_code}
    Should Be Equal       ${response.status_code}       ${status_code}  


Validar Se Mensagem Contem
    [Arguments]       ${mensagem}
    Should Be Equal      ${response.json()['message']}       ${mensagem}  

Importar JSON Estatico
    [Arguments]       ${nome_arquivo}
    ${arquivo}        Get File              ${CURDIR}/../fixtures/static/${nome_arquivo}
    ${data}           Evaluate              json.loads('''${arquivo}''')    json
    RETURN            ${data}
    
