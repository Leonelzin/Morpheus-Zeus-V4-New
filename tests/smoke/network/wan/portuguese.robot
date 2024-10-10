*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/common/common_variables.resource
Resource            ../../../../resources/smoke/pages/network/wan.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access WAN network settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access WAN network settings page

Force Tags          lang-pt    network    wan    wip


*** Test Cases ***
Factory Default settings for network WAN are correct (bridge)
    [Tags]    robot:continue-on-failure    smoke
    [WAN] pop up title should be "Aviso"
    [WAN] pop up text should be "Esta funcionalidade está disponível apenas quando o modo de operação for roteador."
    [WAN] button text should be "Fechar"
    Close WAN pop up
    [Teardown]    No operation

DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings

Factory default IPv4 settings WAN are correct
    [Tags]    robot:continue-on-failure    smoke
    Access WAN network settings page

    Page inner title WAN page should be "WAN"

    IPv4 configuration type select title should be "Tipo de configuração"
    IPv4 configuration type select option should be "Cliente DHCP"

    MTU input text should be "1500"

    Select IPv4 configuration type "IP Estático"
    IPv4 address input title should be "Endereço IPv4"
    Value of the IPv4 should be
    ...    [a-zA-Z0-9_]+
    IPv4 address input should be enabled

    Subnet mask input title should be "Máscara de Sub-rede"
    Value of the mask should be
    ...    [a-zA-Z0-9_]+
    Subnet mask input should be enabled

    Gateway IPv4 input title should be "Gateway"
    Value of the gateway IPv4 should be
    ...    [a-zA-Z0-9_]+
    Gateway IPv4 input should be enabled

    Select IPv4 configuration type "PPPoE"
    MPPE toggle text should be "MPPE"
    MPPE toggle should be disabled

    Service name input title should be "Nome do serviço"
    Service name input text should be ""
    Service name input should be enabled

    User input title should be "Usuário"
    User input text should be ""
    User input should be enabled

    Password input title should be "Senha" for WAN screen
    Password input text should be ""
    Password input should be enabled for WAN screen
    Password revealer should be visible for WAN screen

    Clone MAC address toggle text should be "Clonar endereço MAC"
    Clone MAC address toggle should be disabled

    MTU input title should be "MTU"
    MTU input should be enabled
    
    VLAN toggle text should be "VLAN" for WAN screen
    VLAN toggle should be disabled for WAN screen
    
    Save settings button text WAN should be "Salvar"
    [Teardown]    No operation

Validation of hidden elements on the WAN page (ipv4)
    [Tags]    robot:continue-on-failure    smoke
    Enable MAC address toggle
    MAC address input title should be "Endereço MAC"
    Value of the MAC address should be
    ...    [a-zA-Z0-9_]+
    MAC address input should be enabled

    Enable VLAN toggle for WAN screen
    VLAN input title should be "VLAN ID"
    VLAN input should be enabled
    [Teardown]    No operation

Three network WAN (IPv4) configuration types are available: Static IP, DHCP client & PPPoE
    [Tags]    robot:continue-on-failure    smoke
    There should be "3" IPv4 configuration type available
    IPv4 configuration type "IP Estático" should be available
    IPv4 configuration type "Cliente DHCP" should be available
    IPv4 configuration type "PPPoE" should be available
    [Teardown]    No operation

Factory default IPv6 settings WAN are correct
    [Tags]    robot:continue-on-failure    smoke
    Open IPv6 settings

    Link local title should be "Link-local:"
    Link local text should be "Salve e aplique as alterações para que o link local apareça."

    IPv6 configuration type select title should be "Tipo de configuração"
    IPv6 configuration type select option should be "Automático"

    Select IPv6 configuration type "Manual"

    IPv6 address input title should be "Endereço IPv6"
    IPv6 address input text should be ""
    IPv6 address input should be enabled

    Prefix length input title should be "Tamanho do prefixo"
    Prefix length input text should be ""
    Prefix length input should be enabled
    
    Gateway IPv6 input title should be "Gateway"
    Gateway IPv6 input text should be "::"
    Gateway IPv6 input should be enabled

    Save settings button text WAN should be "Salvar"
    [Teardown]    No operation

Four network WAN (IPv6) configuration types are available: Disabled, Manual, Automatic & Link-local
    [Tags]    robot:continue-on-failure    smoke
    There should be "4" IPv6 configuration type available
    IPv6 configuration type "Desativado" should be available
    IPv6 configuration type "Manual" should be available
    IPv6 configuration type "Automático" should be available
    IPv6 configuration type "Link-local" should be available

    Discard saved settings
    [Teardown]    No operation
