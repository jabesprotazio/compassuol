*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Resource       amazon_resources.robot   
Test Setup     Abrir o navegador 
#Test Teardown  Fechar o navegador


*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu "Eletrônicos" do site Amazon.com.br 
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias          
    Acessar a home page do site Amazon.com.br
  