*** Settings ***

Documentation           Keywords for AI Platform Testing
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Keywords ***
Login to Copado AI Platform
    GoTo    ${AI_LOGIN_URL}
    ClickText    Sign in with email →
    TypeText     Email    ${AI_USER}
    TypeSecret            Password    ${AI_PASS}
    ClickText             LOGIN
    VerifyText            Skip Questions    timeout=10s
    ClickText             Skip Questions
