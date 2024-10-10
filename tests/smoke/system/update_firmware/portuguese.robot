*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/system/update_firmware.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system update firmware settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system update firmware settings page

Force Tags          lang-pt    update-firmware


*** Test Cases ***
Factory Default settings for update firmware are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Atualização de Firmware"

    Current firmware version should be
    ...    [a-zA-Z0-9_]+

    Cronos available firmware version should be
    ...    [a-zA-Z0-9_]+
    
    Changelog button text should be "Notas de Versão"
    Open cronos changelog version

    ${latest_version}    Get CRONOS latest firmware version
    Log    The latest firmware version is ${latest_version}

    Close button text should be "Fechar"
    Close cronos changelog version

    Cronos update firmware button should be disabled

    Manual update firmware title should be "Atualização manual"
    Manual update firmware subtitle should be "Atualização feita a partir de um arquivo da versão de firmware. Extensão válida: .bin"
    
    Open manual update firmware info
    Manual update firmware text info should be "Primeiro você deve realizar o download do firmware. Acesse o site da Intelbras (intelbras.com.br) e busque pelo nome do seu produto, o firmware estará disponível em Download. Após o download, clique na pasta para selecionar o arquivo de firmware com a versão que será instalada."
    Button info text should be "OK"
    Close manual update firmware info

    Manual update firmware input should be "Selecione a versão de firmware"
    Manual update firmware input should be enabled

    Manual update firmware button should be not visible
