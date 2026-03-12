*** Settings ***
Documentation     Master Suite Configuration
Library           QWeb

# Open browser before case 1 and close after case 3
Suite Setup       OpenBrowser    about:blank    chrome
Suite Teardown    CloseAllBrowsers
