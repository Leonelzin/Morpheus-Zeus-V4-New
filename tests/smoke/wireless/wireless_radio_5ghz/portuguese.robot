*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/wireless/wireless_radio_5ghz.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless Radio 5GHz settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless Radio 5GHz settings page

Force Tags          lang-pt    wireless_radio_5ghz


*** Test Cases ***
Factory Default settings for wireless radio 5ghz are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title wireless radio 5ghz should be "5 GHz"
    Page inner subtitle wireless radio 5ghz should be "Configuração de Rádio"

    Operation Mode select title should be "Modo de operação"
    Operation Mode select should be enabled
    Select Operation Mode "AP"

    IEEE mode select title should be "Modo IEEE"
    IEEE mode select should be enabled
    Select IEEE mode "a"

    Country select title should be "País"
    Country select should be enabled
    Select Country "Brasil"

    Open site survey 5GHz

    Page inner title wireless site survey 5GHz should be "Site Survey 5 GHz"

    Update survey 5GHz settings button text should be "ATUALIZAR"
    Update survey 5GHz settings button should be visible

    ${channel_header_default}=    Set Variable    Canal
    ${ssid_header_default}=    Set Variable    Ssid
    ${bssid_header_default}=    Set Variable    BSSID
    ${cryptography_header_default}=    Set Variable    Criptografia
    ${signal_header_default}=    Set Variable    Sinal
    Frequency survey 5GHz table headers should be    
    ...    ${channel_header_default}    
    ...    ${ssid_header_default}    
    ...    ${bssid_header_default}    
    ...    ${cryptography_header_default}    
    ...    ${signal_header_default}     
    
    Close site survey 5GHz button text should be "Fechar"
    Close site survey 5GHz

    Bandwidth select title should be "Largura de Banda"
    Bandwidth select should be disabled
    
    Channel select title should be "Canal"
    Channel select should be disabled

    Select band and channel button text should be "Selecionar banda e canal"

    Transmission Power (dBm) title should be "Potência de Transmissão (dBm)\n6\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n20"
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

Three IEEE mode are available: a, a/n, a/n/ac & a/n/ac/ax
    [Tags]    smoke
    There should be "4" IEEE mode available
    IEEE mode "a" should be available
    IEEE mode "a/n" should be available
    IEEE mode "a/n/ac" should be available
    IEEE mode "a/n/ac" should be available
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
    Select Bandwidth and channel "80 MHz"

    Extension channel select title should be "Canal de Extensão"
    Extension channel select should be disabled

    Preferably checkbox text should be "Preferencialmente a largura selecionada"
    Preferably checkbox should be enabled

    Show DFS checkbox text should be "Mostrar canais com DFS"
    Show DFS checkbox should be enabled

    Wireless Radio 5GHz table should be visible
    
    Channel checkbox should be enabled
    Channel header should be "Canal" in table
    dBm header should be "Limite TX, dBm" in table
    Bandwidth header should be "Largura de Banda Máx." in table
    DFS header should be "DFS" in table

    Channel 36 checkbox should be enabled
    Channel 36 should be "36 (5180 MHz)" in table
    Channel 36 dBm should be "20" in table
    Channel 36 Bandwidth should be "80" in table
    Channel 36 DFS should be "Não" in table

    Channel 40 checkbox should be enabled
    Channel 40 should be "40 (5200 MHz)" in table
    Channel 40 dBm should be "20" in table
    Channel 40 Bandwidth should be "80" in table
    Channel 40 DFS should be "Não" in table

    Channel 44 checkbox should be enabled
    Channel 44 should be "44 (5220 MHz)" in table
    Channel 44 dBm should be "20" in table
    Channel 44 Bandwidth should be "80" in table
    Channel 44 DFS should be "Não" in table

    Channel 48 checkbox should be enabled
    Channel 48 should be "48 (5240 MHz)" in table
    Channel 48 dBm should be "20" in table
    Channel 48 Bandwidth should be "80" in table
    Channel 48 DFS should be "Não" in table

    Channel 149 checkbox should be enabled
    Channel 149 should be "149 (5745 MHz)" in table
    Channel 149 dBm should be "20" in table
    Channel 149 Bandwidth should be "80" in table
    Channel 149 DFS should be "Não" in table

    Channel 153 checkbox should be enabled
    Channel 153 should be "153 (5765 MHz)" in table
    Channel 153 dBm should be "20" in table
    Channel 153 Bandwidth should be "80" in table
    Channel 153 DFS should be "Não" in table

    Channel 157 checkbox should be enabled
    Channel 157 should be "157 (5785 MHz)" in table
    Channel 157 dBm should be "20" in table
    Channel 157 Bandwidth should be "80" in table
    Channel 157 DFS should be "Não" in table
    
    Channel 161 checkbox should be enabled
    Channel 161 should be "161 (5805 MHz)" in table
    Channel 161 dBm should be "20" in table
    Channel 161 Bandwidth should be "80" in table
    Channel 161 DFS should be "Não" in table

    Select button text should be "SELECIONAR"
    Close button text should be "FECHAR"
    [Teardown]    No operation

Two Bandwidth and channel are available: 20 MHz, 40 MHz & 80 MHz
    [Tags]    smoke
    There should be "3" Bandwidth and channel available
    Bandwidth and channel "20 MHz" should be available
    Bandwidth and channel "40 MHz" should be available
    Bandwidth and channel "80 MHz" should be available
    [Teardown]    No operation
