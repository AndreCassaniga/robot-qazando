*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Variables ***
${USER_DATA_DIR_ID}  ${EMPTY}
${USER_DATA_DIR}   /home/runner/.config/google-chrome-${USER_DATA_DIR_ID}

*** Keywords ***
Abrir navegador
    ${options}=    Create List    --user-data-dir=${USER_DATA_DIR}    --no-sandbox
    Create WebDriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${BASE_URL}

Acessar página de login
    Wait Until Element Is Visible  ${LOGIN_BUTTON}  timeout=10s
    Click Element    ${LOGIN_BUTTON}

Acessar página de cadastro
    Click Button    ${CADASTRO_BUTTON}

Fechar navegador
    Close Browser