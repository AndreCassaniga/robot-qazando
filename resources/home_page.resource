*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Variables ***
${USER_DATA_DIR}   /home/runner/.config/google-chrome-${{ github.run_id }}

*** Keywords ***
Abrir navegador
    Open Browser    ${BASE_URL}    ${BROWSER}    options=--user-data-dir=${USER_DATA_DIR}
    Maximize Browser Window

Acessar página de login
    Wait Until Element Is Visible  ${LOGIN_BUTTON}  timeout=10s
    Click Element    ${LOGIN_BUTTON}

Acessar página de cadastro
    Click Button    ${CADASTRO_BUTTON}

Fechar navegador
    Close Browser