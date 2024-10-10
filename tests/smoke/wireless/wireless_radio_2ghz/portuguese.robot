*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/wireless/wireless_radio_2ghz.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless Radio 2GHz settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless Radio 2GHz settings page

Force Tags          lang-pt    wireless_radio_2ghz


*** Test Cases ***
Factory Default settings for wireless radio 2.4ghz are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title wireless radio 2ghz should be "2.4 GHz"
    Page inner subtitle wireless radio 2ghz should be "Configuração de Rádio"

    Operation Mode select title should be "Modo de operação"
    Operation Mode select should be enabled
    Select Operation Mode "AP"

    IEEE mode select title should be "Modo IEEE"
    IEEE mode select should be enabled
    Select IEEE mode "b/g"

    Country select title should be "País"
    Country select should be enabled
    Select Country "Brasil"

    Open site survey 2.4GHz

    Page inner title wireless site survey 2.4GHz should be "Site Survey 2.4 GHz"

    Update survey 2.4GHz settings button text should be "ATUALIZAR"
    Update survey 2.4GHz settings button should be visible

    ${channel_header_default}=    Set Variable    Canal
    ${ssid_header_default}=    Set Variable    Ssid
    ${bssid_header_default}=    Set Variable    BSSID
    ${cryptography_header_default}=    Set Variable    Criptografia
    ${signal_header_default}=    Set Variable    Sinal
    Frequency survey 2.4GHz table headers should be    
    ...    ${channel_header_default}    
    ...    ${ssid_header_default}    
    ...    ${bssid_header_default}    
    ...    ${cryptography_header_default}    
    ...    ${signal_header_default}   
    
    Close site survey 2.4GHz button text should be "Fechar"
    Close site survey 2.4GHz

    Bandwidth select title should be "Largura de Banda"
    Bandwidth select should be disabled
    
    Channel select title should be "Canal"
    Channel select should be disabled

    Select band and channel button text should be "Selecionar banda e canal"

    Transmission Power (dBm) title should be "Potência de Transmissão (dBm)\n3\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n20"
    Open Transmission Power (dBm) info
    Transmission Power (dBm) text info should be "Ao colocar a potência de transmissão em valores baixos, haverá uma perda de performace no equipamento."
    Close Transmission Power (dBm) info
    
    Save settings button text should be "Salvar"
    [Teardown]    No operation

One Operation mode are available: AP
    [Tags]    smoke
    There should be "1" operation mode available
    Operation Mode "AP" should be available
    [Teardown]    No operation

Three IEEE mode are available: b/g, b/g/n & b/g/n/ax
    [Tags]    smoke
    There should be "3" IEEE mode available
    IEEE mode "b/g" should be available
    IEEE mode "b/g/n" should be available
    IEEE mode "b/g/n/ax" should be available
    [Teardown]    No operation

One Country are available: Brasil
    [Tags]    smoke
    There should be "1" Country available
    Country "Brasil" should be available
    [Teardown]    No operation

Factory Default settings for select band and channel are correct
    [Tags]    robot:continue-on-failure    smoke
    Open select band and channel settings
    Bandwidth and channel title should be "Seleção de Largura de Banda e Canal"

    Bandwidth and channel select title should be "Largura de Banda"
    Bandwidth and channel select should be enabled
    Select Bandwidth and channel "40 MHz"

    Extension channel select title should be "Canal de Extensão"
    Extension channel select should be enabled
    Select Extension channel "Automático"

    Preferably checkbox text should be "Preferencialmente a largura selecionada"
    Preferably checkbox should be enabled

    Wireless Radio 2GHz table should be visible
    
    Channel checkbox should be enabled
    Channel header should be "Canal" in table
    dBm header should be "Limite TX, dBm" in table
    Bandwidth header should be "Largura de Banda Máx." in table
    DFS header should be "DFS" in table

    Channel 1 checkbox should be enabled
    Channel 1 should be "1 (2412 MHz)" in table
    Channel 1 dBm should be "20" in table
    Channel 1 Bandwidth should be "40" in table
    Channel 1 DFS should be "Não" in table

    Channel 2 checkbox should be enabled
    Channel 2 should be "2 (2417 MHz)" in table
    Channel 2 dBm should be "20" in table
    Channel 2 Bandwidth should be "40" in table
    Channel 2 DFS should be "Não" in table

    Channel 3 checkbox should be enabled
    Channel 3 should be "3 (2422 MHz)" in table
    Channel 3 dBm should be "20" in table
    Channel 3 Bandwidth should be "40" in table
    Channel 3 DFS should be "Não" in table

    Channel 4 checkbox should be enabled
    Channel 4 should be "4 (2427 MHz)" in table
    Channel 4 dBm should be "20" in table
    Channel 4 Bandwidth should be "40" in table
    Channel 4 DFS should be "Não" in table

    Channel 5 checkbox should be enabled
    Channel 5 should be "5 (2432 MHz)" in table
    Channel 5 dBm should be "20" in table
    Channel 5 Bandwidth should be "40" in table
    Channel 5 DFS should be "Não" in table

    Channel 6 checkbox should be enabled
    Channel 6 should be "6 (2437 MHz)" in table
    Channel 6 dBm should be "20" in table
    Channel 6 Bandwidth should be "40" in table
    Channel 6 DFS should be "Não" in table

    Channel 7 checkbox should be enabled
    Channel 7 should be "7 (2442 MHz)" in table
    Channel 7 dBm should be "20" in table
    Channel 7 Bandwidth should be "40" in table
    Channel 7 DFS should be "Não" in table
    
    Channel 8 checkbox should be enabled
    Channel 8 should be "8 (2447 MHz)" in table
    Channel 8 dBm should be "20" in table
    Channel 8 Bandwidth should be "40" in table
    Channel 8 DFS should be "Não" in table
    
    Channel 9 checkbox should be enabled
    Channel 9 should be "9 (2452 MHz)" in table
    Channel 9 dBm should be "20" in table
    Channel 9 Bandwidth should be "40" in table
    Channel 9 DFS should be "Não" in table

    Channel 10 checkbox should be enabled
    Channel 10 should be "10 (2457 MHz)" in table
    Channel 10 dBm should be "20" in table
    Channel 10 Bandwidth should be "40" in table
    Channel 10 DFS should be "Não" in table

    Channel 11 checkbox should be enabled
    Channel 11 should be "11 (2462 MHz)" in table
    Channel 11 dBm should be "20" in table
    Channel 11 Bandwidth should be "40" in table
    Channel 11 DFS should be "Não" in table

    Select button text should be "SELECIONAR"
    Close button text should be "FECHAR"
    [Teardown]    No operation

Two Bandwidth and channel are available: 20 MHz & 40 MHz
    [Tags]    smoke
    There should be "2" Bandwidth and channel available
    Bandwidth and channel "20 MHz" should be available
    Bandwidth and channel "40 MHz" should be available
    [Teardown]    No operation

There Extension channel are available: Automático, Acima & Abaixo
    [Tags]    smoke
    There should be "3" Extension channel available
    Extension channel "Automático" should be available
    Extension channel "Acima" should be available
    Extension channel "Abaixo" should be available
    [Teardown]    No operation
