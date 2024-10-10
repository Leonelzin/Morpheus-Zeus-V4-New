*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access network operation mode settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access network operation mode settings page

Force Tags          lang-pt    network    opmode    operation-mode


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    ${dut_hostname}    fiber.Get DUT hostname

    Page inner title should be "Modo de operação"

    Equipment name input title should be "Nome do equipamento"
    Equipment name input should be enabled
    Equipment name should be "${dut_hostname}"

    Network operation mode select title should be "Modo de operação"
    Network operation mode select option should be "Bridge"

    Save settings button text should be "Salvar"
    [Teardown]    No operation

Two network operation modes are available: bridge and router
    [Tags]    robot:continue-on-failure    smoke
    There should be "2" network operation modes available
    Network operation mode "Bridge" should be available
    Network operation mode "Roteador" should be available

NAT option is visible only when network operation mode is router
    [Tags]    smoke
    Select network operation mode "Roteador"
    NAT enable toggle should be visible
    NAT enable toggle switch text should be "Habilitar NAT"
    NAT enable toggle switch should be on

    Select network operation mode "Bridge"
    NAT enable toggle should not be visible
    [Teardown]    No operation