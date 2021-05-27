*** Settings ***

Documentation                   This is some basic information about the whole test suite.
Library                         SeleniumLibrary
Test Setup                      Begin Web Test
Test Teardown                   End Web Test

*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200/

*** Keywords ***
Begin Web Test
    Open Browser               about:black     ${BROWSER}
    Maximize Browser Window
    Go to                       ${URL}

Verify Page Loaded
         Page should contain            Welcome to Petclinic     #  Confirmation that desired website is accessed.


Click On Owners Button
         click element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a  # Click Owners button


Add Visit

         click element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a  # Click first record  in the OWNERS info
         sleep                          1
         click element                  xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a
         click element                  xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]
         Input text                     xpath://*[@id="visit"]/div[1]/div[1]/div/input     2021/05/04
         Input text                     xpath://*[@id="description"]     Soft Wound
         click button                   xpath://*[@id="visit"]/div[2]/div/button[2]
         sleep                          8
         Page should Contain Element    xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table   Soft Wound

Edit Visit

         click element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a  # Click first record  in the OWNERS info
         sleep                          1
         click element                  xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a

         click element                  xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[1]

         Input text                     xpath://*[@id="visit"]/div[1]/div[1]/div/input  2021/05/20
         Input text                     xpath://*[@id="description"]     Soft Wound DOUBLE
         click button                   xpath://*[@id="visit"]/div[2]/div/button[2]
         sleep                          8
         Page should Contain Element    xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table   Soft Wound DOUBLE


End Web Test
         Close Browser

*** Test Cases ***

User add a pet type
    [Documentation]                     Add A Visit
    [Tags]                              PB-75
    #set selenium speed                  1
    Verify Page Loaded
    Click On Owners Button
    Add Visit


User edit a pet type
    [Documentation]                     Add A Visit
    [Tags]                              PB-75
    #set selenium speed                  1
    Verify Page Loaded
    Click On Owners Button
    Edit Visit







