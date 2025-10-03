#Sessão para configuração, documentação, imports de arquivos 
*** Settings ***
Documentation   Arquivos simples para requisições HTTP em API ServeRest 
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Resource        ./common/common.robot
Resource        ./fixtures/dynamics.robot
Resource        ./variaveis/serverest_variaveist.robot

#Sessão para criação de Keywords Personalizada s
*** Keywords ***
Criar Sessao
    Create Session    ServeRest    ${BASE_URL}    
