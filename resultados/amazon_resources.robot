*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${BROWSER}                      chrome
${URL}                          https://www.amazon.com.br/
${MENU_ELETRONICOS}            //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}          //span[contains(text(),'Eletrônicos e Tecnologia')]   
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${BUTTON_MOVE_CATEGORY}        (//a[@role='button'])[6]
${MAIN_SEARCH_FIELD}           //input[@id='twotabsearchtextbox']
${MAIN_SEARCH_BTN}             //input[@id='nav-search-submit-button']


*** Keywords ***

Abrir o navegador 
    Open Browser  browser=${BROWSER}
    Maximize Browser Window
  
Fechar o navegador
    SeleniumLibrary.Capture Page Screenshot
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


Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Click Element    ${MAIN_SEARCH_FIELD}
    Input Text       ${MAIN_SEARCH_FIELD}    ${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${MAIN_SEARCH_BTN}

Clicar no botão de escolha do elemento ${ELEMENTO}
    Click Element    ${ELEMENTO}

Clicar no botão carrinho ${ELEMENTO}
    Click Element    ${ELEMENTO}

Verificar o resultado da pesquisa se está listando o produto pesquisado "${NOME_PRODUTO}"
    Wait Until Page Contains    "${NOME_PRODUTO}"

Verificar se o carrinho fica vazio "foi removido de Carrinho de compras."
    Wait Until Page Contains    "${REMOVIDO}"

#GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Abrir o navegador
    Acessar a home page do site Amazon.com.br  
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z." 
    
Quando acessar o menu "Eletrônicos"  
    Entrar no menu "Eletrônicos"
    
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática" 

Quando pesquisar pelo produto "Xbox Series X"
    Digitar o nome de produto "Xbox Series X" no campo de pesquisa
    Clicar no botão de pesquisa 

Então o título da página deve ficar "Amazon.com.br : Xbox Series X"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series X"

E um produto da linha "Xbox Series X" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto pesquisado "Console Xbox Series X"


#Tarefa 1
    Acessar a home page do site Amazon.com.br

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa

Verificar o resultado da pesquisa se está listando o produto pesquisado "Console Xbox Series X"
    Verificar o resultado da pesquisa se está listando o produto pesquisado "Console Xbox Series X"

Adicionar o produto "Console Xbox Series S" no carrinho
    Clique no botão de escolha do lemento //h2[@aria-label='Console Xbox Series X']//span[contains(text(),'Console Xbox Series X')]
    Clickar no botão carrinho //input[@id='add-to-cart-button']
    Click Element   //input[@aria-labelledby='attachSiNoCoverage-announce']

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Click Element   //span[@class='nav-line-2'][normalize-space()='Carrinho']
    Verificar se aparece a frase "Console Xbox Series X"
    

    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series X" foi adicionado com sucesso
    
    Remover o produto "Console Xbox Series X" do carrinho
    
    Verificar se o carrinho fica vazio "foi removido de Carrinho de compras."
    




#GHERKIN ATIVIDADE 1

    Dado que estou na home page da Amazon.com.br

Quando adicionar o produto "Console Xbox Series X" no carrinho
    Quando pesquisar pelo produto "Xbox Series X"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Adicionar o produto "Console Xbox Series S" no carrinho

E existe o produto "Console Xbox Series X" no carrinho
    Verificar se o produto "Console Xbox Series X" foi adicionado com sucesso    

Quando remover o produto "Console Xbox Series X" do carrinho
    Remover o produto "Console Xbox Series X" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio "foi removido de Carrinho de compras."