*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Variables ***
${USER_DATA_DIR_ID}  ${EMPTY}
${USER_DATA_DIR}   /home/runner/.config/google-chrome-${USER_DATA_DIR_ID}

*** Keywords ***
Abrir navegador
    ${options}=    Create Chrome Options
    Add Chrome Option    ${options}    --user-data-dir=${USER_DATA_DIR}
    Add Chrome Option    ${options}    --no-sandbox
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

*** Keywords ***
Create Chrome Options
    [Arguments]  ${options}=None
    Run Keyword If    '${options}'=='None'    Set Variable    ${options}    ${EMPTY}
    ${options}=    Evaluate    sys = __import__('selenium.webdriver.chrome.options'); sys.Options()    modules=sys
    Set Variable    ${options}    ${options}

Add Chrome Option
    [Arguments]    ${options}    ${option}
    Call Method    ${options}    add_argument    ${option}