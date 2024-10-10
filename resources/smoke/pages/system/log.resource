*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SYSTEM_SUBMENU}                              xpath=//*[@id="sidebar-options-menu"]/div[4]/div/div/div/div
${SIDEMENU_SYSTEM_LOG}                                  xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[4]/p

###

${LOG_PAGE_INNER_TITLE}                                 xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${LOG_PAGE_INNER_SUBTITLE}                              xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${LOG_PAGE_LEVEL_SELECT_TITLE}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div[1]
${LOG_PAGE_LEVEL_SELECT}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div[2]/input
${LOG_PAGE_LEVEL_SELECT_OPTIONS_DROPDOWN}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/ul
${LOG_PAGE_LEVEL_SELECT_OPTION_ERROR}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/ul/li[1]/div
${LOG_PAGE_LEVEL_SELECT_OPTION_WARNING}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/ul/li[2]/div
${LOG_PAGE_LEVEL_SELECT_OPTION_INFO}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/ul/li[3]/div
${LOG_PAGE_LEVEL_SELECT_OPTION_DEBUG}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/ul/li[4]/div

${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/label/input
${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE_CLICKABLE}       xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/label/div
${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE_TEXT}            xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div

${LOG_PAGE_REMOTE_SERVER_INPUT_TITLE}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]
${LOG_PAGE_REMOTE_SERVER_INPUT}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/input

${LOG_PAGE_PORT_INPUT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]
${LOG_PAGE_PORT_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/input

${LOG_PAGE_EXPORT_LOG_BUTTON}                           xpath=//*[@id="root"]/div[3]/div/div[5]/button

${LOG_PAGE_SAVE_SETTINGS_BUTTON}                        xpath=//*[@id="root"]/div[3]/div/div[3]/button


*** Keywords ***
Access system log settings page
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

    ${log_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SYSTEM_LOG}
    ...    contains
    ...    visible

    IF    not ${log_option_is_visible}
        Click    ${SIDEMENU_SYSTEM_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SYSTEM_LOG}
        ...    visible
        ...    5s
        ...    Watchdog service submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SYSTEM_LOG}

    Wait for elements state
    ...    ${LOG_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    Watchdog page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${LOG_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${LOG_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Level select title should be "${text}"
    Get text    ${LOG_PAGE_LEVEL_SELECT_TITLE}    ==    ${text}

Level select option should be "${text}"
    Get text    ${LOG_PAGE_LEVEL_SELECT}    ==    ${text}

Open logging level selection dropdown menu
    ${elem_states}    Get element states    ${LOG_PAGE_LEVEL_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    Click    ${LOG_PAGE_LEVEL_SELECT}

There should be "${number}" logging levels available
    Open logging level selection dropdown menu

    ${levels_elem_list}    Get elements    ${LOG_PAGE_LEVEL_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${levels_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} logging levels available, but there was ${list_length}.
    ...    values=${false}

Logging level "${text}" should be available
    Open logging level selection dropdown menu

    ${levels_elem_list}    Get elements    ${LOG_PAGE_LEVEL_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${level_elem}    IN    @{levels_elem_list}
        ${level_text}    Get text    ${level_elem}
        IF    "${level_text}" == "${text}"
            Click    ${level_elem}
            Get element states
            ...    ${LOG_PAGE_LEVEL_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Logging level dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Logging level ${text} is not available.

Remote logging toggle switch text should be "${text}"
    Get text    ${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE_TEXT}    ==    ${text}

Remote logging toggle switch should be off
    Get checkbox state    ${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE}    ==    unchecked
    ...    System remote logging should be disabled.

Enable remote logging
    ${checked}    Get checkbox state    ${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${LOG_PAGE_ENABLE_REMOTE_SERVER_TOGGLE}    checked

Remote server input title should be "${text}"
    Get text    ${LOG_PAGE_REMOTE_SERVER_INPUT_TITLE}    ==    ${text}

Remote server input should be "${text}"
    Get text    ${LOG_PAGE_REMOTE_SERVER_INPUT}    ==    ${text}

Remote server input should be enabled
    Get element states
    ...    ${LOG_PAGE_REMOTE_SERVER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Remote server address input should be enabled (editable).

Remote server input should be disabled
    Get element states
    ...    ${LOG_PAGE_REMOTE_SERVER_INPUT}
    ...    contains
    ...    disabled
    ...    message=Remote server address input should be disabled (not editable).

Port input title should be "${text}"
    Get text    ${LOG_PAGE_PORT_INPUT_TITLE}    ==    ${text}

Port input should be "${text}"
    Get text    ${LOG_PAGE_PORT_INPUT}    ==    ${text}

Port input should be enabled
    Get element states
    ...    ${LOG_PAGE_PORT_INPUT}
    ...    contains
    ...    enabled
    ...    message=Remote server port input should be enabled (editable).

Port input should be disabled
    Get element states
    ...    ${LOG_PAGE_PORT_INPUT}
    ...    contains
    ...    disabled
    ...    message=Remote server port input should be disabled (not editable).

Port input placeholder should be "${text}"
    Get attribute
    ...    ${LOG_PAGE_PORT_INPUT}
    ...    placeholder    ==    ${text}

Save settings button text should be "${text}"
    Get text    ${LOG_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
