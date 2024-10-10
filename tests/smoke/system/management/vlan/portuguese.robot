*** Settings ***
Library             OperatingSystem
Library             Browser
Resource            ../../../../../resources/common/common_resources.resource
Resource            ../../../../../resources/fiber/fiber.resource
Resource            ../../../../../resources/smoke/pages/system/management.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page
...                     AND    Open VLAN settings tab
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page

Force Tags          lang-pt    management    mgmt    vlan


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    VLAN tab inner title should be "VLAN"

    VLAN interface select title should be "Interface"
    VLAN interface select option should be "Desativado"

    VLAN ID input should not be visible
    [Teardown]    No operation

Two options are available for management VLAN: deactivated and ethernet
    [Tags]    robot:continue-on-failure    smoke
    There should be "2" VLAN interfaces available
    VLAN interface "Desativado" select option should be available
    VLAN interface "Ethernet" select option should be available
    [Teardown]    No operation

VLAN ID settings should be visible and editable when user selects ethernet as VLAN interface
    [Tags]    robot:continue-on-failure    smoke
    Select VLAN interface "Ethernet" option

    VLAN ID input should be visible
    VLAN ID input title should be "VLAN de gerência"
    VLAN ID input should be enabled
    VLAN ID should be "1"
    [Teardown]    No operation
