*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BASE_URL}     http://pixel-web:3000

*** Keywords ***
Start Session
    Open Browser                    about:blank      chrome
    Set Selenium Implicit Wait      5
    Set Window Size                 1440    900

End Session
    Close Browser
    Capture Page Screenshot
    