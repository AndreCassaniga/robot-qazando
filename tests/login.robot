*** Settings ***
Resource    ../resources/home_page.resource
Resource    ../resources/login_page.resource

Test Setup    Avançar para página de login
Test Teardown    Fechar Navegador

*** Test Cases ***
Validar campo e-mail vazio
    Preencher login    ${EMPTY}    123456
    Verificar mensagem de erro    E-mail inválido.

Validar campo e-mail inválido
    Preencher login    email_invalido    senha123
    Verificar mensagem de erro    E-mail inválido.

Validar campo senha vazio
    Preencher login    usuario@email.com    ${EMPTY}
    Verificar mensagem de erro    Senha inválida.

Validar campo senha inválida
    Preencher login    usuario@email.com    123
    Verificar mensagem de erro    Senha inválida.

Validar login com sucesso
    Preencher login    usuario@email.com    senha123
    Verificar mensagem login com sucesso    usuario@email.com

