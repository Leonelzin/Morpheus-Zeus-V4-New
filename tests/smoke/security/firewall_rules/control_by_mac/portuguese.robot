*** Settings ***
Library             Browser
Library             String
Resource            ../../../../../resources/common/common_resources.resource
Resource            ../../../../../resources/fiber/fiber.resource
Resource            ../../../../../resources/smoke/pages/security/firewall_rules/firewall_rules.resource
Resource            ../../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese

Force Tags          lang-pt    firewall-rules    control-by-mac


*** Test Cases ***
DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings

Factory Default settings for control by mac are correct
    [Tags]    robot:continue-on-failure    smoke
    Access security firewall rules settings page

    Block MAC traffic button text should be "Bloquear tráfego"

    #Description input title should be "Descrição"
    Description input in control by MAC should be enabled

    #MAC address input title should be "Endereço MAC"
    MAC address input should be enabled

    ${block_header_default}=    Set Variable    Bloquear
    ${description_header_default}=    Set Variable    Descrição 
    ${mac_header_default}=    Set Variable    MAC
    Control by MAC table headers should be    ${block_header_default}    ${description_header_default}    ${mac_header_default}   

    Create firewall rule

    Block checkbox present in the mac table should be enabled

    Description input text of present in the mac table should be ""
    Description input text of present in the mac table should be enabled

    MAC input text of present in the mac table should be ""
    MAC input text of present in the mac table should be enabled

    Delete MAC settings button should be visible

    (Control by MAC) Rows per page select title should be "Linhas por página"
    (Control by MAC) Rows per page select for pagination should be "1\n2\n3\n4\n5\n6\n7\n8\n9\n10"
    (Control by MAC) Rows per page select should be enabled

    (Control by MAC) Pagination number text should be "1 - 1 de 1"

    (Control by MAC) Pagination button before should be visible
    (Control by MAC) Pagination button after should be visible

    Discard saved settings
    [Teardown]    No operation
