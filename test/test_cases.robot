*** Settings ***
Documentation   A test suite with one test for each of the eight test cases
...
...             This test follows the example using keywords from 
...             the SeleniumLibrary
Resource        resources.robot

*** Test Cases ***
Valid Login
    Login As Valid User
    Product Page Should Be Open
    [Teardown]  Close Browser

Locked Out Login
    Open Browser to Login Page
    Input Username   ${LOCKED OUT USER}
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    Error Message Shown     Epic sadface: Sorry, this user has been locked out.
    [Teardown]  Close Browser

Typed wrong password
    Open Browser to Login Page
    Input Username   ${VALID USER}
    Input Pass    ${WRONG PASSWORD}
    Submit Credentials
    Error Message Shown     Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser

Logged in as problem user and sees a broken inventory page
    Open Browser to Login Page
    Input Username   ${PROBLEM USER}
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    Page Should Contain Image   ${PROBLEM USER IMAGE}
    [Teardown]  Close Browser

Sort product name (A to Z)
    Login As Valid User
    Input Filter   ${A TO Z}
    Check First Element   ${FIRST}
    [Teardown]  Close Browser

Sort product name (Z to A)
    Login As Valid User
    Input Filter   ${Z TO A}
    Check First Element    ${LAST}
    [Teardown]  Close Browser

Sort product price (low to high)
    Login As Valid User
    Input Filter   ${LOW TO HIGH}
    Check First Element    ${LOWEST}
    [Teardown]  Close Browser

Sort product price (high to low)
    Login As Valid User
    Input Filter   ${HIGH TO LOW}
    Check First Element    ${HIGHEST}
    [Teardown]  Close Browser