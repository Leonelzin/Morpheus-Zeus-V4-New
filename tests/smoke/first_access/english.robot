*** Settings ***
Library             Browser
Resource            ../../../resources/common/common_resources.resource
Resource            ../../../resources/fiber/fiber.resource
Resource            ../../../resources/smoke/pages/first_access/first_access.resource

Suite Setup         Run keywords
...                     Reset DUT settings to factory default if first access password has been changed
...                     AND    Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Go to DUT login webpage
...                     AND    Login with first access credentials
...                     AND    Wait until first access webpage is displayed
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     Go to DUT login webpage
...                     Login with first access credentials
...                     Wait until first access webpage is displayed

Force Tags          lang-en    login    first-access    smoke


*** Test Cases ***
Login form text is correct when chosen language is English
    first_access.Open language selection dropdown menu
    first_access.Select English language
    First access login form should be in English
