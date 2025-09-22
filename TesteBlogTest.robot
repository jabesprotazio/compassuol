*** Settings ***
Resource    ResourceBlogTest.robot
Test Setup  Acessar a página do blog 
Test Teardown    Fechar Navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar um post
    Pesquisar por um post    Season Mobile com Appium - Ep.02: Instalação e Setup Appium + Android Studio no Ubuntu 20.04
    Conferir mensagem de pesquisa por    Mostrando postagens que correspondem à pesquisa por Season Mobile com Appium - Ep.02: Instalação e Setup Appium + Android Studio no Ubuntu 20.04
    Fechar Navegador

Caso de Teste 02: Ler um post
    Acessar o post    Season Premiere: Introdução ao Robot Framework
    Conferir se a imagem do robô aparece
    Conferir se o texto aparece    Robot Framework
    Fechar Navegador