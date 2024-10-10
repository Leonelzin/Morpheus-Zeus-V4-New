*** Settings ***
Library             OperatingSystem
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/system/management.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page

Force Tags          lang-pt    management    mgmt    http    https    ssh    vlan


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Gerenciamento do sistema"
    Page inner subtitle should be "HTTP, HTTPS, SSH e VLAN"

    Session time input title should be "Tempo de sessão (segundos)"
    Session time should be "3600"

    HTTP settings tab should be open

    Save settings button text should be "SALVAR"

    [Teardown]    No operation
