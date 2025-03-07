*** Settings ***
Resource    ../resources/home_page.resource
Resource    ../resources/cadastro_page.resource

Test Setup        Avançar para página de cadastro
Test Teardown     Fechar Navegador

*** Test Cases ***
Validar campo nome vazio
    Preencher cadastro    ${EMPTY}    usuario@email.com    senha123
    Verificar mensagem de erro    O campo nome deve ser prenchido

Validar campo e-mail vazio
    Preencher cadastro    Usuario Teste    ${EMPTY}    senha123
    Verificar mensagem de erro    O campo e-mail deve ser prenchido corretamente

Validar campo e-mail inválido
    Preencher cadastro    Usuario Teste    email_invalido    senha123
    Verificar mensagem de erro    O campo e-mail deve ser prenchido corretamente

Validar campo senha vazio
    Preencher cadastro    Usuario Teste    usuario@email.com    ${EMPTY}
    Verificar mensagem de erro    O campo senha deve ter pelo menos 6 dígitos

Validar campo senha inválida
    Preencher cadastro    Usuario Teste    usuario@email.com    123
    Verificar mensagem de erro    O campo senha deve ter pelo menos 6 dígitos

Validar cadastro com sucesso
    Preencher cadastro    Usuario Teste    usuario@email.com    123456
    Verificar mensagem cadastro com sucesso    Usuario Teste



