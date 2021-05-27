*** Settings ***
Documentation   Test Home-Button
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
Owner Page
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a
    page should contain         Owners
Owner George Franklin
    click element               xpath://html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a
    page should contain         Owner Information
Check and click home button
    page should contain button   Home
    click button                 Home
    page should contain          Welcome to Petclinic
End Web Test
    Close Browser

*** Test Cases ***
User test if home button exist on pet types pages
    [Documentation]         Check if Home button exist on pet types page
    [Tags]                  PB-87
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[4]/a
    page should contain         Pet Types
    Check and click home button

User test if home button exist on Specialties page
    [Documentation]         Check if Home button exist on Specialities page
    [Tags]                  PB-87
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a
    page should contain         Specialties
    Check and click home button
#User test if home button exist on Edit Specialties page
   # [Documentation]         Check if Home button exist on Edit Specialties page
   # [Tags]                  PB-87
   # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[5]/a
   # click element               xpath://*[@id="specialties"]/tbody/tr[1]/td[2]/button[1]
   # page should contain         Edit Specialty
   # Check and click home button
#User test if home button exist on Owners add page
   # [Documentation]         Check if Home button exist on Owners add page
   # [Tags]                  PB-87
   # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a
   # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a
   # wait until page contains    New Owner
   # page should contain         New Owner
   # Check and click home button
#User test if home button exist on Owners all page
    # [Documentation]         Check if Home button exist on Owners all page
    # [Tags]                  PB-87
    # Owner Page
    # Check and click home button
#User test if home button exist on Veterinarians add page
    # [Documentation]         Check if Home button exist on Veterinarians page
    # [Tags]                  PB-87
    # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[2]/a
    # page should contain         New Veterinarian
    # Check and click home button
User test if home button exist on Veterinarians all page
    [Documentation]         Check if Home button exist on Veterinarians all page
    [Tags]                  PB-87
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
    page should contain         Veterinarians
    Check and click home button
#User test if home button exist on Edit Veterinarian page
    # [Documentation]         Check if Home button exist on Edit Veterinarian page
    # [Tags]                  PB-87
    # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/a
    # click element               xpath://html/body/app-root/div[1]/nav/div/ul/li[3]/ul/li[1]/a
    # click element               xpath://*[@id="vets"]/tbody/tr[1]/td[3]/button[1]
    # Check and click home button
#User test if home button exist on Owner Information
    # [Documentation]         Check if Home button exist on Owner information page
    # [Tags]                  PB-87
    # Owner Page
    # Owner George Franklin
    # Check and click home button
#User test if home button exist on Edit Owner
    # [Documentation]         Check if Home button exist on Edit Owner
    # [Tags]                  PB-87
    # Owner Page
    # Owner George Franklin
    # click button           Edit Owner
    # Check and click home button
#User test if home button exist on Owner Add New Pet
    # [Documentation]         Check if Home button exist on Owner Add New Pet
    # [Tags]                  PB-87
    # Owner Page
    # Owner George Franklin
    # click button           Add New Pet
    # page should contain     Add Pet
    # Check and click home button
#User test if home button exist on Edit Pet page
    # [Documentation]         Check if Home button exist on Edit Pet page
    # [Tags]                  PB-87
    # Owner Page
    # Owner George Franklin
    # click element           xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[1]
    # page should contain      Pet
    # Check and click home button
#User test if home button exist on Add Visits for Pet page
    # [Documentation]         Check if Home button exist on Add Visits for Pet page
    # [Tags]                  PB-87
    # Owner Page
    # Owner George Franklin
    # click element           xpath://html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[3]
    # page should contain     New Visit
    # Check and click home button

