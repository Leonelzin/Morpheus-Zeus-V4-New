*** Settings ***
Library             OperatingSystem
Library             Browser
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/smoke/pages/dashboard/system_card.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access dashboard settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access dashboard settings page 

Force Tags          lang-pt    dashboard    system-card


*** Test Cases ***
Factory default settings are correct dashboard system card
    [Tags]    robot:continue-on-failure    smoke
    Dashboard system section title should be "Sistema"
    
    Dashboard system section hostname title should be "Nome do equipamento\nap1800ax"
    Dashboard system section DUT hostname should be
    ...    [a-zA-Z0-9_]+

    Dashboard system section fw version title should be "Versão de firmware\n4.4.14"
    Dashboard system section fw version should be 
    ...    [a-zA-Z0-9_]+

    Dashboard system section terms title and its enablement of the should be "Termos de Uso\nHabilitado"

    Dashboard system section button title should be "Atualizar"
    [Teardown]    No operation
