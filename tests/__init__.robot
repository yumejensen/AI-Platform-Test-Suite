*** Settings ***
Documentation     Master Suite Configuration
Library           QWeb
Resource    ../resources/keywords.robot

# Open browser before case 1 and close after case 3
Suite Setup       Run Keywords
...               OpenBrowser    about:blank    chrome
...               AND    Login to Copado AI Platform
Suite Teardown    CloseAllBrowsers
