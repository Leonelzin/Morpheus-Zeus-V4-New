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
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page

Force Tags          lang-pt    management    mgmt    ssh


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Open SSH settings tab
    SSH tab inner title should be "Acesso SSH"

    SSH enable checkbox should be checked
    SSH enable checkbox text should be "Habilitado"

    SSH brute force attack protection checkbox should be checked
    SSH brute force attack protection checkbox text should be "Defesa contra ataque de força bruta"

    SSH port input title should be "Porta"
    SSH port input placeholder should be "22"
    SSH port should be "22"
    [Teardown]    No operation
