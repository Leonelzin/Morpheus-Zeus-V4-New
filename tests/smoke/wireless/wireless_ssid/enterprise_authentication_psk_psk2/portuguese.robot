*** Settings ***
Library             Browser
Library             String
Resource            ../../../../../resources/common/common_resources.resource
Resource            ../../../../../resources/fiber/fiber.resource
Resource            ../../../../../resources/smoke/pages/network/operation_mode.resource
Resource            ../../../../../resources/smoke/pages/wireless/wireless_ssid/wireless_ssid_keywords.resource
Resource            ../../../../../resources/smoke/pages/wireless/wireless_ssid/wireless_ssid_variables.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless SSID settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless SSID settings page

Force Tags          lang-pt    wireless-ssid    wpa-wpa2


*** Test Cases ***
Factory Default settings for enterprise authentication wpa-wpa2 are correct
    [Tags]    robot:continue-on-failure    smoke
    [Documentation]    Validation when editing default SSID in wpa and wpa2 enterprise authentication
    Edit default SSID in table

    Page inner subtitle add new network should be "Salvar"
    
    SSID input title should be "Nome da Rede (SSID)"
    Value of the SSID in the input should be
    ...    [a-zA-Z0-9_]+
    SSID placeholder should be "Nome da Rede (SSID)"
    SSID input should be enabled

    Authentication SSID title should be "Autenticação"
    Authentication SSID select should be enabled

    Open Authentication SSID selection dropdown menu
    Select Authentication SSID "WPA"
    Select Authentication SSID "WPA2"

    Cryptography WPA-WPA2 title should be "Criptografia"
    Cryptography WPA-WPA2 select should be enabled

    Open Cryptography WPA-WPA2 selection dropdown menu
    Select Cryptography WPA-WPA2 "AES"
    
    Server Authentication Radius title should be "Autenticação do Servidor RADIUS"
    Radius server registration button should be "Cadastrar"
    ${server_header_default}=    Set Variable    SERVIDOR
    ${server_address_header_default}=    Set Variable    Endereço Do Servidor 
    ${authentication_port_header_default}=    Set Variable    PORTA AUTENTICAÇÃO 
    Radius server table headers should be    ${server_header_default}    ${server_address_header_default}    ${authentication_port_header_default}    

    Open Server selection dropdown menu

    Server select should be enabled
    Select Server "Servidor Exemplo"

    Server address text should be "10.0.0.1"
    Port authentication text should be "1813"

    Frequency toggle text should be "Dual band"
    Frequency toggle should be enabled
    [Teardown]    No operation

One server are available: Example Server
    [Tags]    smoke
    There should be "1" server methods available
    Server "Servidor Exemplo" should be available
    [Teardown]    No operation

Two encryption methods are available: Select and AES
    [Tags]    smoke
    There should be "2" encryption WPA-WPA2 methods available
    Cryptography WPA-WPA2 "Selecione" should be available
    Cryptography WPA-WPA2 "AES" should be available
    [Teardown]    No operation

Five Wireless SSID Authentication are available: Open System, WPA-PSK, WPA2-PSK, WPA & WPA2
    [Tags]    smoke
    There should be "5" authentication SSID available
    Authentication SSID "Sistema Aberto" should be available
    Authentication SSID "WPA-PSK" should be available
    Authentication SSID "WPA2-PSK" should be available
    Authentication SSID "WPA" should be available
    Authentication SSID "WPA2" should be available
    [Teardown]    No operation
