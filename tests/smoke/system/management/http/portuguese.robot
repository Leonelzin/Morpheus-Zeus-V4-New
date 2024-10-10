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

Force Tags          lang-pt    management    mgmt    http


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    HTTP tab inner title should be "Acesso HTTP"

    HTTP enable checkbox should be checked
    HTTP enable checkbox text should be "Habilitado"

    HTTP brute force attack protection checkbox should be checked
    HTTP brute force attack protection checkbox text should be "Defesa contra ataque de força bruta"

    HTTP port input title should be "Porta"
    HTTP port input placeholder should be "80"
    HTTP port should be "80"
    [Teardown]    No operation
