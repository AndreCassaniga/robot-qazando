*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_locators.resource
Variables   ../variables/common_variables.py

*** Keywords ***
Abrir navegador
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    # Call Method    ${chrome_options}    add_argument    --headless
    Create WebDriver    Chrome    options=${chrome_options}
    Maximize Browser Window
    Go To    ${BASE_URL}

Acessar página de login
    Wait Until Element Is Visible  ${LOGIN_BUTTON}  timeout=10s
    Click Element    ${LOGIN_BUTTON}

Acessar página de cadastro
    Wait Until Element Is Visible    ${CADASTRO_BUTTON}    timeout=10s
    Click Element    ${CADASTRO_BUTTON}

Fechar navegador
    Close Browser