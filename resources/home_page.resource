*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Variables ***
${USER_DATA_DIR_ID}  ${EMPTY}
${USER_DATA_DIR}   /home/runner/.config/google-chrome-${USER_DATA_DIR_ID}

*** Keywords ***
Abrir navegador
    ${options}=    Evaluate    sys = __import__('selenium.webdriver.chrome.options'); sys.Options()    modules=sys
    Call Method    ${options}    add_argument    --user-data-dir=${USER_DATA_DIR}
    Call Method    ${options}    add_argument    --no-sandbox
    Create WebDriver  Chrome  options=${options}
    Go To  ${BASE_URL}
    Maximize Browser Window

Acessar página de login
    Wait Until Element Is Visible  ${LOGIN_BUTTON}  timeout=10s
    Click Element    ${LOGIN_BUTTON}

Acessar página de cadastro
    Click Button    ${CADASTRO_BUTTON}

Fechar navegador
    Close Browser