*** Settings ***
Library             Browser
Library             String
Resource            ../../../../../resources/common/common_resources.resource
Resource            ../../../../../resources/fiber/fiber.resource
Resource            ../../../../../resources/smoke/pages/network/operation_mode.resource
Resource            ../../../../../resources/smoke/pages/wireless/wireless_ssid/wireless_ssid_keywords.resource
Resource            ../../../../../resources/smoke/pages/wireless/wireless_ssid/wireless_ssid_variables.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless SSID settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless SSID settings page

Force Tags          lang-pt    wireless_global    psk-psk2


*** Test Cases ***
Smoke test for global elements in Wireless SSID menu
    [Tags]    robot:continue-on-failure    smoke    functional    hibrid
    [Documentation]    Valide se todos os elementos globais padrão estão presentes na tela inicial do menu SSID sem fio
    Page inner title Wireless SSID should be "Wireless SSID"
    Page inner subtitle Wireless SSID should be "Configurações de redes sem fio" 
    
    Add SSID settings button should be visible in table
    Add SSID settings button text should be "Adicionar"
    
    Wireless SSID table should be visible
    
    Checkbox header should be "Habilitar" in table
    Checkbox is checked
    
    SSID header should be "Nome da rede (SSID)" in table
    Value of the SSID in the table should be
    ...    [a-zA-Z0-9_]+
    
    Frequency header should be "Frequência" in table
    Frequency should be "Dual band" in table
    
    Delete header should be visible in table

    [Teardown]    No operation

Smoke test for global elements in Edit SSID menu
    [Tags]    robot:continue-on-failure    smoke    functional    hibrid
    [Documentation]    Validate that all global elements are present on the SSID edit menu home screen
    Edit default SSID in table
    Page name in edit ssid page should be "Wireless SSID"
    Page inner subtitle add new network should be "Editar"

    SSID input title should be "Nome da rede (SSID)"
    Value of the SSID in the input should be
    ...    [a-zA-Z0-9_]+
    SSID placeholder should be "Nome da rede (SSID)"
    SSID input should be enabled

    Authentication SSID title should be "Autenticação"
    Authentication SSID select should be enabled

    Open Authentication SSID selection dropdown menu
    Select Authentication SSID "WPA2"

    Cryptography WPA-WPA2 title should be "Criptografia"
    Cryptography WPA-WPA2 select should be enabled

    Frequency toggle text should be "Dual band"
    Frequency toggle should be enabled

    Advanced setting title should be "Configuração avançada"

    Isolate SSID checkbox text should be "Isolar SSID"
    Isolate SSID checkbox should be disabled

    Only Internet checkbox text should be "Somente internet"
    Only Internet checkbox should be disabled

    Hide SSID checkbox text should be "Ocultar SSID"
    Hide SSID checkbox should be disabled

    Isolate customers checkbox text should be "Isolar clientes"
    Isolate customers checkbox should be disabled

    ACL title should be "Modo de controle de acesso"
    ACL select should be enabled

    Open ACL selection dropdown menu
    ACL select should be enabled

    Slider title for clients connected on the 2.4GHz frequency should be "Máximo de clientes conectados 2.4 GHz"
    Slider clients connected on the 2.4GHz frequency should be visible
    Slider input for clients connected on the 2.4GHz frequency should be "128"
    Slider input for clients connected on the 2.4GHz frequency should be enabled

    # Minimum value of the slider for 2.4GHz clients connected should be 1
    # Maximum value of the slider for 2.4GHz clients connected should be 128

    Slider title for clients connected on the 5GHz frequency should be "Máximo de clientes conectados 5 GHz"
    Slider input for clients connected on the 5GHz frequency should be "128"
    Slider input for clients connected on the 5GHz frequency should be enabled
    Slider clients connected on the 5GHz frequency should be visible

    # Minimum value of the slider for 5GHz clients connected should be 1
    # Maximum value of the slider for 5GHz clients connected should be 128

    Slider title for clients signal dBm should be "Mínimo de sinal do cliente (dBm)"
    Slider clients signal dBm should be visible
    Slider input for clients signal dBm should be "-90"
    Slider input for clients signal dBm should be enabled

    # Minimum value of the slider for clients signal dBm should be -100
    # Maximum value of the slider for clients signal dBm should be 0

    Add New Network settings button text should be "Salvar"
    Cancel settings button text should be "Cancelar"

    [Teardown]    No operation