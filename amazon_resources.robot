*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[contains(text(),'Eletrônicos')]



*** Keywords ***

Abrir o navegador 
    Open Browser  browser=chrome   
    Maximize Browser Window
  
Fechar o navegador
    Close Browser 

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}    


   