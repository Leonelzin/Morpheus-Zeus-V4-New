*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/smoke/pages/system/log.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=spanish
...                     AND    Access system log settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=spanish
...                     AND    Access system log settings page

Force Tags          lang-es    log


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Registro del sistema"
    Page inner subtitle should be "Registro de ocurrencias del sistema"

    Level select title should be "Nivel"
    Level select option should be "Debug"

    Remote logging toggle switch text should be "Enviar registro al servidor remoto"
    Remote logging toggle switch should be off

    Remote server input title should be "Servidor remoto (FQDN)"
    Remote server input should be disabled
    Remote server input should be "${empty}"

    Port input title should be "Puerto"
    Port input should be disabled
    Port input should be "${empty}"
    Port input placeholder should be "514"

    Save settings button text should be "GUARDAR"

Four logging levels are available: error, warning, info and debug
    [Tags]    robot:continue-on-failure    smoke
    There should be "4" logging levels available
    Logging level "Error" should be available
    Logging level "Warning" should be available
    Logging level "Info" should be available
    Logging level "Debug" should be available

Validate form interaction after enabling watchdog service
    [Tags]    robot:continue-on-failure    smoke
    Enable remote logging
    Remote server input should be enabled
    Port input should be enabled
