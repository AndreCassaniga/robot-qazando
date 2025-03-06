*** Settings ***
Resource    ../resources/home_page.resource
#Resource    ../resources/login_page.resource
#Resource    ../locators/login_locators.resource

Suite Setup    Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Validar campo e-mail vazio
    Acessar página de login
    #Preencher login    ${EMPTY}    senha123
    #Verificar mensagem de erro
