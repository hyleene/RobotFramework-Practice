*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}   www.saucedemo.com
${BROWSER}  chrome
${DELAY}    0
${VALID USER}   standard_user
${LOCKED OUT USER}  locked_out_user
${PROBLEM USER}     problem_user
${VALID PASSWORD}   secret_sauce
${WRONG PASSWORD}   wrong_password
${LOGIN URL}    https://${SERVER}/
${HOME URL}     https://${SERVER}/inventory.html
${PROBLEM USER IMAGE}   /static/media/sl-404.168b1cce.jpg
${A TO Z}   az
${Z TO A}   za
${LOW TO HIGH}  lohi
${HIGH TO LOW}  hilo
${FIRST}    Sauce Labs Backpack
${LAST}     Test.allTheThings() T-Shirt (Red)
${LOWEST}   Sauce Labs Onesie
${HIGHEST}  Sauce Labs Fleece Jacket


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     login-button

Product Page Should Be Open
    Element Text Should Be  class:title     PRODUCTS

Login as Valid User
    Open Browser to Login Page
    Input Username   ${VALID USER}
    Input Pass    ${VALID PASSWORD}
    Submit Credentials

Input Username
    [Arguments]     ${username}
    Input Text  user-name   ${username}

Input Pass
    [Arguments]     ${password}
    Input Password  password   ${password}

Submit Credentials
    Click Button    login-button

Error Message Shown
    [Arguments]     ${error}
    Element Text Should Be  css:*[data-test="error"]    ${error}

Input Filter
    [Arguments]     ${filter}
    Select From List By Value   //*[@id="header_container"]/div[2]/div[2]/span/select   ${filter}

Check First Element
    [Arguments]     ${element}
    Element Should Contain      //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]     ${element}