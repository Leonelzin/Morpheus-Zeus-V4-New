*** Settings ***
Library             Browser
Library             String
Resource            ../../../../../resources/common/common_resources.resource
Resource            ../../../../../resources/fiber/fiber.resource
Resource            ../../../../../resources/smoke/pages/security/firewall_rules/firewall_rules.resource
Resource            ../../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access security firewall rules settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access security firewall rules settings page

Force Tags          lang-pt    firewall-rules    global


*** Test Cases ***
Factory Default settings for firewall rules are correct (bridge)
    [Tags]    robot:continue-on-failure    smoke
    Pop up screen only in router mode title should be "Aviso"
    Pop up screen only in router mode text should be "Esta funcionalidade está disponível apenas quando o modo de operação for roteador."
    Pop up button text should be "Fechar"
    Close pop up
    [Teardown]    No operation

DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings

Factory Default settings for firewall rules are correct (router)
    [Tags]    robot:continue-on-failure    smoke
    Access security firewall rules settings page

    Firewall rules page inner title should be "Regras de firewall"
    Firewall rules page inner subtitle should be "Configurações de firewall para permissões de tráfego na rede\n"

    Create firewall rules button text should be "Criar regra"

    Save settings firewall rules button text should be "Salvar"

    Discard saved settings
    [Teardown]    No operation
