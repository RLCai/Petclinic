*** Setting ***
Documentation   Keywords for CreateNew
Library         SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser               about:black     ${BROWSER}
    Maximize Browser Window
Go to Web Page
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    Page should contain         Welcome to Petclinic
Click Button
    [Arguments]                 ${click}
    Click Element               ${click}
Move Mouse Down
    [Arguments]                 ${click}
    Mouse Down                  ${click}
Click Element and Verify It Load To Expected Page
    [Arguments]                 ${click}   ${text}
    Click Element               ${click}
    Page should Contain         ${text}
Set Value
    [Arguments]                 ${click}   ${text}
    Input Text                  ${click}   ${text}
Verify Loaded
    [Arguments]                 ${text}
    Wait Until Page Contains    ${text}
End Web Test
    Close Browser