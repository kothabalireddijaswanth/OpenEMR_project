*** Settings ***
Documentation       This file contains test cases related to valid login
Resource     ../Resource/Base/Common_Functionalities.Resource
Library     DataDriver      file=../test_data/Home_Data.xlsx      sheet_name=Valid_Login
Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser
Test Template       valid login template

*** Test Cases ***
TC1
*** Keywords ***

valid login template
    [Arguments]     ${User}     ${Pass}     ${languageChoice}
    Input Text    name=authUser    ${User}
    Input Password    name=clearPass    ${Pass}
    Select From List By Label    name=languageChoice        ${languageChoice}
    Click Element    id=login-button
    Click Element    xpath=//div[@class='menuLabel px-1 dropdown-toggle oe-dropdown-toggle']
    Click Element    xpath=//div[text()='New/Search']