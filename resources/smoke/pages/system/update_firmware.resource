*** Settings ***
Library     Browser
Library     String
Library     Collections
Resource    ../../../../resources/common/common_resources.resource
Resource    ../../../../resources/fiber/fiber.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                           xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SYSTEM_SUBMENU}                                                   xpath=//*[@id="sidebar-options-menu"]/div[4]/div/div/div/div
${SIDEMENU_SYSTEM_UPDATE_FIRMWARE}                                           xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[3]/p


###


${SYSTEM_UPDATE_FIRMWARE_PAGE_INNER_TITLE}                                   xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]

${CURRENT_FIRMWARE_VERSION_TEXT}                                             xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]
${CRONOS_FIRMWARE_VERSION_TEXT}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[1]

${CRONOS_FIRMWARE_VERSION_CHANGELOG_BUTTON}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/button[1]
${CRONOS_FIRMWARE_VERSION_UPDATE_BUTTON}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/button[2]
${CRONOS_FIRMWARE_VERSION_CHANGELOG_CLOSE_BUTTON}                            xpath=//*[@id="overlay-cntse"]/div/div[2]/div/button

${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_TITLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]
${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_SUBTITLE}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]

${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INFO}                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1] >> svg
${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INFO_TEXT}                               xpath=//*[@id="overlay-cntse"]/div/div[2]

${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INPUT}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[3]/div/div/div/input
${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INPUT_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[3]/div/div/div/span

${LOCAL_FIRMWARE_UPDATE_INFO_OK_BUTTON}                                      xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button
${LOCAL_FIRMWARE_UPDATE_BUTTON}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[3]/button


*** Keywords ***
Access system update firmware settings page
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

    ${mgmt_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SYSTEM_UPDATE_FIRMWARE}
    ...    contains
    ...    visible

    IF    not ${mgmt_option_is_visible}
        Click    ${SIDEMENU_SYSTEM_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SYSTEM_UPDATE_FIRMWARE}
        ...    visible
        ...    5s
        ...    System update firmware submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SYSTEM_UPDATE_FIRMWARE}
    Sleep    5

Page inner title should be "${text}"
    Get text    ${SYSTEM_UPDATE_FIRMWARE_PAGE_INNER_TITLE}    ==    ${text}

Current Firmware Version should be
    [Arguments]    ${expected_pattern}
    ${curr_version}    Get Text    ${CURRENT_FIRMWARE_VERSION_TEXT}
    Should Match Regexp    ${curr_version}    ${expected_pattern}    msg=Firmware version does not match expected pattern
    Log To Console    Firmware Version: ${curr_version}

Cronos Available Firmware Version should be
    [Arguments]    ${expected_pattern}
    ${cronos_version}    Get Text    ${CRONOS_FIRMWARE_VERSION_TEXT}
    Should Match Regexp    ${cronos_version}    ${expected_pattern}    msg=Cronos version does not match expected pattern
    Log To Console    Cronos Version: ${cronos_version}

Changelog button text should be "${text}"
    Get text    ${CRONOS_FIRMWARE_VERSION_CHANGELOG_BUTTON}    ==    ${text}

Open cronos changelog version
    Click    ${CRONOS_FIRMWARE_VERSION_CHANGELOG_BUTTON}

Default cronos release changelog should be
    ...    Get CRONOS latest firmware version

Close button text should be "${text}"
    Get text    ${CRONOS_FIRMWARE_VERSION_CHANGELOG_CLOSE_BUTTON}    ==    ${text}

Close cronos changelog version
    Click    ${CRONOS_FIRMWARE_VERSION_CHANGELOG_CLOSE_BUTTON}

Cronos update firmware button should be disabled
    Get element states
    ...    ${CRONOS_FIRMWARE_VERSION_UPDATE_BUTTON}
    ...    contains
    ...    disabled

Manual update firmware title should be "${text}"
    Get text    ${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_TITLE}    ==    ${text}

Manual update firmware subtitle should be "${text}"
    Get text    ${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_SUBTITLE}    ==    ${text}

Open manual update firmware info
    Click    ${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INFO}

Close manual update firmware info
    Click    ${LOCAL_FIRMWARE_UPDATE_INFO_OK_BUTTON}

Manual update firmware text info should be "${text}"
    Get text    ${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INFO_TEXT}    ==    ${text}

Button info text should be "${text}"
    Get text    ${LOCAL_FIRMWARE_UPDATE_INFO_OK_BUTTON}    ==    ${text}

Manual update firmware input should be "${text}"
    Get text    ${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INPUT_TEXT}    ==    ${text}

Manual update firmware input should be enabled
    Get element states
    ...    ${LOCAL_FIRMWARE_UPDATE_CHOOSE_FILE_INPUT}
    ...    contains
    ...    enabled
    ...    message=Manual update firmware input should be enabled (editable).

Manual update firmware button should be not visible
    Get element states
    ...    ${LOCAL_FIRMWARE_UPDATE_BUTTON}
    ...    not contains
    ...    not visible
