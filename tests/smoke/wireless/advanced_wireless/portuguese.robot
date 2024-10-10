*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/wireless/advanced_wireless.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Advanced Wireless settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Advanced Wireless settings page

Force Tags          lang-pt    advanced-wireless   


*** Test Cases ***
Factory Default settings for advanced wireless are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title advanced wireless should be "Wireless Avançado"
    Page inner subtitle advanced wireless should be "Funcionalidades extras da interface Wireless"

    Wireless Roaming title should be "Wireless Roaming"

    Open Wireless Roaming info
    Wireless Roaming text info should be "O AP irá sugerir a transição para os dispositivos quando for conveniente e ocorrerá apenas entre os APs que possuem o mesmo nome de rede wireless. Opera somente em SSIDs com criptografia WPA (WPA - PSK) ou WPA2 (WPA2 - PSK), e requer que o dispositivo do cliente tenha suporte a este protocolo. Alguns dispositivos legados (antigos) podem apresentar problemas de conexão."
    Button info text should be "OK"
    Close Wireless Roaming info

    Assisted Roaming toggle should be enabled
    Assisted Roaming toggle text should be "Habilitar Assisted Roaming (802.11k e 802.11v)"
    
    Fast Roaming toggle should be disabled
    Fast Roaming toggle text should be "Habilitar Fast Roaming (802.11r)"
    
    Smart Handover title should be "Smart Handover"

    Open Smart Handover info
    Smart Handover text info should be "AP irá gerenciar a transição dos dispositivos de forma ativa, com base nas métricas de rede e qualidade do sinal. Ao habilitar a função Smart Handover seu AP ficará indisponível por alguns minutos para a configuração da estrutura de rede. Este tempo pode variar de 1 a 5 minutos, de acordo com a configuração da sua rede. Ativando o Smart Handover, as funções \"Mínimo sinal do cliente\" e \"Ocultar SSID\" passarão a ser controladas pela função Smart Handover.\n\nObservações\n\n- O Handover ocorrerá apenas entre APs que possuírem o mesmo nome de rede wireless.\n\n- Apenas um dos APs da rede esteja configurado como Principal."
    Button info text should be "OK"
    Close Smart Handover info

    Smart Handover toggle should be disabled
    Smart Handover toggle text should be "Habilitar Smart Handover"

    Define AP toggle should be disabled
    Define AP toggle text should be "Definir este AP como principal"
    Define AP toggle legend text should be "Certifique-se que apenas um AP esteja configurado como principal"

    Band Steering title should be "Band Steering"

    Open Band Steering info
    Band Steering text info should be "AP irá escolher a melhor frequência para o cliente baseado em métricas de rede e qualidade de sinal e ocorrerá apenas entre redes wireless que possuem o mesmo nome.\n\nBalanceamento de clientes entre frequências: o AP irá otimizar a utilização da rede realizando o balanceamento de carga entre as frequências 2.4 GHz e 5 GHz.\n\nPreferencialmente 5 GHz: os clientes com suporte 802. 11ac terão preferência para conexão em 5 GHz. Isto não garante, porém, que eles não sejam migrados para a interface 2.4 GHz devido à outros fatores (sinal e utilização da rede)."
    Button info text should be "OK"
    Close Band Steering info
    
    Band Steering toggle should be enabled
    Band Steering toggle text should be "Habilitar"

    Band Steering select title should be "Método"
    Band Steering select should be enabled
    
    Open Band Steering selection dropdown menu
    Select Band Steering "Balanceamento de clientes entre frequências"

    Multi-User MIMO title should be "Multi-User MIMO (MU-MIMO)"
    
    Open Multi-User MIMO info
    Multi-User MIMO text info should be "MU-MIMO garante maior performance aos clientes conectados na rede, realizando múltiplas transmissões de dados para clientes simultaneamente.\n\nAtenção: O MU_MIMO requer que o dispositivo do cliente tenha suporte a esta tecnologia para atuar ativamente."
    Button info text should be "OK"
    Close Multi-User MIMO info
    
    Multi-User MIMO toggle should be enabled
    Multi-User MIMO toggle text should be "Habilitar"

    Beamforming title should be "Beamforming"
    
    Open Beamforming info
    Beamforming text info should be "O Beamforming garante que o sinal do Wi-Fi seja redirecionado para dispositivos específicos dos clientes, evitando perdas durante o processo de transmissão e melhorando o nível de sinal na área de 360ºao redor do AP."
    Button info text should be "OK"
    Close Beamforming info
    
    Beamforming toggle should be enabled
    Beamforming toggle text should be "Habilitar"
    [Teardown]    No operation

DUT configuration for router mode
    [Tags]    robot:continue-on-failure    smoke
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings
    Confirm saved settings

Factory Default settings for advanced wireless router mode are correct
    [Tags]    robot:continue-on-failure    smoke
    Access Advanced Wireless settings page

    Smart Handover title should be not visible
    Smart Handover info should be not visible
    Smart Handover toggle should be not visible
    
    Define AP toggle should be not visible
    Define AP toggle legend text should be not visible

    Discard saved settings
    [Teardown]    No operation

Two Band Steering methods are available: Balance of clients between frequencies & Preferably 5 GHz
    [Tags]    smoke
    There should be "2" band steering available
    Band Steering "Balanceamento de clientes entre frequências" should be available
    Band Steering "Preferencialmente 5 GHz" should be available
    [Teardown]    No operation
