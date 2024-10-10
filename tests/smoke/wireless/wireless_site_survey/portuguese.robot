*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/wireless/wireless_site_survey.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless site survey settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless site survey settings page

Force Tags          lang-pt    site-survey


*** Test Cases ***
Checking the title and subtitle of the search screen are factory default
    [Tags]    robot:continue-on-failure    smoke
    Page inner title wireless site survey should be "Site Survey"
    Page inner subtitle wireless site survey should be "Consulta e listagem de redes Wi-Fi próximas."
    [Teardown]    No operation

Factory Default settings for wireless site survey are correct (2GHz)
    [Tags]    robot:continue-on-failure    smoke
    Frequency 2GHz settings button should be visible

    Update Survey settings button text should be "ATUALIZAR"
    Update Survey settings button should be visible
    
    ${channel_header_default}=    Set Variable    Canal
    ${ssid_header_default}=    Set Variable    Ssid
    ${bssid_header_default}=    Set Variable    BSSID
    ${cryptography_header_default}=    Set Variable    Criptografia
    ${signal_header_default}=    Set Variable    Sinal
    Frequency survey 2.4GHz and 5GHz table headers should be    
    ...    ${channel_header_default}    
    ...    ${ssid_header_default}    
    ...    ${bssid_header_default}    
    ...    ${cryptography_header_default}    
    ...    ${signal_header_default}   
    [Teardown]    No operation

Factory Default settings for wireless site survey are correct (5GHz)
    [Tags]    robot:continue-on-failure    smoke
    Conduct survey at 5GHz frequency

    Frequency 5GHz settings button should be visible

    Update Survey settings button text should be "ATUALIZAR"
    Update Survey settings button should be visible

    ${channel_header_default}=    Set Variable    Canal
    ${ssid_header_default}=    Set Variable    Ssid
    ${bssid_header_default}=    Set Variable    BSSID
    ${cryptography_header_default}=    Set Variable    Criptografia
    ${signal_header_default}=    Set Variable    Sinal
    Frequency survey 2.4GHz and 5GHz table headers should be    
    ...    ${channel_header_default}    
    ...    ${ssid_header_default}    
    ...    ${bssid_header_default}    
    ...    ${cryptography_header_default}    
    ...    ${signal_header_default}   
    [Teardown]    No operation
