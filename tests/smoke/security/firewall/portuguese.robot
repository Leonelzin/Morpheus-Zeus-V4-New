*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/security/firewall.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access security firewall settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access security firewall settings page

Force Tags          lang-pt    firewall


*** Test Cases ***
Factory Default settings for firewall are correct (bridge)
    [Tags]    robot:continue-on-failure    smoke
    Firewall page inner title should be "Firewall"
    Firewall page inner subtitle should be "Restrição de acesso nas operações de transmissão ou recepção de dados\n"

    Enable Firewall toggle text should be "Habilitar Firewall"
    Enable Firewall toggle should be enabled

    Firewall security title should be "Segurança"

    Activate all toggle text should be "Ativar todos"
    Activate all toggle should be enabled

    Defense against ICMP Flood attack checkbox text should be "Defesa contra ataque ICMP Flood"
    Defense against ICMP Flood attack checkbox should be enabled
    
    Defense against TCP SYN Flood attack checkbox text should be "Defesa contra ataque TCP SYN Flood"
    Defense against TCP SYN Flood attack checkbox should be enabled

    Defense against UDP Flood attack checkbox text should be "Defesa contra ataque UDP Flood"
    Defense against UDP Flood attack checkbox should be enabled

    Defense against port scanning / Invalid TCP Flags checkbox text should be "Defesa contra escaneamento de portas / Flags inválidas TCP"
    Defense against port scanning / Invalid TCP Flags checkbox should be enabled
    
    Defense against IP Spoofing checkbox text should be "Defesa contra IP Spoofing"
    Defense against IP Spoofing checkbox should be enabled
    
    Defense against invalid packages checkbox text should be "Defesa contra pacotes inválidos"
    Defense against invalid packages checkbox should be enabled

    Save settings firewall button text should be "Salvar"
    [Teardown]    No operation

DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings

Factory Default settings for firewall are correct (router)
    [Tags]    robot:continue-on-failure    smoke
    Access security firewall settings page

    Enable WAN ping checkbox text should be "Habilitar ping na WAN"
    Enable WAN ping checkbox should be disabled

    Enable UPnP checkbox text should be "Habilitar UPnP"
    Enable UPnP checkbox should be enabled

    Discard saved settings
    [Teardown]    No operation
