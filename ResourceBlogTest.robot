*** Settings *** 
Library  SeleniumLibrary

*** Variables ***
${URL}      https://robotizandotestes.blogspot.com/
${BROWSER}  googlechrome
${BTN_PESQUISAR}  css=button.search-expand.touch-icon-button
${FIELD_PESQUISAR}  name=q
${TEXTO_PESQUISA}  Season Mobile com Appium - Ep.02: Instalação e Setup Appium + Android Studio no Ubuntu 20.04
${SUBMIT_PESQUISAR_BTN}  css=input.search-action.flat-button


*** Keywords ***
Acessar a página do blog 
  Open Browser    url=${URL}    browser=${BROWSER} 
  Title Should Be    Robotizando Testes 

Pesquisar por um post com "${TEXTO_PESQUISA}"
  Wait Until Element Is Visible  locator=${BTN_PESQUISAR}   
  Click Button    ${BTN_PESQUISAR} 
  Input Text   ${FIELD_PESQUISAR}    ${TEXTO_PESQUISA}
  Click Element    ${SUBMIT_PESQUISAR_BTN}


Conferir mensagem de pesquisa por "${MSG_ESPERADA}"
    Page Should Contain    ${MSG_ESPERADA}

Fechar Navegador
    Close Browser