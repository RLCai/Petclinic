*** Settings ***
Documentation   Test add owner with 2 pets, remove 1 pet and change lastname of added owner
Library         SeleniumLibrary
Test Setup      Begin Web Test
Test Teardown   End Web Test
*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200/

*** Keywords ***
Begin Web Test
    Open Browser               about:black     ${BROWSER}
    Maximize Browser Window
    Go to                       ${URL}
Verify Page Loaded
    Page should contain         Welcome to Petclinic
User selects Owners
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
User Load Owner List
    click element                       xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
User Load Owner Mattias
    User Load Owner List
    wait until page contains element    xpath://html/body/app-root/app-owner-list/div/div/div
    click link                          Mattias Teller
User Add Pet to Mattias
    click button                Add New Pet
    input text                  id=name     Charlie
    input text                  xpath://html/body/app-root/app-pet-add/div/div/form/div[4]/div/input      2021/01/01
    click element               id=type
    click element               xpath://*[@id="type"]/option[1]
    click button                Save Pet
    wait until page contains element    xpath://html/body/app-root/app-owner-detail/div/div/table[2]
User Add Second Pet to Mattias
    click button                Add New Pet
    input text                  id=name     Dizzy
    input text                  xpath://html/body/app-root/app-pet-add/div/div/form/div[4]/div/input      2021/01/01
    click element               id=type
    click element               xpath://*[@id="type"]/option[2]
    click button                Save Pet
    wait until page contains element    xpath://html/body/app-root/app-owner-detail/div/div/table[2]
User enters valid details
    input text                  xpath://*[@id="firstName"]     Mattias
    input text                  xpath://*[@id="lastName"]      Teller
    input text                  xpath://*[@id="address"]       Torslanda
    input text                  xpath://*[@id="city"]          Göteborg
    input text                  xpath://*[@id="telephone"]   2345679832547628
User clicks the Add Owner
    click button                xpath://html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]
End Web Test
    Close Browser

*** Test Cases ***
User Adds A Owner
    [Documentation]         Add Owner
    [Tags]                  PB-67
    Verify Page Loaded
    User selects Owners
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a
    User enters valid details
    User clicks the Add Owner
    wait until page contains element    xpath://html/body/app-root/app-owner-list/div/div/div
    page should contain element       xpath://html/body/app-root/app-owner-list/div/div/div  Mattias Teller
User Add A Pet To Mattias
    [Documentation]         Add Pet to Mattias
    [Tags]                  PB-67
    verify page loaded
    User selects Owners
    User Load Owner Mattias
    User Add Pet to Mattias
    page should contain element         xpath://html/body/app-root/app-owner-detail/div/div/table[2]  Charlie
User Add A Second Pet To Mattias
    [Documentation]         Add Second Pet to Mattias
    [Tags]                  PB-67
    verify page loaded
    User selects Owners
    User Load Owner Mattias
    User Add Second Pet to Mattias
    page should contain element         xpath://html/body/app-root/app-owner-detail/div/div/table[2]  Dizzy
User can remove 1 of 2 pets of Mattias
    [Documentation]         Remove 1 Pet From Mattias
    [Tags]                  PB-67
    verify page loaded
    user selects owners
    User Load Owner Mattias
    click button                        xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[2]
    page should not contain element     Charlie
User can Change lastname of Mattias
    [Documentation]         Change Lastname Of Mattias
    [Tags]                  PB-67
    verify page loaded
    user selects owners
    User Load Owner Mattias
    click button                        Edit Owner
    input text                          id=lastName  Hovde
    click button                        Update Owner
    page should contain                 Name        Mattias Hovde
User Can Add Pet Type
    [Documentation]         Add Pet Type
    [Tags]                  PB-67
    Verify Page Loaded
    click element                       xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
    click button                        xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    page should contain element         xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2
    input text                          id=name     Crab
    click button                        xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/form/div[2]/div/button
    page should contain button          xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    page should contain element         id=pettypes  Crab
User Can Remove The Added Pet Type
    [Documentation]         Add Pet Type
    [Tags]                  PB-67
    Verify Page Loaded
    click element                       xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
    page should contain element         id=pettypes  Crab
    click element                       xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[2]
    page should not contain             id=pettypes  Crab
