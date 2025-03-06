*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Variables ***
${USER_DATA_DIR_ID}  ${EMPTY}
${USER_DATA_DIR}   /home/runner/.config/google-chrome-${USER_DATA_DIR_ID}

*** Keywords ***
Abrir navegador
    Create Chrome Options    ${USER_DATA_DIR}
    Maximize Browser Window
    Go To    ${BASE_URL}

Acessar página de login
    Wait Until Element Is Visible  ${LOGIN_BUTTON}  timeout=10s
    Click Element    ${LOGIN_BUTTON}

Acessar página de cadastro
    Click Button    ${CADASTRO_BUTTON}

Fechar navegador
    Close Browser

*** Keywords ***
Create Chrome Options
    [Arguments]    ${user_data_dir}
    ${options}=    Create Dictionary    --user-data-dir=${user_data_dir}    --no-sandbox
    Create WebDriver    Chrome    options=${options}