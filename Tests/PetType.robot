*** Settings ***
Documentation   Test Add/Edit/Remove PetTypes
Library         SeleniumLibrary
Test Setup      Begin Web Test
Test Teardown   End Web Test
*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200/

*** Keywords ***
Begin Web Test
    Open Browser                        about:black     ${BROWSER}
    Maximize Browser Window
    Go to                               ${URL}
Verify Page Loaded
    Page should contain                 Welcome to Petclinic
Click On Pet Types Button
    click element                       xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
    page should contain element         id=pettypes


#Gherkin 1-----------------------------------------------------------------------
User is on Petclinic-Add Pet Type page
    Verify Page Loaded
    Click On Pet Types Button
    click button                        xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    page should contain element         xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2
User Add a Pet Type
    input text                          id=name     Fish
    click button                        xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/form/div[2]/div/button
Pet Type Is Added
    page should contain button          xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    page should contain element         id=pettypes     Fish
#Gherkin 2-------------------------------------------------------------------------
User is on Petclinic-Edit Pet Type page
    Verify Page Loaded
    Click On Pet Types Button
User Edit A Pet Type
    click button                        xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[1]
    input text                          id=name     Tiger
    click button                        xpath://*[@id="pettype"]/div[2]/div/button[1]
Pet Type Is Changed
    page should contain button          xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    page should contain element         id=pettypes   Tiger
#Gherkin 3---------------------------------------------------------------------------
User is on Petclinic-Pet Type page
    Verify Page Loaded
    Click On Pet Types Button
User Deletes A Pet Type
    click button                        xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[2]
Pet Type Is Deleted
    page should contain button          xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    page should not contain             id=pettypes    Tiger
End Web Test
    Close Browser
*** Test Cases ***
User add a pet type
    [Documentation]         Add A Pet Type
    [Tags]                  PB-83
    #Verify Page Loaded
    #Click On Pet Types Button
    #click button                        xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    #page should contain element         xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2
    #input text                          id=name     Fish
    #click button                        xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/form/div[2]/div/button
    #page should contain button          xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    #page should contain element         id=pettypes     Fish

    Given User is on Petclinic-Add Pet Type page
    When User Add a Pet Type
    Then Pet Type Is Added

User edit pet type
    [Documentation]         Edit the added pet type
    [Tags]                  PB-70
    Given User is on Petclinic-Edit Pet Type page
    When User Edit A Pet Type
    Then Pet Type Is Changed
    #Verify Page Loaded
    #Click On Pet Types Button
    #click button                        xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[1]
    #input text                          id=name     Tiger
    #click button                        xpath://*[@id="pettype"]/div[2]/div/button[1]
    #page should contain button          xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    #page should contain element         id=pettypes   Tiger
User can delete pet type
    [Documentation]         remove the added pet type
    [Tags]                  PB-70
    Given User is on Petclinic-Pet Type page
    When User Deletes A Pet Type
    Then Pet Type Is Deleted
    #Verify Page Loaded
    #Click On Pet Types Button
    #click button                xpath://*[@id="pettypes"]/tbody/tr[7]/td[2]/button[2]
    #page should contain button  xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    #page should not contain        id=pettypes    Tiger