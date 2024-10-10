*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=spanish
...                     AND    Access network operation mode settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=spanish
...                     AND    Access network operation mode settings page

Force Tags          lang-es    network    opmode    operation-mode


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    ${dut_hostname}    fiber.Get DUT hostname

    Page inner title should be "Modo de operación"

    Equipment name input title should be "Nombre del equipo"
    Equipment name input should be enabled
    Equipment name should be "${dut_hostname}"

    Network operation mode select title should be "Modo de operación"
    Network operation mode select option should be "Puente"

    Save settings button text should be "Guardar"
    [Teardown]    No operation

Two network operation modes are available: bridge and router
    [Tags]    robot:continue-on-failure    smoke
    There should be "2" network operation modes available
    Network operation mode "Puente" should be available
    Network operation mode "Enrutador" should be available

NAT option is visible only when network operation mode is router
    [Tags]    smoke
    Select network operation mode "Enrutador"
    NAT enable toggle should be visible
    NAT enable toggle switch text should be "Habilitar NAT"
    NAT enable toggle switch should be on

    Select network operation mode "Puente"
    NAT enable toggle should not be visible
    [Teardown]    No operation