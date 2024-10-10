*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                  xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SYSTEM_SUBMENU}                                          xpath=//*[@id="sidebar-options-menu"]/div[4]/div/div/div/div
${SIDEMENU_SYSTEM_BACKUP}                                           xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[2]/p

###

${BACKUP_PAGE_INNER_TITLE}                                          xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${BACKUP_PAGE_INNER_SUBTITLE}                                       xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${BACKUP_PAGE_BACKUP_SECTION_TITLE}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]
${BACKUP_PAGE_BACKUP_SECTION_SUBTITLE}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]
${BACKUP_PAGE_BACKUP_CREATE_BUTTON}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/button[1]
${BACKUP_PAGE_BACKUP_MODAL}                                         xpath=//*[@id="overlay-cntse"]/div
${BACKUP_PAGE_BACKUP_MODAL_TITLE}                                   xpath=//*[@id="overlay-cntse"]/div/div[1]/div
${BACKUP_PAGE_BACKUP_MODAL_TEXT}                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div
${BACKUP_PAGE_BACKUP_MODAL_CANCEL_BUTTON}                           xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[1]
${BACKUP_PAGE_BACKUP_MODAL_DOWNLOAD_BUTTON}                         xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[2]

${BACKUP_PAGE_UPLOAD_BACKUP_SECTION_TITLE}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]
${BACKUP_PAGE_UPLOAD_BACKUP_SECTION_SUBTITLE}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]
${BACKUP_PAGE_UPLOAD_BACKUP_INPUT_CLICKABLE}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div/div
${BACKUP_PAGE_UPLOAD_BACKUP_INPUT_PLACEHOLDER}                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div/div/span
${BACKUP_PAGE_UPLOAD_BACKUP_BUTTON}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]/button

${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_SECTION_TITLE}       xpath=//*[@id="root"]/div[3]/div/div[2]/div[7]
${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_SECTION_SUBTITLE}    xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]

${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_BUTTON}              xpath=//*[@id="root"]/div[3]/div/div[2]/button[2]


*** Keywords ***
Access system backup and restore settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SYSTEM_SUBMENU}
    ...    contains
    ...    visible

    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_SYSTEM_SUBMENU}
        ...    visible
        ...    5s
        ...    System submenu was not visible (5 seconds timeout).
    END

    ${backup_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SYSTEM_BACKUP}
    ...    contains
    ...    visible

    IF    not ${backup_option_is_visible}
        Click    ${SIDEMENU_SYSTEM_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SYSTEM_BACKUP}
        ...    visible
        ...    5s
        ...    Backup and restore system submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SYSTEM_BACKUP}

    Wait for elements state
    ...    ${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    Backup and restore page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${BACKUP_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${BACKUP_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Backup section title should be "${text}"
    Get text    ${BACKUP_PAGE_BACKUP_SECTION_TITLE}    ==    ${text}

Backup section subtitle should be "${text}"
    Get text    ${BACKUP_PAGE_BACKUP_SECTION_SUBTITLE}    ==    ${text}

Backup creation button text should be "${text}"
    Get text    ${BACKUP_PAGE_BACKUP_CREATE_BUTTON}    ==    ${text}

Apply backup section title should be "${text}"
    Get text    ${BACKUP_PAGE_UPLOAD_BACKUP_SECTION_TITLE}    ==    ${text}

Apply backup section subtitle should be "${text}"
    Get text    ${BACKUP_PAGE_UPLOAD_BACKUP_SECTION_SUBTITLE}    ==    ${text}

Apply backup file input placeholder should be "${text}"
    Get text    ${BACKUP_PAGE_UPLOAD_BACKUP_INPUT_PLACEHOLDER}    ==    ${text}

Apply backup send file button text should be "${text}"
    Get text    ${BACKUP_PAGE_UPLOAD_BACKUP_BUTTON}    ==    ${text}

Restore factory default settings section title should be "${text}"
    Get text    ${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_SECTION_TITLE}    ==    ${text}

Restore factory default settings section subtitle should be "${text}"
    Get text    ${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_SECTION_SUBTITLE}    ==    ${text}

Restore factory default settings button text should be "${text}"
    Get text    ${BACKUP_PAGE_RESTORE_FACTORY_DEFAULT_SETTINGS_BUTTON}    ==    ${text}

Settings backup modal should be displayed
    Wait for elements state
    ...    ${BACKUP_PAGE_BACKUP_MODAL}
    ...    visible
    ...    3s
    ...    Settings backup modal was not visible (5 seconds timeout).

Settings backup modal title should be "${text}"
    Get text    ${BACKUP_PAGE_BACKUP_MODAL_TITLE}    ==    ${text}

Settings backup modal text should be "${text}"
    Wait until keyword succeeds
    ...    5x
    ...    1s
    ...    Get text    ${BACKUP_PAGE_BACKUP_MODAL_TEXT}    ==    ${text}

Settings backup modal cancel button text should be "${text}"
    Get text    ${BACKUP_PAGE_BACKUP_MODAL_CANCEL_BUTTON}    ==    ${text}

Settings backup modal download button text should be "${text}"
    Get text    ${BACKUP_PAGE_BACKUP_MODAL_DOWNLOAD_BUTTON}    ==    ${text}
