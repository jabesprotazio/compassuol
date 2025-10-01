*** Settings *** 
Library  SeleniumLibrary

*** Variables ***
${URL}      https://robotizandotestes.blogspot.com/
${BROWSER}  googlechrome
${BTN_PESQUISAR}  css=button.search-expand.touch-icon-button
${FIELD_PESQUISAR}  name=q
#${TEXTO_PESQUISA}  Season Mobile com Appium - Ep.02: Instalação e Setup Appium + Android Studio no Ubuntu 20.04
${SUBMIT_PESQUISAR_BTN}  css=input.search-action.flat-button
${LINK_POST}  xpath=//a[contains(text(),'Season Premiere: Introdução  ao Robot Framework')]
${IMG_ROBO}  css=div.snippet-thumbnail img

*** Keywords ***
Acessar a página do blog 
    Open Browser    url=${URL}    browser=${BROWSER} 
    Title Should Be    Robotizando Testes 

Pesquisar por um post
    [Arguments]    ${TEXTO_PESQUISA}
    Wait Until Element Is Visible    locator=${BTN_PESQUISAR}   
    Click Button    ${BTN_PESQUISAR} 
    Input Text    ${FIELD_PESQUISAR}    ${TEXTO_PESQUISA}
    Click Element    ${SUBMIT_PESQUISAR_BTN}

Conferir mensagem de pesquisa por 
    [Arguments]   ${MSG_ESPERADA}
    Page Should Contain    ${MSG_ESPERADA}

Fechar Navegador
    Close Browser

Acessar o post
    [Arguments]    ${TEXTO_PESQUISA}
    Pesquisar por um post    ${TEXTO_PESQUISA}

Conferir se a imagem do robô aparece    
    Wait Until Element Is Visible    locator=${IMG_ROBO}    timeout=10s
    Page Should Contain Image    ${IMG_ROBO}

Conferir se o texto aparece
    [Arguments]    ${TEXTO_DESEJADO}
    Page Should Contain    ${TEXTO_DESEJADO}