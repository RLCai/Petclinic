*** Settings ***
Documentation                Testar Selenium och RobotFramework
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200/
${Firstname}            wasim
${Lastname}             El-jomaa
${FirstnameNum}         123456
${LastnameNumm}         654321
${FirstnameToEmtyType}  Maria
${LastnameToEmtyType}   Andersson
${FirstnameToDel}       Nora
${LastnameToDel}        Johson


#-------------------------------------------------------------------------------------------


*** Keywords ***
Suite settings
    Set Selenium Timeout                    5 seconds

Begin Web Test
    Open browser                            about:blank   ${BROWSER}
    Maximize Browser Window
    Load Page



Load Page
    Go to                                  ${URL}
Verify Page Loaded
    Wait Until Page Contains        SpringPetclinicAngular

#____________________________________________________________
#test 1
Given that the user is on the landing page

   Verify Page Loaded
When a user Creates a new Veterinarian right data

    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
    wait until page contains       New Veterinarian
    Input Text                     id=firstName            ${Firstname}
    Input Text                     id=lastName             ${Lastname}

    Click Element                  xpath://*[@id="specialties"]/option[2]
    Click Element                  xpath://*[@id="vet"]/div[5]/div/button[2]

Then a new Veterinarian should be created
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
    wait until page contains       Veterinarians
    page should contain             ${Firstname}
    page should contain             ${Lastname}
    page should contain             surgery
    click button                   xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
    page should not contain             ${Firstname}
    page should not contain             ${Lastname}

#test 2 -------------------------------------------------------------------------------------------
When a user creates a new Veterinarian with variables instead of letters and Veterinarian empty

    Click Element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
    wait until page contains    New Veterinarian
    Input Text                  id=firstName            ${FirstnameNum}
    Input Text                  id=lastName             ${LastnameNumm}
    Click Element               xpath://*[@id="vet"]/div[5]/div/button[2]


Then a new fel Veterinarian should be added to the list
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
    wait until page contains       Veterinarians
    page should contain             ${FirstnameNum}
    page should contain             ${LastnameNumm}
    wait until element is visible  xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
    click button                   xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
    page should not contain             ${FirstnameNum}
    page should not contain             ${LastnameNumm}

#test 3 ------------------------------------------------------------------------------------
When the user Creates duplicate a new Veterinarian
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
    wait until page contains       New Veterinarian

And put already existing personal data
    Input Text                     id=firstName            ${Firstname}
    Input Text                     id=lastName             ${Lastname}
    Click Element                  xpath://*[@id="specialties"]/option[2]
    Click Element                  xpath://*[@id="vet"]/div[5]/div/button[2]
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
    wait until page contains       New Veterinarian
    Input Text                     id=firstName            ${Firstname}
    Input Text                     id=lastName             ${Lastname}
    Click Element                  xpath://*[@id="specialties"]/option[2]
    Click Element                  xpath://*[@id="vet"]/div[5]/div/button[2]


Then a duplicate of the Veterinarian should be added
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
    wait until page contains       Veterinarians
    page should contain             ${Firstname}
    page should contain             ${Lastname}

   wait until element is visible  xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
   click button                   xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
   wait until element is visible  xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
   click button                   xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]

   page should not contain             ${Firstname}
   page should not contain             ${Lastname}

#--------------------------------------------------------------------------------------------------
#test 4


When the user Creates a new Veterinarian with empty type

    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
    wait until page contains       New Veterinarian

    Input Text                     id=firstName            ${FirstnameToEmtyType}
    Input Text                     id=lastName             ${LastnameToEmtyType}
    Click Element                  xpath://*[@id="vet"]/div[5]/div/button[2]

Then a new Veterinarian with empty type should be created
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
    wait until page contains       Veterinarian
    page should contain             ${FirstnameToEmtyType}
    page should contain             ${LastnameToEmtyType}
    wait until element is visible  xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
    click button                   xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]


    page should not contain             ${FirstnameToEmtyType}
    page should not contain             ${LastnameToEmtyType}
