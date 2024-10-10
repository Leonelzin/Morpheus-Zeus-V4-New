*** Settings ***
Library             OperatingSystem
Library             Browser
Resource            ../../../../../resources/common/common_resources.resource
Resource            ../../../../../resources/fiber/fiber.resource
Resource            ../../../../../resources/smoke/pages/system/management.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system management settings page

Force Tags          lang-pt    management    mgmt    https


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Open HTTPS settings tab
    HTTPS tab inner title should be "Acesso HTTPS"

    HTTPS brute force attack protection checkbox should be checked
    HTTPS brute force attack protection checkbox text should be "Defesa contra ataque de força bruta"

    HTTPS port input title should be "Porta"
    HTTPS port input placeholder should be "443"
    HTTPS port should be "443"

    HTTPS certificate and key select title should be "Certificado e chave"
    HTTPS certificate and key select option should be "Padrão"

    HTTPS certificate upload input title shoulde be "Certificado"
    HTTPS certificate upload input placeholder should be "Buscar"

    HTTPS key upload input title shoulde be "Chave"
    HTTPS key upload input placeholder should be "Buscar"
    [Teardown]    No operation

Two options are available for SSL certificate and key: default and custom
    [Tags]    smoke
    Open HTTPS settings tab
    HTTPS certificate and key "Padrão" select option should be available
    HTTPS certificate and key "Customizado" select option should be available
    [Teardown]    No operation

Upload custom certificate: validate input behavior
    [Tags]    smoke
    Create file    ${OUTPUT_DIR}/fake_certificate.crt
    ${promise}    Promise to upload file    ${OUTPUT_DIR}/fake_certificate.crt
    Click    ${MGMT_PAGE_UPLOAD_CERTIFICATE_INPUT_CLICKABLE}
    Wait for    ${promise}
    [Teardown]    No operation

Upload custom key: validate input behavior
    [Tags]    smoke
    Create file    ${OUTPUT_DIR}/fake_key.key
    ${promise}    Promise to upload file    ${OUTPUT_DIR}/fake_key.key
    Click    ${MGMT_PAGE_UPLOAD_KEY_INPUT_CLICKABLE}
    Wait for    ${promise}
    [Teardown]    No operation
