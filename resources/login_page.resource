*** Settings ***
Library    SeleniumLibrary
Resource    ./home_page.resource
Resource    ../locators/login_locators.resource

*** Keywords ***
Preencher login
    [Arguments]    ${email}    ${senha}
    Wait Until Element Is Visible    ${LOGIN_INPUT_LOCATOR}    10    
    Input Text    ${LOGIN_INPUT_LOCATOR}     ${email}
    Input Text    ${PASSWORD_INPUT_LOCATOR}    ${senha}
    Click Button    ${LOGIN_BUTTON_LOCATOR}

Verificar mensagem de erro
    [Arguments]    ${mensagem_esperada}
    Wait Until Element Is Visible  ${ERROR_MESSAGE_LOCATOR}  
    Element Should Be Visible    ${ERROR_MESSAGE_LOCATOR}
    Element Text Should Be       ${ERROR_MESSAGE_LOCATOR}   ${mensagem_esperada}

Verificar mensagem login com sucesso
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${LOGIN_MESSAGE_LOCATOR}    10
    Element Text Should Be    ${LOGIN_MESSAGE_LOCATOR}    Login realizado
    Element Text Should Be    ${USER_LOGIN_MESSAGE_LOCATOR}    Olá, ${email}            

Avançar para página de login
    Abrir navegador
    Acessar página de login
