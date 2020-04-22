*** Settings ***
Documentation    Login
...              Sendo um administrador de catálogo
...              Quero me autenticar no sistema
...              Para que eu possa gerenciar o catálogo de produtos

Resource    ../resources/steps_kw.robot

Test Setup      Start Session
Test Teardown   End Session

*** Test Cases ***
Login com sucesso
    Dado que acesso a página login
    Quando eu submeto minhas credenciais "paty@ninjapixel.com" e "pwd123"
    Então devo ser autenticado

Email incorreto
    [Template]                  Tentar Logar
    blablabla@ninjapixel.com    pwd123          Usuário e/ou senha inválidos

Senha incorreta
    [Template]             Tentar Logar
    paty@ninjapixel.com    abc123          Usuário e/ou senha inválidos

Email nao informado
    [Template]    Tentar Logar
    ${EMPTY}      pwd123          Opps. Informe o seu email!

Senha nao informada
    [Template]             Tentar Logar
    paty@ninjapixel.com    ${EMPTY}        Opps. Informe a sua senha!



*** Keywords ***
Tentar Logar
    [Arguments]    ${email}    ${pass}    ${expect_message} 

    Dado que acesso a página login
    Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Então devo ver uma mensagem de alerta "${expect_message}"      