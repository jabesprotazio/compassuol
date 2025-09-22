*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br segundo a tarefa 1
Resource       amazon_resources.robot   
Test Setup     Abrir o navegador 
Test Teardown  Fechar o navegador


*** Test Cases ***

Acessar a home page do site Amazon.com.br
    Acessar a home page do site Amazon.com.br  

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa

Clicar no botão de pesquisa
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
    

