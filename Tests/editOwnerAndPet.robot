*** Setting ***
Documentation     PetClinik
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
Click Button
    [Arguments]                 ${click}
    Click Element               ${click}
Move Mouse Down
    [Arguments]                 ${click}
    Mouse Down                  ${click}
Click Element and Verify It Load To Expected Page
    [Arguments]                 ${click}   ${text}
    Click Element               ${click}
    Wait Until Page Contains    ${text}
    Page should Contain         ${text}
Set Value
    [Arguments]                 ${click}   ${text}
    Input Text                  ${click}   ${text}
End Web Test
    Close Browser

*** Test Cases ***
User Can Edit Owners
    [Documentation]     User Can Edit the Owner Information
    [Tags]              EditOwnerInformation (PB-19)
    Go to Web Page
    Click Button         xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Move Mouse Down      xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]   Name
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a    Owner Information
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-detail/div/div/button[2]   First Name
    Set Value           id:firstName   Kitty
    Set Value           id:lastName    Albert
    Set Value           id:address      220 C. Liseberg
    Set Value           id:city        London
    Set Value           telephone      6095551015
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]     Albert




User Can Edit Pet_1
    [Documentation]     User Can Edit the Pet Information_byInputBirthday
    [Tags]              EditPetInformation_1 (PB-19)
    Go to Web Page
    Click Button        xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Move Mouse Down     xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]   Name
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[8]/td[1]/a  Pets and Visits
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[1]    Type
    Set Value          id:name    HelloKitty
    Sleep              3
    Press Keys         xpath://html/body/app-root/app-pet-edit/div/div/form/div[4]/input   CTRL+a+BACKSPACE
    Set Value          xpath://html/body/app-root/app-pet-edit/div/div/form/div[4]/input   2021/03/12
    Click Button       id:type
    Click Button       xpath://*[@id="type"]/option[2]
    CLICK ELEMENT AND VERIFY IT LOAD TO EXPECTED PAGE    xpath://html/body/app-root/app-pet-edit/div/div/form/div[6]/div/button[2]   dog

User Can Edit Pet_2
    [Documentation]     User Can Edit the Pet Information_bySelectBirthday
    [Tags]              EditPetInformation_2 (PB-19)
    Go to Web Page
    Click Button        xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
    Move Mouse Down     xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]   Name
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[2]/td[1]/a   Pets and Visits
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[1]    Type
    Set Value          id:name    Cello
    Click Button       xpath://html/body/app-root/app-pet-edit/div/div/form/div[4]/mat-datepicker-toggle/button/span
    Click Button       id:mat-datepicker-0
    Click Button       id:type
    Click Button       xpath://*[@id="type"]/option[1]
    Click Element and Verify It Load To Expected Page   xpath://html/body/app-root/app-pet-edit/div/div/form/div[6]/div/button[2]  Cello