#Test 5-----------------------------------------------------------------------------------------------
When the user delete Veterinarian
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    Click Element                  xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a/span[2]
    wait until page contains       New Veterinarian
    Input Text                     id=firstName            ${FirstnameToDel}
    Input Text                     id=lastName             ${LastnameToDel}

    Click Element                  xpath://*[@id="specialties"]/option[2]
    Click Element                  xpath://*[@id="vet"]/div[5]/div/button[2]

    wait until element is visible  xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
    click button                   xpath://*[@id="vets"]/tbody/tr[7]/td[3]/button[2]
Then a delete Veterinarian should not be seen in list
    page should not contain                 ${FirstnameToDel}
    page should not contain                 ${LastnameToDel}

#Test 6---------------------------------------------------------------------------------------------
When the user Uppdate a Veterinarian First Name
  Click Element                           xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
  Click Element                           xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a

  click Element                           xpath://*[@id="vets"]/tbody/tr[1]/td[3]/button[1]
  Input Text           id=firstName       Tommy
  Click Element                           xpath://*[@id="vet_form"]/div[5]/div/button[2]

Then uppdate a Veterinarian First Name should be uppdated
  wait until page contains                Veterinarians
  Wait until page contains                Tommy
  page should contain                     Tommy
#Test7-----------------------------------------------------------------------------------------
When the user Uppdate a Veterinarian Last Name
  Click Element                           xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
  Click Element                           xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
  click Element                           xpath://*[@id="vets"]/tbody/tr[1]/td[3]/button[1]
  Input Text           id=lastName        Nilsson
  Click Element                           xpath://*[@id="vet_form"]/div[5]/div/button[2]

Then uppdate a Veterinarian Last Name should be uppdated
  wait until page contains                Veterinarians
  Wait until page contains                Nilsson
  page should contain                     Nilsson



End Web Test
  Close Browser


*** Test Cases ***
Test add a new Veterinarian
    [Documentation]         Adding a new Veterinarian
    [Tags]                  Test 1 PB-66 Add new Veterinarian
    Given that the user is on the landing page
    When a user Creates a new Veterinarian right data
    Then a new Veterinarian should be created

#________________________________________________________________________________________

Test to insert variables as name and lasname and Veterinarian empty

  [Documentation]         Variables as input for name/lastname
  [Tags]                  Test 2 PB-66 Variables for input text

  Given that the user is on the landing page
  When a user creates a new Veterinarian with variables instead of letters and Veterinarian empty
  Then a new fel Veterinarian should be added to the list
#------------------------------------------------------------------------------------------------
Test to add a Veterinarian that already exist

  [Documentation]         Adding already existing Veterinarian
  [Tags]                  Test 3 PD-66 Add same Veterinarian

  Given that the user is on the landing page
  When the user Creates duplicate a new Veterinarian
  And put already existing personal data
  Then a duplicate of the Veterinarian should be added
#-------------------------------------------------------------------------------------------------
Test to insert firstname and Lastname and empty type
  [Documentation]         Adding empty test to  Veterinarian
  [Tags]                  Test 4 PB-66 Add empty Veterinarian for  input text

  Given that the user is on the landing page
  When the user Creates a new Veterinarian with empty type
  Then a new Veterinarian with empty type should be created
#--------------------------------------------------------------------------------------------------
Test to delelet a Veterinarian
  [Documentation]         To delelet a Veterinarian
  [Tags]                  Test 1 PB-62 to delelet a Veterinarian

  Given that the user is on the landing page
  When the user delete Veterinarian
  Then a delete Veterinarian should not be seen in list

#--------------------------------------------------------------------------------------------------
Test to Uppdate a Veterinarian First Name
  [Documentation]         To uppdate a Veterinarian
  [Tags]                  Test 1 PB-64 to uppdate a Veterinarian

  Given that the user is on the landing page
  When the user Uppdate a Veterinarian First Name
  Then uppdate a Veterinarian First Name should be uppdated

#--------------------------------------------------------------------------------------------------
Test to Uppdate a Veterinarian Last Name
  [Documentation]         To uppdate a Veterinarian
  [Tags]                  Test 2 PB-64 to uppdate a Veterinarian

  Given that the user is on the landing page
  When the user Uppdate a Veterinarian Last Name
  Then uppdate a Veterinarian Last Name should be uppdated



