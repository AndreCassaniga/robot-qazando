*** Settings ***
Library    SeleniumLibrary
Resource    ./home_page.resource
Resource    ../locators/cadastro_locators.resource


*** Keywords ***
Preencher cadastro
    [Arguments]    ${nome}    ${email}    ${senha}
    Wait Until Element Is Visible    ${NOME_INPUT_LOCATOR}    10
    Input Text    ${NOME_INPUT_LOCATOR}    ${nome}
    Input Text    ${EMAIL_INPUT_LOCATOR}    ${email}
    Input Text    ${SENHA_INPUT_LOCATOR}    ${senha}
    Click Button    ${CADASTRAR_BUTTON_LOCATOR}

Verificar mensagem de erro
    [Arguments]    ${mensagem_esperada}
    Wait Until Element Is Visible  ${ERROR_MESSAGE_LOCATOR}  
    Element Should Be Visible    ${ERROR_MESSAGE_LOCATOR}
    Element Text Should Be       ${ERROR_MESSAGE_LOCATOR}   ${mensagem_esperada}

Verificar mensagem cadastro com sucesso
    [Arguments]    ${user}
    Wait Until Element Is Visible    ${CADASTRO_MESSAGE_LOCATOR}    10
    Element Text Should Be    ${CADASTRO_MESSAGE_LOCATOR}    Cadastro realizado!
    Element Text Should Be    ${USER_CADASTRO_MESSAGE_LOCATOR}    Bem-vindo ${user}     



Avançar para página de cadastro
    Abrir navegador
    Acessar página de cadastro