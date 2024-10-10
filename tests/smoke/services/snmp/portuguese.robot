*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/services/snmp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access SNMP service settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access SNMP service settings page

Force Tags          lang-pt    snmp


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "SNMP"
    Page inner subtitle should be "Protocolo padrão para monitoramento e gerenciamento de dispositivos de rede"

    SNMP toggle switch text should be "Habilitar SNMP"
    SNMP toggle switch should be off

    Community input title should be "Comunidade"
    Community input should be disabled
    Community should be "public"

    Port input title should be "Porta"
    Port input should be disabled
    Port should be "161"

    Location input title should be "Localização"
    Location input should be disabled
    Location should be "Intelbras - SC - Brasil"

    Contact input title should be "Contato"
    Contact input should be disabled
    Contact should be "admin@meu_dominio.com.br"

    Name input title should be "Nome"
    Name input should be disabled
    ${dut_model_name}    fiber.Get DUT model name
    Name should be "${dut_model_name}"

    Save settings button text should be "SALVAR"

Validate form interaction after enabling SNMP
    [Tags]    robot:continue-on-failure    smoke
    Enable SNMP

    Community input should be enabled
    Community should be "public"

    Port input should be enabled
    Port should be "161"

    Location input should be enabled
    Location should be "Intelbras - SC - Brasil"

    Contact input should be enabled
    Contact should be "admin@meu_dominio.com.br"

    Name input should be enabled
    ${dut_model_name}    fiber.Get DUT model name
    Name should be "${dut_model_name}"
