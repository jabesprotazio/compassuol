#Sessão para configuração, documentação, imports de arquivos 
*** Settings ***
Documentation   Arquivos simples para requisições HTTP em API ServeRest 
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Resource        ./support/common/common.robot
Resource        ./support/fixtures/dynamics.robot
Resource        ./Variaveis/serverest_variaveis.robot

#Sessão para criação de Keywords Personalizada s
*** Keywords ***
Criar Sessao
    Create Session    ServeRest    ${BASE_URL}    
