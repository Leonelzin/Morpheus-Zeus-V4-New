*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/services/watchdog.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access watchdog service settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access watchdog service settings page

Force Tags          lang-pt    watchdog


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Watchdog"
    Page inner subtitle should be "Reinicialização automática do equipamento em caso de interrupção na comunicação com outros dispositivos"

    Toggle switch text should be "Habilitar Watchdog"
    Toggle switch should be off

    Address 1 input title should be "Endereço 1"
    Address 1 input should be disabled
    Address 1 should be "192.168.1.1"

    Address 2 input title should be "Endereço 2"
    Address 2 input should be disabled
    Address 2 should be ""

    Check interval input title should be "Tempo de checagem (segundos)"
    Check interval input should be disabled
    Check interval should be "30"

    Save settings button text should be "SALVAR"

Validate form interaction after enabling watchdog service
    [Tags]    robot:continue-on-failure    smoke
    Enable watchdog service
    Address 1 input should be enabled
    Address 1 should be "192.168.1.1"

    Address 2 input should be enabled
    Address 2 should be ""
    Address 2 placeholder should be "Domínio ou endereço IP"

    Check interval input should be enabled
    Check interval should be "30"
    Check interval placeholder should be "20 a 99999"
