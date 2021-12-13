*** Settings ***
Documentation   A test suite with a single test for valid login
...
...             This test follows the example using keywords from 
...             the SeleniumLibrary
Resource        resources.robot

*** Test Cases ***
Valid Login
    Open Browser to Login Page
    # input username
    Input Username   ${VALID USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    # close browser
    [Teardown]  Close Browser

Locked Out Login
    Open Browser to Login Page
    # input username
    Input Username   ${LOCKED OUT USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    # Error message is "Epic sadface: Sorry, this user has been locked out."
    Error Message Shown     Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]  Close Browser