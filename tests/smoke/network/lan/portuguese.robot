*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/smoke/pages/network/lan_keywords.resource
Resource            ../../../../resources/smoke/pages/network/lan_variables.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access LAN network settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access LAN network settings page

Force Tags          lang-pt    network    lan    wip


*** Test Cases ***
Factory default IPv4 settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title LAN page should be "LAN"
    Page inner subtitle LAN page should be "Configurações da rede local"

    IPv4 settings button text should be "IPv4"

    Automatic IPv4 address toggle title should be "Endereço IP dinâmico (automático)"
    Automatic IPv4 address toggle switch should be on
    Open automatic IPv4 address info
    Automatic IPv4 address info modal text should be "Com o endereço IP dinâmico habilitado, este equipamento receberá um endereço IP automaticamente do servidor DHCP da rede local.${\n}${\n}Com o endereço IP dinâmico desabilitado, este equipamento ficará vinculado ao endereço IP configurado estaticamente."
    Close automatic IPv4 address info

    Static IPv4 address input title should be "Endereço IP fixo (fallback)"
    Static IPv4 address input should be enabled
    Static IPv4 address should be "10.0.0.1"

    IPv4 subnet mask input title should be "Máscara de sub-rede (fallback)"
    IPv4 subnet mask input should be enabled
    IPv4 subnet mask should be "16"

    IPv4 default gateway input title should be "Gateway padrão (fallback)"
    IPv4 default gateway input should be enabled
    IPv4 default gateway should be "10.0.255.254"

    Save settings button text should be "Salvar"
    [Teardown]    No operation

Factory default IPv6 settings are correct
    [Tags]    robot:continue-on-failure    smoke
    IPv6 settings button text should be "IPv6"
    Open IPv6 settings

    IPv6 configuration type select title should be "Tipo de configuração"
    IPv6 configuration type select option should be "Automático"

    # TODO: create environment file
    # IPv6 link-local title should be visible
    # IPv6 link-local should be "fe80::46d1:faff:fedc:d4f4/64"

    Save settings button text should be "Salvar"
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
