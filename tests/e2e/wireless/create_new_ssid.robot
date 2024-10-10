*** Settings ***
Library             Browser
Resource            ../../../resources/common/common_resources.resource
Resource            ../../../resources/fiber/fiber.resource
Resource            ../../../resources/smoke/pages/first_access/first_access.resource
Resource            ../../../resources/e2e/wireless/create_new_ssid.resource


Suite Setup         Run keywords
...                     Reset DUT settings to factory default if first access password has been changed
...                     AND    Setup browser     url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Clear browser storages
...                     AND    Login to DUT
...                     AND    Log    ${IS_LOGIN_FIRST_ACCESS}
...                     AND    Run Keyword If    '${IS_LOGIN_FIRST_ACCESS}' == '${True}'    Login with first access  
...                     AND    Close atualization modal
...                     AND    Side menu is opened
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Go to DUT login webpage
...                     AND    Login to DUT
...                     AND    Close atualization modal
...                     AND    Side menu is opened

Force Tags          e2e    wireless


*** Test Cases ***
Create new open ssid dual band
    [Tags]    robot:continue-on-failure    e2e
    Go to new wireless SSID page
    Create open ssid "Open_SSID"
    Verify created SSID "Open_SSID"
    [Teardown]    No operation
