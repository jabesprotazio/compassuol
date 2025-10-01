*** Settings ***
Resource    ../resources/api_testing_usuarios.resource 


*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo     
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente 


Cenário 02: Cadastrar um usuario já existente 
    Criar um usuário novo 
    Cadastrar o usuário criado na ServeRest     email=${EMAIL_TESTE}      status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido 

Cenário 03: consultar os dados de um novo usuário
    [Tags]      aqui
    Criar um usuário novo 
    Cadastrar o usuário criado na ServeRest     email=${EMAIL_TESTE}      status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados do novo usuário 


Cenário 04: Logar com o novo usuário criado
    [Tags]      login
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest     email=${EMAIL_TESTE}      status_code_desejado=201 
    Realizar Login com o usuário
    Conferir se o Login ocorrreu com sucesso