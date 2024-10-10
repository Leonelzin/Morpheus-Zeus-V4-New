*** Settings ***
Library             Browser
Library             String
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/wireless/wireless_radius.resource


Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless Radius settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access Wireless Radius settings page

Force Tags          lang-pt    wireless_radius


*** Test Cases ***
Factory Default settings for wireless radius are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title wireless radius should be "Radius"
    Page inner subtitle wireless radius should be "Autenticação de servidor"
    
    NAS ID input title should be "NAS ID"
    NAS ID input text should be "d8:36:5f:eb:4b:65"
    NAS ID input should be enabled

    Add radius server settings button text should be "Adicionar"
    Add radius server settings button should be visible in table

    [Documentation]    Verifica se os cabeçalhos da tabela radius estão corretos de acordo com a WEB
    ${description_header_default}=    Set Variable    Descrição
    ${server_address_header_default}=    Set Variable    Endereço Servidor 
    ${authentication_port_header_default}=    Set Variable    Porta Autenticação 
    ${password_header_default}=    Set Variable    Senha 
    Radius table headers should be    ${description_header_default}    ${server_address_header_default}    ${authentication_port_header_default}    ${password_header_default}
    
    Description input text should be "Servidor Exemplo"
    Description input should be enabled

    Server Address input text should be "10.0.0.1"
    Server Address input should be enabled

    Authentication Port input text should be "1813"
    Authentication Port input should be enabled
    
    Password input text should be "12345678"
    Password input should be enabled

    Delete settings button should be visible

    Rows per page select title should be "Linhas por página"
    Rows per page select for pagination should be "1\n2\n3\n4\n5\n6\n7\n8\n9\n10"
    Rows per page select should be enabled

    Pagination number text should be "1 - 1 de 1"

    Pagination button before should be visible
    Pagination button after should be visible

    Save settings button text should be "Salvar"
    [Teardown]    No operation
