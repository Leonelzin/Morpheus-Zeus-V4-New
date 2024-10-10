*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/services/discovery.resource
#Resource            ../../../resources/pages/network/operation_mode.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access discovery service settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access discovery service settings page

Force Tags          lang-pt    discovery


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Discovery"
    Page inner subtitle should be "O discovery permite ao usuário fazer a descoberta dos equipamentos dentro da rede local, ou pela internet no caso de provedores."

    Toggle switch brute force text should be "Defesa contra ataque de força bruta"
    Toggle switch brute force should be on

    Toggle switch LLDP text should be "Protocolo LLDP"
    Toggle switch LLDP should be on

    Toggle switch CDP text should be "Protocolo CDP"
    Toggle switch CDP should be on

    Toggle switch Intelbras text should be "Protocolo Intelbras"
    Toggle switch Intelbras should be on

    Toggle switch WAN should not be visible
    
    Save changes button text should be "Salvar"
    [Teardown]    No operation


Validate CDP dependency from LLDP 
    [Tags]    robot:continue-on-failure    smoke

    Disable discovery LLDP
    Toggle switch CDP should be off

    Enable discovery LLDP
    Toggle switch LLDP should be on
    Toggle switch CDP should be off

    Disable discovery LLDP
    Toggle switch CDP should be off
    Enable discovery CDP
    Toggle switch LLDP should be on
    Toggle switch CDP should be on
    [Teardown]    No operation

#Validate Discovery WAN when network operation mode is router
#    [Tags]    robot:continue-on-failure    smoke
#    
#    Select network operation mode "Router"
#    Toggle switch WAN should be visible
#    Toggle switch WAN text should be "Permitir Discovery na interface WAN"
#    Toggle switch WAN should be off
#    [Teardown]    Discard saved settings