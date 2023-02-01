*** Settings ***
Documentation       This file contains test cases related to invalid login
Resource         ../Resource/Base/Common_Functionalities.Resource
Library     DataDriver      file=../test_data/Home_Data.xlsx      sheet_name=Invalid_Login
Test Setup          Launch Browser and Navigate To Url
Test Teardown     Close Browser
Test Template       Invalid login template

*** Test Cases ***
TC1

*** Keywords ***
Invalid login template
    [Arguments]     ${User}     ${Pass}     ${languageChoice}      ${expected_error}
    Input Text     name=authUser    ${User}
    Input Password    name=clearPass    ${Pass}
    Select From List By Label  name=languageChoice        ${languageChoice}
    Click Element    id=login-button
    Element Should Contain    xpath=//div[contains(text(),'Invalid username or password')]      ${expected_error}