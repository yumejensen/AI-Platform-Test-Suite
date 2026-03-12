*** Settings ***

Documentation           Test the complete workspace management workflow in the Copado AI Platform
Library                 QWeb
Resource                ../resources/keywords.robot

*** Variables ***
# Names
${WORKSPACE_NAME}    Case 1 Workspace
${MESSAGE}    Hello
# Locators
${PROFILE_ICON}    xpath\=//cds-avatar circle
${PROMPT_INPUT_BOX}         xpath=//div[@id='ai-prompt-input']
${PROMPT_SEND}          xpath=//button[@id='ai-prompt-send']
${CHAT_UNDER_NEW_CHAT}    xpath\=//a[contains(., 'New Chat') and contains(@class, 'nav-menu-item')]/following::a[contains(@class, 'nav-menu-item')][1]
${AI_RESPONSE_TEXT}    xpath\=//div[contains(@class, 'ai-message')][last()]/p
${3_DOTS_ICON_BIG}    xpath\=//cds-icon[@shape='SystemAndDevicesDotsThreeRegularVerticalSolid' and @sizepx='24']

*** Test Cases ***
Verify workspace creation functionality
    [Documentation]    Login to the AI platform and create a workspace
    Login to Copado AI Platform
    ClickText       My Workspace
    ClickText       All Workspaces    timeout=5s
    ClickText    Create Workspace
    TypeText     Name    ${WORKSPACE_NAME}
    ClickText    Create    partial_match=False
Verify workspace visibility and listing
    [Documentation]    Go to all workspaces and find the created workspace
    VerifyText         ${WORKSPACE_NAME}    timeout=10s
    ClickText          ${WORKSPACE_NAME}
    ClickText    All Workspaces
    VerifyText   ${WORKSPACE_NAME}
    ClickText    ${WORKSPACE_NAME}

Verify workspace data persistence
    [Documentation]    Make a chat and verify it stays after making a new chat
    TypeText       ${PROMPT_INPUT_BOX}    ${MESSAGE}
    ClickElement   ${PROMPT_SEND}
    # While the AI is responding, 'Stop generating' text appears
    VerifyText                  Stop generating        timeout=3s
    VerifyNoText                Stop generating        timeout=30s
    # Store chat response
    ${OLD_CHAT}=       GetText    ${AI_RESPONSE_TEXT}
    Set Suite Variable    ${OLD_CHAT}
    Log                   The AI responded with: ${OLD_CHAT}
    ClickText                   Create new chat
    # Go back to the old chat and compare to stored chat
    VerifyElement               ${CHAT_UNDER_NEW_CHAT}
    ClickElement                ${CHAT_UNDER_NEW_CHAT}
    VerifyText                  ${OLD_CHAT}         timeout=10s
Verify workspace deletion functionality
    ClickText    Workspace Details
    VerifyText   Edit Workspace
    ClickText    Workspace Details
    VerifyElement    ${3_DOTS_ICON_BIG}
    ClickElement    ${3_DOTS_ICON_BIG}
    VerifyText      Delete Workspace    timeout=5s
    ClickText    Delete Workspace
    ClickText    Delete
    VerifyNoText    ${WORKSPACE_NAME}    timeout=15s

