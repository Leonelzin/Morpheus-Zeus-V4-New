*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/smoke/pages/network/qos.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access network QoS settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access network QoS settings page

Force Tags          lang-pt    qos


*** Test Cases ***
Factory default settings are correct: status and QoS type
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "QoS"
    Page inner subtitle should be "Controle de tráfego da rede"

    QoS enable toggle should be visible
    QoS enable toggle text should be "Habilitar QoS"
    QoS enable toggle should be off

    QoS type select title should be "Tipo de QoS"
    QoS type select option should be "Limite/garantia de banda por SSID"

    [Teardown]    No operation

Factory default settings are correct: internet link
    [Tags]    robot:continue-on-failure    smoke
    Internet link section title should be "Link da internet"

    Internet link upload input title should be "Upload (Mbps)"
    Internet link upload input should be "1000"

    Internet link download input title should be "Download (Mbps)"
    Internet link download input should be "1000"

    [Teardown]    No operation

Factory default settings are correct: bandwidth limit by SSID table
    [Tags]    robot:continue-on-failure    smoke
    Bandwidth limit by SSID section title should be "Limite de banda por SSID"
    Bandwidth limit by SSID table headers should be "Habilitado, SSID, Frequência, Upload (Mbps), Download (Mbps)"
    Bandwidth limit by SSID table should contain entry
    ...    enabled=${false}
    ...    ssid=AP3000AX_d4f4
    ...    frequency=Dual band
    ...    upload=1000
    ...    download=1000

    [Teardown]    No operation

Factory default settings are correct: bandwidth guarantee by SSID table
    [Tags]    robot:continue-on-failure    smoke
    Bandwidth guarantee by SSID section title should be "Garantia de banda por SSID"
    Bandwidth guarantee by SSID table headers should be "Habilitado, SSID, Frequência, Upload (%), Download (%)"
    Bandwidth guarantee by SSID table should contain entry
    ...    enabled=${false}
    ...    ssid=AP3000AX_d4f4
    ...    frequency=Dual band
    ...    upload=1
    ...    download=1

    [Teardown]    No operation

