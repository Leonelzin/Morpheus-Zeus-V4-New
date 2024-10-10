*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/smoke/pages/network/dhcp.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese

Force Tags          lang-pt    network    dhcp


*** Test Cases ***
Factory default settings for DHCP are correct
    [Tags]    robot:continue-on-failure    smoke
    Access network DHCP settings page

    Page inner title should be "Servidor DHCP"

    Disable cache DHCP enable toggle
    Open DHCP server modal 
    Wait until DHCP server modal is displayed
    
    DHCP server modal text should be "Não é possível habilitar o servidor DHCP pois a LAN está configurada para receber IP dinamicamente."
    DHCP server modal button should be "OK"
    Close DHCP server modal

    DHCP enable toggle switch should be off

    DHCP enable toggle switch text should be "Habilitar servidor DHCP"

    DNS rebind attack protection toggle switch should not be visible

    DHCP pool initial IPv4 address input should not be visible
    DHCP pool final IPv4 address input should not be visible
    DHCP pool lease time input should not be visible

    MAC-IP bind table should not be visible
    [Teardown]    No operation
