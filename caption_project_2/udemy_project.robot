*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
TC1
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...    platformName=android
    ...    deviceName=realme7i
    ...    app=C:${/}Users${/}40032476${/}Downloads${/}udemy-9-1-0.apk
    #...    noReset=true
    Set Appium Timeout    30s

    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Sign In']
    Click Element    xpath=//android.widget.Button[@text='Sign In']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Sign in with email']
    Click Element    xpath=//android.widget.TextView[@text='Sign in with email']

    Wait Until Page Contains Element    xpath=//android.widget.EditText[@text='Email']
    Click Element    xpath=//android.widget.EditText[@text='Email']
    Input Text    xpath=//android.widget.EditText[@text='Email']    jaswanthjaswanth2000@gmail.com

    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Next']
    Click Element    xpath=//android.widget.Button[@text='Next']

    Wait Until Page Contains Element    xpath=//android.widget.EditText[@text='Password (8+ characters)']
    Click Element    xpath=//android.widget.EditText[@text='Password (8+ characters)']
    Input Text    xpath=//android.widget.EditText[@text='Password (8+ characters)']    Jassu@133

    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Sign In']
    Click Element    xpath=//android.widget.Button[@text='Sign In']

    Run Keyword And Ignore Error      Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Skip']
    Run Keyword And Ignore Error      Click Element    xpath=//android.widget.Button[@text='Skip']

    ${count}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text='IT & Software']
    WHILE    ${count}==0
          Swipe By Percent    90    75    90    25
        ${count}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text='IT & Software']
    END
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='IT & Software']
    Click Element    xpath=//android.widget.TextView[@text='IT & Software']

    ${count}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Hardware']
    WHILE    ${count}==0
          Swipe By Percent    90    75    90    25
        ${count}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Hardware']
    END
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Hardware']
    Click Element    xpath=//android.widget.TextView[@text='Hardware']

    ${count}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Embedded Systems']
    WHILE    ${count}==0
          Swipe By Percent    90    75    90    25
        ${count}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Embedded Systems']
    END
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Embedded Systems']
    Click Element    xpath=//android.widget.TextView[@text='Embedded Systems']

    Wait Until Page Contains Element    xpath=(//android.widget.ImageView[@resource-id='com.udemy.android:id/course_image'])[1]
    Click Element    xpath=(//android.widget.ImageView[@resource-id='com.udemy.android:id/course_image'])[1]

    Element Should Contain Text    xpath=//android.widget.TextView[@resource-id='com.udemy.android:id/course_title']    Mastering Microcontroller and Embedded Driver Development





    [Teardown]     Close Application