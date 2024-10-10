*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/network/captive_portal.resource
Resource            ../../../../resources/smoke/pages/network/operation_mode.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access network captive portal settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access network captive portal settings page

Force Tags          lang-pt    captive-portal


*** Test Cases ***
Factory Default settings for network captive portal are correct (bridge)
    [Tags]    robot:continue-on-failure    smoke
    [Captive Portal] pop up title should be "Aviso"
    [Captive Portal] pop up text should be "Esta funcionalidade está disponível apenas quando o modo de operação for roteador."
    [Captive Portal] button text should be "Fechar"
    Close captive portal pop up
    [Teardown]    No operation

Change DUT to router mode
    [Tags]    robot:continue-on-failure 
    Access network operation mode settings page
    Select network operation mode "Roteador"
    Save settings
    [Teardown]    No operation

Factory Default settings for network captive portal are correct (router)
    [Tags]    robot:continue-on-failure    smoke
    Access network captive portal settings page

    Page inner title network captive portal should be "Captive portal"
    Page inner subtitle network captive portal should be "Configuração de autenticação externa de usuários na rede"

    SSID list title should be "Lista de SSID"
    ${enabled_header_default}=    Set Variable    Habilitado
    ${ssid_header_default}=    Set Variable    SSID
    ${frequency_header_default}=    Set Variable    Frequência
    ${authentication_type_header_default}=    Set Variable    Tipo de Autenticação 
    SSID list table headers should be    ${enabled_header_default}    ${ssid_header_default}    ${frequency_header_default}    ${authentication_type_header_default}   
    
    SSID list table should contain entry
    ...    enabled=${false}
    ...    ssid=AP1800AX_4b65 
    ...    frequency=Dual band
    ...    authentication_type=WPA2-PSK

    External Configuration title should be "Configuração Externa"

    #Authenticator input title should be "Endereço de Captive Portal Externo (autenticador)"
    Authenticator input should be ""
    Authenticator input placeholder should be "https://"

    Session time input title should be "Tempo de Sessão"
    Session time input should be "30"

    Open Session time info
    Session time text info should be "Ao expirar o tempo configurado, a sessão será encerrada e o usuário precisará se re-autenticar. O tempo de sessão informado acima só será aplicado quando um intervalo válido não for definido pelo servidor."
    Info button text should be "OK"
    Close Session time info

    Session time select should be enabled
    Open Session time selection dropdown menu
    Select Session time "minutos"

    Downtime input title should be "Tempo de inatividade"
    Downtime input should be "5"

    Open Downtime info
    Downtime text info should be "Limite de inatividade: ao ser detectada a inatividade do usuário no limite configurado, o mesmo terá sua sessão encerrada."
    Info button text should be "OK"
    Close Downtime info

    Downtime select should be enabled
    Open Downtime selection dropdown menu
    Select Downtime "minutos"

    Authentication type select title should be "Tipo de Autenticação"
    Authentication type select should be enabled

    #External authentication type smoke tests
    Open Authentication type selection dropdown menu
    Select Authentication type "Externo"

    Password input title should be "Senha"
    Password revealer for screen captive portal should be visible
    External configuration password input should be ""

    #Radius authentication type smoke tests
    Open Authentication type selection dropdown menu
    Select Authentication type "Radius"

    Click ADD radius settings
    ADD radius settings button text should be "ADICIONAR"

    ${server_header_default}=    Set Variable    Servidor
    ${sever_address_header_default}=    Set Variable    Endereço do Servidor
    ${authentication_port_header_default}=    Set Variable    Porta Authentication
    ${accounting_port_header_default}=    Set Variable    Porta Accounting
    Radius table headers should be    ${server_header_default}    ${sever_address_header_default}    ${authentication_port_header_default}    ${accounting_port_header_default}  
    
    Radius table should contain entry
    ...    server_address=10.0.0.1
    ...    authentication_port=1812
    ...    accounting_port=1813
    
    Open Server selection dropdown menu for captive portal screen
    Server select should be enabled for captive portal screen
    Select Server on captive portal screen should have text "Servidor Exemplo"
    
    Delete radius settings button should be visible

    Walled Garden title should be "Walled Garden"

    Open Walled Garden info
    Walled Garden text info should be "O Zeus OS permite adicionar outros dominios para acesso antes de se autenticar ao Captive Portal Externo através do Walled Garden. Se necessário acessar outro domínio antes da autenticação, é necessário adicionar nessa opção."
    Info button text should be "OK"
    Close Walled Garden info

    ADD walled garden settings button text should be "ADICIONAR"
    Click ADD walled garden settings

    Walled Garden table should contain entry
    ...    address=Endereço   
       
    Walled Garden address input should be ""
    Walled Garden address input placeholder should be "https://"

    ${address_header_default}=    Set Variable    Endereço
    Walled Garden table headers should be    ${address_header_default}    
    
    Delete walled garden settings button should be visible

    Delete captive settings button text should be "Excluir"
    Open delete captive settings
    Delete captive settings text should be "Todas configurações deste CAPTIVE PORTAL EXTERNO serão removidas. Tem certeza que deseja continuar?"
    
    Back button text should be "Voltar"
    Continue button text should be "Continuar"

    Close delete captive settings

    Save button text should be "Salvar"
    [Teardown]    No operation

Three Session time are available: Minutes, Hours and Days
    [Tags]    smoke
    There should be "3" Session time methods available
    Session time "minutos" should be available
    Session time "horas" should be available
    Session time "dias" should be available
    [Teardown]    No operation

Three Downtime are available: Minutes, Hours and Days
    [Tags]    smoke
    There should be "3" Downtime methods available
    Downtime "minutos" should be available
    Downtime "horas" should be available
    Downtime "dias" should be available
    [Teardown]    No operation

Three Authentication Type are available: Externo and Radius
    [Tags]    smoke
    There should be "2" Authentication type methods available
    Authentication type "Externo" should be available
    Authentication type "Radius" should be available
    [Teardown]    No operation

One server are available: Example Server
    [Tags]    smoke
    There should be "1" server methods available for captive portal screen
    Server "Servidor Exemplo" should be available for captive portal screen
    [Teardown]    No operation

Discard changes settings four captive portal smoke
    [Tags]    robot:continue-on-failure 
    Reload
    Discard saved settings
