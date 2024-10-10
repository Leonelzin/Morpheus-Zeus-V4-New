*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/services/snmp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=spanish
...                     AND    Access SNMP service settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=spanish
...                     AND    Access SNMP service settings page

Force Tags          lang-es    snmp


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "SNMP"
    Page inner subtitle should be "Protocolo estándar para monitorear y gestionar dispositivos de red"

    SNMP toggle switch text should be "Habilitar SNMP"
    SNMP toggle switch should be off

    Community input title should be "Comunidad"
    Community input should be disabled
    Community should be "public"

    Port input title should be "Puerto"
    Port input should be disabled
    Port should be "161"

    Location input title should be "Ubicación"
    Location input should be disabled
    Location should be "Intelbras - SC - Brasil"

    Contact input title should be "Contacto"
    Contact input should be disabled
    Contact should be "admin@meu_dominio.com.br"

    Name input title should be "Nombre"
    Name input should be disabled
    ${dut_model_name}    fiber.Get DUT model name
    Name should be "${dut_model_name}"

    Save settings button text should be "GUARDAR"

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
