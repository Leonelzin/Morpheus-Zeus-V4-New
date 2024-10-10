*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/smoke/pages/network/lan_keywords.resource
Resource            ../../../../resources/smoke/pages/network/lan_variables.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=spanish
...                     AND    Access LAN network settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=spanish
...                     AND    Access LAN network settings page

Force Tags          lang-es    network    lan    wip


*** Test Cases ***
Factory default IPv4 settings are correct
    [Tags]    robot:continue-on-failure    smoke    teste1
    Page inner title LAN page should be "LAN"
    Page inner subtitle LAN page should be "Configuración de red local"

    IPv4 settings button text should be "IPv4"

    Automatic IPv4 address toggle title should be "Dirección IP dinámica (automática)"
    Automatic IPv4 address toggle switch should be on
    Open automatic IPv4 address info
    Automatic IPv4 address info modal text should be "Con la dirección IP dinámica habilitada, este equipo recibirá automáticamente una dirección IP del servidor DHCP de la red local. Con la dirección IP dinámica deshabilitada, este equipo será específico para la dirección IP configurada estáticamente.\n\nCon la dirección IP dinámica deshabilitada, se podrá acceder a su AP a través de la dirección IP / configuración alternativa"
    Close automatic IPv4 address info

    Static IPv4 address input title should be "Dirección IP fija (fallback)"
    Static IPv4 address input should be enabled
    Static IPv4 address should be "10.0.0.1"

    IPv4 subnet mask input title should be "Máscara de subred (fallback)"
    IPv4 subnet mask input should be enabled
    IPv4 subnet mask should be "16"

    IPv4 default gateway input title should be "Puerta de enlace predeterminada (fallback)"
    IPv4 default gateway input should be enabled
    IPv4 default gateway should be "10.0.255.254"

    Save settings button text should be "Guardar"
    [Teardown]    No operation

Factory default IPv6 settings are correct
    [Tags]    robot:continue-on-failure    smoke
    IPv6 settings button text should be "IPv6"
    Open IPv6 settings

    IPv6 configuration type select title should be "Tipo de configuración"
    IPv6 configuration type select option should be "Automático"
    
    IPv6 link title should be "Enlace-local:"
    IPv6 link text should not be empty
    
    # TODO: create environment file
    # IPv6 link-local should be "fe80::46d1:faff:fedc:d4f4/64"

    Save settings button text should be "Guardar"
    [Teardown]    No operation

Four network LAN (IPv6) configuration types are available: Desativado, Manual, Automático, Link-local
    [Tags]    robot:continue-on-failure    smoke
    Open IPv6 settings
    There should be "4" LAN IPv6 configuration types available
    IPv6 configuration type "Desativado" should be available
    IPv6 configuration type "Manual" should be available
    IPv6 configuration type "Automático" should be available
    IPv6 configuration type "Link-local" should be available
    [Teardown]    No operation
