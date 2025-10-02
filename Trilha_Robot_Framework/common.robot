*** Settings ***
Documentation       Keywords e Variaveis para Ações Gerais
Library             OperatingSystem


*** Variables ***
${email_para_login}       fulano@qa.com
${senha_para_login}       teste

*** Keywords *** 
Validar Status Code
    [Arguments]       ${status_code}
    Should Be True    ${response.status_code} == ${status_code}  


Importar JSON Estatico
    [Arguments]       ${nome_arquivo}
    ${arquivo}=       Get File    ${EXECDIR}/${nome_arquivo}
    ${data}           Evaluate    json.loads('''${arquivo}''')    json
    [Return]          ${data}
    
    