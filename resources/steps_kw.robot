*** Settings ***
Resource    base.robot


*** Keywords ***
## Login
Dado que acesso a página login
    Go To              ${BASE_URL}

Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn

Então devo ser autenticado
    Wait Until Page Contains    Paty
    Close Browser

Então devo ver uma mensagem de alerta "${expect_message}"
    Wait Until Page Contains           ${expect_message}
    Close Browser
