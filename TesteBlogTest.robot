*** Settings ***
Resource  ResourceBlogTest.robot


*** Test Cases ***
Caso de Teste 01: Pesquisar um post
    Acessar a página do blog 
    Pesquisar por um post com "Season Mobile com Appium - Ep.02: Instalação e Setup Appium + Android Studio no Ubuntu 20.04"
    Conferir mensagem de pesquisa por "Mostrando postagens que correspondem à pesquisa por Season Mobile com Appium - Ep.02: Instalação e Setup Appium + Android Studio no Ubuntu 20.04"
    Fechar Navegador