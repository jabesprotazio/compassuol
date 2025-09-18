*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${URL}                          https://www.amazon.com.br/
${MENU_ELETRONICOS}            //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}          //span[contains(text(),'Eletrônicos e Tecnologia')]   
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${BUTTON_MOVE_CATEGORY}        (//a[@role='button'])[6]


*** Keywords ***

Abrir o navegador 
    Open Browser  browser=chrome   
    Maximize Browser Window
  
Fechar o navegador
    Close Browser 

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}    

Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible  locator=${HEADER_ELETRONICOS}   
 
Verificar se o título da página fica "${TITULO}"
   Title Should Be    title=${TITULO}   

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Scroll Element Into View     //span[contains(text(),'Navegue por categoria')]
    Element Should Be Visible    locator=//span[@class='a-size-base-plus'][normalize-space()='${NOME_CATEGORIA}']
    Click Element    ${BUTTON_MOVE_CATEGORY}
    
 
