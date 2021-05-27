*** Setting ***
Documentation     PetClinik_editSpecialties
Library           SeleniumLibrary
Test Setup        Begin Web Test
Test Teardown     End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}      http://localhost:4200/

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
Click Element and Verify It Load To Expected Page
    [Arguments]                 ${click}   ${text}
    Click Element               ${click}
    Wait Until Page Contains    ${text}                1
    Page should Contain         ${text}
Clear Contents
    [Arguments]                 ${click}
    Press Keys                  ${click}    CTRL+a+BACKSPACE
End Web Test
    Close Browser

*** Test Cases ***
User Can Edit Specialties
    [Documentation]     User Can Edit Specialties
    [Tags]              EditSpecialties (PB-57)
    Go to Web Page
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a/span[2]    Specialties
    Click Element and Verify It Load To Expected Page   xpath://*[@id="specialties"]/tbody/tr[1]/td[2]/button[1]    Edit Specialty
    Clear Contents         //*[@id="name"]
    Input Text             //*[@id="name"]   String
    Click Button           Update
    Wait until page contains      Home
    Page should contain element   id:specialties    String

