*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Library                         DateTime
Test Setup                      Given User on the Infotivpetclinic homepage
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                           http://localhost:4200/
${New Owner}                    New Owner
${OwnerPage}                    Owners


*** Keywords ***
Given User on the Infotivpetclinic homepage
    Open browser                 ${URL}    ${BROWSER}
    #set selenium speed          1
    Wait until Page Contains    Welcome to Petclinic
User selects the Owners
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a/span
    Mouse Down                   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a/span[2]
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a/span[2]

User on the New Owners page
    page should contain          ${New Owner}
User enters valid details
    input text          xpath://*[@id="firstName"]     Mohan
    input text          xpath://*[@id="lastName"]      Varma
    input text          xpath://*[@id="address"]       Liseberg
    input text          xpath://*[@id="city"]          Malmo
    input text          xpath://*[@id="telephone"]   2345679832547628
User clicks the Add Owner
    click button                    xpath://html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]
User Can view Added Owners
    page should contain              ${OwnerPage}
User on the Existed Owners page
    Wait Until Element Is Visible     xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[4]/td[1]/a
    click element                    xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a
    element should contain           xpath://html/body/app-root/app-owner-detail/div/div/h2[1]   Owner Information

User selects the PetTypes
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a/span[2]
    click element               xpath://html/body/app-root/app-pettype-list/div/div/div/button[2]
    input text                  xpath://*[@id="name"]     Fish
    click button               xpath://html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/form/div[2]/div/button

User clicks the Owners
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a/span
    Mouse Down                   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a/span[2]
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span[2]

User on the Owners information page
    page should contain              Pets and Visits

User can add a pet to the specified owner
    click button                     xpath://html/body/app-root/app-owner-detail/div/div/button[3]
    input text                       xpath://html/body/app-root/app-pet-add/div/div/form/div[3]/div/input       parrot
    input text                       xpath://html/body/app-root/app-pet-add/div/div/form/div[4]/div/input      2021/01/01
    Mouse Down                       xpath://html/body/app-root/app-pet-add/div/div/form/div[5]/div/div/select
    click element                    xpath://html/body/app-root/app-pet-add/div/div/form/div[5]/div/div/select/option[5]
    click button                     xpath://html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]
    sleep                            3
    page should contain element      xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl  Name
User can add another pet to the specified owner
    click button                     xpath://html/body/app-root/app-owner-detail/div/div/button[3]
    input text                       xpath://html/body/app-root/app-pet-add/div/div/form/div[3]/div/input       leo
    input text                       xpath://html/body/app-root/app-pet-add/div/div/form/div[4]/div/input      2021/01/01
    Mouse Down                       xpath://html/body/app-root/app-pet-add/div/div/form/div[5]/div/div/select
    click element                    xpath://html/body/app-root/app-pet-add/div/div/form/div[5]/div/div/select/option[5]
    click button                     xpath://html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]
    sleep                            2
    page should contain element      xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/dd[1]    leo
End Web Test
  close all browsers



*** Test Cases ***
User can add a new Owner and pets
      [Documentation]   This test adds a new owner and pets
      [Tags]            Add a new owner and a new pet
     Given User on the Infotivpetclinic homepage
     User selects the Owners
     User on the New Owners page
     User enters valid details
     User clicks the Add Owner
     User Can view Added Owners
     User clicks the Owners
     User on the Existed Owners page
     User on the Owners information page
     User can add a pet to the specified owner
     User can add another pet to the specified owner
     End Web Test





