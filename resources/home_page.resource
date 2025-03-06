*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}
    #Maximize Browser Window

Acessar página de login
    Wait Until Element Is Visible  css:.fa-user  timeout=10s
    Click Element    css:.fa-user    #${LOGIN_BUTTON}

Acessar página de cadastro
    Click Button    ${CADASTRO_BUTTON}

Fechar navegador
    Close Browser