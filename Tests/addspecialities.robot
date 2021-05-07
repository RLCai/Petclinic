*** Settings ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Library                         DateTime
Test Setup                      Given User on the Infotivpetclinic homepage
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                          http://localhost:4200/
${New Specialties}              New Specialties
${Specialties Page}             Specialties
*** Keywords ***
Given User on the Infotivpetclinic homepage
    Open browser                 ${URL}    ${BROWSER}
    #set selenium speed          1
    Wait until Page Contains     Welcome to Petclinic
User clicks the Specialties
    click element                 xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a
    Wait until Page Contains      Specialties
    page should contain element   id=specialties
User clicks the Add Specialties
    click element                       xpath://html/body/app-root/app-specialty-list/div/div/div/button[2]
    page should contain element         id=specialty
    Input Text                          id=name  paediatrics
    click button                        Save
    page should contain element         id=4  paediatrics
End Web Test
  close all browsers

*** Test Cases ***
User can add new specialties
     set selenium speed  0.25
     [Documentation]  This test adds new specialties
     [Tags]           Adds new specialties
     User clicks the Specialties
     User clicks the Add Specialties

