*** Settings ***
Documentation       This file contains test cases for add valid patient
Resource      ../Resource/Base/Common_Functionalities.Resource
Library     DataDriver      file=../test_data/Home_Data.xlsx      sheet_name=Patient_Details
Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser
Test Template           add valid patient tamplate
*** Test Cases ***
TC1
TC2
TC3
*** Keywords ***
add valid patient tamplate
      [Arguments]     ${User}     ${Pass}     ${languageChoice}      ${fname}       ${mname}
      ...     ${lname}       ${suffix}      ${DOB}     ${sex}     ${expected_data}
      Input Text    name=authUser    ${User}
      Input Password    name=clearPass    ${Pass}
      Select From List By Label    name=languageChoice        ${languageChoice}
      Click Element    id=login-button
      Mouse Over    xpath=//div[@class='menuLabel px-1 dropdown-toggle oe-dropdown-toggle']
      Click Element    xpath=//div[text()='New/Search']
      Select Frame    xpath=//iframe[@name='pat']
      Input Text    id=form_fname    ${fname}
      Input Text    id=form_mname    ${mname}
      Input Text    id=form_lname    ${lname}
      Input Text    id=form_suffix     ${suffix}
      Input Text    name=form_DOB    ${DOB}
      Select From List By Label    name=form_sex      ${sex}
      Click Element    id=create
      Unselect Frame
      Select Frame    xpath=//iframe[@id='modalframe']
      Click Element    xpath=//input[@onclick='dlgclose("srcConfirmSave", false);']
      Sleep    15s
      ${alert_text}    Handle Alert   action=ACCEPT
      Log To Console     ${alert_text}
      Select Frame    xpath=//iframe[@name='pat']
      Element Should Contain    xpath=//h2[contains(text(),'Medical Record Dashboard')]       ${expected_data}