*** Settings ***
Library             OperatingSystem
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/system/backup_and_restore.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system backup and restore settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system backup and restore settings page

Force Tags          lang-pt    backup    restore


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Backup e restauração"
    Page inner subtitle should be "Backup, recuperação e padrão de fábrica"

    Backup section title should be "Realizar backup das configurações"
    Backup section subtitle should be "Crie um arquivo de backup com as configurações atuais do equipamento"
    Backup creation button text should be "CRIAR ARQUIVO DE BACKUP"

    Apply backup section title should be "Aplicar configurações já salvas"
    Apply backup section subtitle should be "Restaurar as configurações salvas a partir de um arquivo de backup"
    Apply backup file input placeholder should be "Carregar arquivo"
    Apply backup send file button text should be "ENVIAR"

    Restore factory default settings section title should be "Restaurar padrão de fábrica"
    Restore factory default settings section subtitle should be "Restaurar as configurações de fábrica do equipamento"
    Restore factory default settings button text should be "RESTAURAR CONFIGURAÇÕES"

    [Teardown]    No operation

Upload backup file
    [Tags]    smoke
    Create file    ${OUTPUT_DIR}/fake_backup_file.itb
    ${promise}    Promise to upload file    ${OUTPUT_DIR}/fake_backup_file.itb
    Click    ${BACKUP_PAGE_UPLOAD_BACKUP_INPUT_CLICKABLE}
    ${upload_result}    Wait for    ${promise}

Download backup file
    [Tags]    robot:continue-on-failure    smoke
    ${dut_firmware_version}    fiber.Get DUT firmware version
    ${dut_model_name}    fiber.Get DUT model name
    ${dut_model_name}    Replace string    ${dut_model_name}    ${SPACE}    ${EMPTY}

    Click    ${BACKUP_PAGE_BACKUP_CREATE_BUTTON}
    Settings backup modal should be displayed
    Settings backup modal title should be "Configurações salvas"
    Settings backup modal text should be "O arquivo de backup criado terá as configurações atuais desse equipamento com a seguinte versão de firmware: ${dut_firmware_version}"
    Settings backup modal cancel button text should be "CANCELAR"
    Settings backup modal download button text should be "BAIXAR"

    ${dl_promise}    Promise to wait for download    ${OUTPUT_DIR}/downloads/dut_backup.itb
    Click    ${BACKUP_PAGE_BACKUP_MODAL_DOWNLOAD_BUTTON}
    ${file_obj}    Wait For    ${dl_promise}
    File should exist    ${file_obj}[saveAs]

    Should be equal as strings
    ...    ${file_obj}[suggestedFilename]
    ...    Intelbras_${dut_model_name}_config_${dut_firmware_version}.itb

    [Teardown]    No operation
