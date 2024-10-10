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

Force Tags          lang-pt    firewall-rules    control-by-ip


*** Test Cases ***
DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings

Factory Default settings for control by ip are correct
    [Tags]    robot:continue-on-failure    smoke
    Access security firewall rules settings page

    Access control by IP

    Control by IP checkbox text should be "Controle por IP"
    Control by IP checkbox should be enabled

    Release traffic button text should be "Liberar tráfego"
    Block traffic button text should be "Bloquear tráfego"

    #Description input title should be "Descrição"
    Description input should be enabled

    Protocol select title should be "Protocolo"
    Protocol select should be enabled
    Open Protocol selection dropdown menu
    Select Protocol "TCP/UDP"

    #IP / Network input title should be "IP / Rede"
    IP / Network should be enabled
    Enter IP / Network Address    192.168.0.28/32

    ${enable_header_default}=    Set Variable    Habilitar
    ${description_header_default}=    Set Variable    Descrição 
    ${action_header_default}=    Set Variable    Ação
    ${protocol_header_default}=    Set Variable    Protocolo 
    ${ip_network_header_default}=    Set Variable    IP / Rede 
    Control by IP table headers should be    ${enable_header_default}    ${description_header_default}    ${action_header_default}    ${protocol_header_default}    ${ip_network_header_default}
    
    Create firewall rule

    Enabled checkbox present in the ip table should be enabled

    Description input text of present in the ip table should be ""
    Description input text of present in the ip table should be enabled
    
    Action select present in the ip table should be enabled
    Open Action selection dropdown menu present in the ip table
    Select Action present in the ip table "Liberar"

    Protocol select present in the ip table should be enabled
    Open Protocol selection dropdown menu present in the ip table
    Select Protocol present in the ip table "TCP/UDP"

    IP / Network input text of present in the table should be "192.168.0.28/32"
    IP / Network input text of present in the table should be enabled

    Delete IP settings button should be visible

    (Control by IP) Rows per page select title should be "Linhas por página"
    (Control by IP) Rows per page select for pagination should be "1\n2\n3\n4\n5\n6\n7\n8\n9\n10"
    (Control by IP) Rows per page select should be enabled

    (Control by IP) Pagination number text should be "1 - 1 de 1"

    (Control by IP) Pagination button before should be visible
    (Control by IP) Pagination button after should be visible
    [Teardown]    No operation

Three Protocol are available: TCP/UDP, TCP & UDP
    [Tags]    smoke
    There should be "3" protocol available
    Protocol "TCP/UDP" should be available
    Protocol "TCP" should be available
    Protocol "UDP" should be available
    [Teardown]    No operation

Two Action present in the ip table are available: Release and Block
    [Tags]    smoke
    There should be "2" action present in the ip table available
    Action present in the ip table "Liberar" should be available
    Action present in the ip table "Bloquear" should be available
    [Teardown]    No operation

Three Protocol present in the ip table are available: TCP/UDP, TCP & UDP
    [Tags]    smoke
    There should be "3" protocol present in the ip table available
    Protocol present in the ip table "TCP/UDP" should be available
    Protocol present in the ip table "TCP" should be available
    Protocol present in the ip table "UDP" should be available

    Discard saved settings
    [Teardown]    No operation
