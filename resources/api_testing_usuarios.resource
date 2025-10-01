*** Settings ***
Library   RequestsLibrary
Library   String
Library   Collections

*** Keywords ***
Criar um usuário novo 
    ${palabra_aleatoria}=   Generate Random String   5  LETTERS
    ${palabra_aleatoria}=   Convert To Lower Case   ${palabra_aleatoria}
    Set Test Variable   ${EMAIL_TESTE}   ${palabra_aleatoria}@emailtest.com
    Log  ${EMAIL_TESTE}


Cadastrar o usuário criado na ServeRest
    [Arguments]    ${email}     ${status_code_desejado} 
    ${body}     Create Dictionary  
    ...         nome="Fulano da Silva"
    ...         email=${email}
    ...         password="teste"
    ...         administrador=true
    Set Test Variable    ${body}    ${body}
    Log     ${body}


    Criar Sessão na ServeRest

    ${response}     POST On Session   
    ...             alias=ServeRest      
    ...             url=/usuarios
    ...             json=${body}
    ...             expected_status=${status_code_desejado}

    Log     ${response.json()}
    IF   ${status_code_desejado} == 201
         Set Test Variable   ${ID_USUARIO}   ${response.json()['_id']}
    END

    Set Test Variable    ${RESPOSTA}    ${response.json()}

Criar Sessão na ServeRest
    ${headers}    Create Dictionary   accept=application/json      Content-Type=application/json
    Create Session   alias=ServeRest    url=https://serverest.dev    headers=${headers}


Conferir se o usuário foi cadastrado corretamente 
    Log   ${RESPOSTA}
    Dictionary Should Contain Item   ${RESPOSTA}   message   Cadastro realizado com sucesso
    Dictionary Should Contain key    ${RESPOSTA}   _id  


Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}     status_code_desejado=400


Verificar se a API não permitiu o cadastro repetido 
    Dictionary Should Contain Item   ${RESPOSTA}   message   Este email já está sendo usado

Consultar os dados do novo usuário
    ${resposta_consulta}    GET On Session    alias=ServeRest   url=/usuarios/${ID_USUARIO}
    Log   ${resposta_consulta.status_code}
    Log   ${resposta_consulta.reason}
    Log   ${resposta_consulta.headers}
    Log   ${resposta_consulta.text}
    Log   ${resposta_consulta.json()}


    Set Test Variable     ${RESP_CONSULTA}   ${resposta_consulta.json()}

Conferir os dados do novo usuário 
    Log   ${RESP_CONSULTA} 
    Dictionary Should Contain Item   ${RESP_CONSULTA}   nome            "Fulano da Silva"
    Dictionary Should Contain Item   ${RESP_CONSULTA}   email           ${EMAIL_TESTE}
    Dictionary Should Contain Item   ${RESP_CONSULTA}   password        "teste"
    Dictionary Should Contain Item   ${RESP_CONSULTA}   administrador   true
    Dictionary Should Contain Item   ${RESP_CONSULTA}   _id             ${ID_USUARIO}


Realizar Login com o usuário
    ${body_login}     Create Dictionary  
    ...         email=${EMAIL_TESTE}
    ...         password="teste"
    Set Test Variable   ${body_login}   ${body_login}
    ${RESPOSTA_LOGIN}    POST On Session   
    ...             alias=ServeRest 
    ...             url=/login
    ...             json=${body_login}
    Log   ${RESPOSTA_LOGIN.status_code}
    
    Set Test Variable     ${RESPOSTA_LOGIN}   ${RESPOSTA_LOGIN.json()}


Conferir se o Login ocorrreu com sucesso
    Dictionary Should Contain Item   ${RESPOSTA_LOGIN}   message   Login realizado com sucesso
    Dictionary Should Contain key    ${RESPOSTA_LOGIN}   authorization