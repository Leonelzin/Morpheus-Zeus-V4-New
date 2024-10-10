*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                              xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SERVICES_SUBMENU}                    xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/div/div
${SIDEMENU_SERVICES_NTP}                        xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[3]/p

###

${NTP_PAGE_INNER_TITLE}                         xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${NTP_PAGE_INNER_SUBTITLE}                      xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${NTP_PAGE_ENABLE_TOGGLE}                       xpath=//*[@id="root"]/div[3]/div/div[2]/label/input
${NTP_PAGE_ENABLE_TOGGLE_CLICKABLE}             xpath=//*[@id="root"]/div[3]/div/div[2]/label/span
${NTP_PAGE_ENABLE_TOGGLE_TEXT}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div

${NTP_PAGE_SERVER_1_INPUT_TITLE}                xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${NTP_PAGE_SERVER_1_INPUT}                      xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/input

${NTP_PAGE_SERVER_2_INPUT_TITLE}                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${NTP_PAGE_SERVER_2_INPUT}                      xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/input

${NTP_PAGE_SAVE_SETTINGS_BUTTON}                xpath=//*[@id="root"]/div[3]/div/div[5]/button

${NTP_PAGE_TIMEZONE_SELECT_TITLE}               xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div
${NTP_PAGE_TIMEZONE_SELECT}                     xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/div/input
${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}    xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul
${NTP_PAGE_TIMEZONE_SELECT_OPTION_BOGOTA}       xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[1]/div
${NTP_PAGE_TIMEZONE_SELECT_OPTION_MANAUS}       xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[2]/div
${NTP_PAGE_TIMEZONE_SELECT_OPTION_SAO_PAULO}    xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[3]/div
${NTP_PAGE_TIMEZONE_SELECT_OPTION_NORONHA}      xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[4]/div

${NTP_PAGE_DAYLIGHT_ST_TOGGLE}                  xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/label/input
${NTP_PAGE_DAYLIGHT_ST_TOGGLE_CLICKABLE}        xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/label/span
${NTP_PAGE_DAYLIGHT_ST_TOOGLE_TEXT}             xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div


*** Keywords ***
Access NTP service settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SERVICES_SUBMENU}
    ...    contains
    ...    visible

    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_SERVICES_SUBMENU}
        ...    visible
        ...    5s
        ...    Services submenu was not visible (5 seconds timeout).
    END

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SERVICES_NTP}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_SERVICES_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SERVICES_NTP}
        ...    visible
        ...    5s
        ...    NTP service submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SERVICES_NTP}

    Wait for elements state
    ...    ${NTP_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    NTP page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${NTP_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${NTP_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

NTP client toggle switch text should be "${text}"
    Get text    ${NTP_PAGE_ENABLE_TOGGLE_TEXT}    ==    ${text}

NTP client toggle switch should be on
    Get checkbox state    ${NTP_PAGE_ENABLE_TOGGLE}    ==    checked
    ...    NTP service should be enabled.

Server 1 input title should be "${text}"
    Get text    ${NTP_PAGE_SERVER_1_INPUT_TITLE}    ==    ${text}

Server 1 should be "${text}"
    Get text    ${NTP_PAGE_SERVER_1_INPUT}    ==    ${text}

Server 1 input should be enabled
    Get element states
    ...    ${NTP_PAGE_SERVER_1_INPUT}
    ...    contains
    ...    enabled
    ...    message=Server address 1 input should be enabled (editable).

Server 1 input should be disabled
    Get element states
    ...    ${NTP_PAGE_SERVER_1_INPUT}
    ...    contains
    ...    disabled
    ...    message=Server address 1 input should be disabled (not editable).

Server 2 input title should be "${text}"
    Get text    ${NTP_PAGE_SERVER_2_INPUT_TITLE}    ==    ${text}

Server 2 should be "${text}"
    Get text    ${NTP_PAGE_server_2_INPUT}    ==    ${text}

Server 2 input should be enabled
    Get element states
    ...    ${NTP_PAGE_SERVER_2_INPUT}
    ...    contains
    ...    enabled
    ...    message=Server address 1 input should be enabled (editable).

Server 2 input should be disabled
    Get element states
    ...    ${NTP_PAGE_SERVER_2_INPUT}
    ...    contains
    ...    disabled
    ...    message=Server address 2 input should be disabled (not editable).

Timezone select option should be "${text}"
    Get text    ${NTP_PAGE_TIMEZONE_SELECT}    ==    ${text}

Daylight saving time toggle switch text should be "${text}"
    Get text    ${NTP_PAGE_DAYLIGHT_ST_TOOGLE_TEXT}    ==    ${text}

Daylight saving time toggle switch should be off
    Get checkbox state    ${NTP_PAGE_DAYLIGHT_ST_TOGGLE}    ==    unchecked
    ...    Daylight saving time should be disabled.

Daylight saving time toggle switch should be on
    Get checkbox state    ${NTP_PAGE_DAYLIGHT_ST_TOGGLE}    ==    checked
    ...    Daylight saving time should be enabled.

Open timezone selection dropdown menu
    ${elem_states}    Get element states    ${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    Click    ${NTP_PAGE_TIMEZONE_SELECT}

There should be "${number}" timezones available
    Open timezone selection dropdown menu

    ${timezones_elem_list}    Get elements    ${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${timezones_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} timezones available, but there was ${list_length}.
    ...    values=${false}

Timezone "${text}" should be available
    Open timezone selection dropdown menu
    ${timezones_elem_list}    Get elements    ${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${timezone_elem}    IN    @{timezones_elem_list}
        ${timezone_text}    Get text    ${timezone_elem}
        IF    "${timezone_text}" == "${text}"
            Click    ${timezone_elem}
            Get element states
            ...    ${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Timezone dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Timezone ${text} is not available.

Disable NTP client
    ${checked}    Get checkbox state    ${NTP_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${true}    Click    ${NTP_PAGE_ENABLE_TOGGLE_CLICKABLE}

Select timezone "${text}"
    ${timezones_elem_list}    Get elements    ${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${timezone_elem}    IN    @{timezones_elem_list}
        ${timezone_text}    Get text    ${timezone_elem}
        IF    "${timezone_text}" == "${text}"
            Click    ${timezone_elem}
            Get element states
            ...    ${NTP_PAGE_TIMEZONE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Timezone dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Timezone ${text} is not available.

Timezone select should be disabled
    Get element states
    ...    ${NTP_PAGE_TIMEZONE_SELECT}
    ...    contains
    ...    readonly
    ...    message=Timezone select should be disabled (not editable).

Daylight saving time toggle switch should be disabled
    Get element states
    ...    ${NTP_PAGE_DAYLIGHT_ST_TOGGLE}
    ...    contains
    ...    disabled
    ...    message=Daylight saving time toggle should be disabled (not editable).

Enable daylight saving time
    ${checked}    Get checkbox state    ${NTP_PAGE_DAYLIGHT_ST_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${NTP_PAGE_DAYLIGHT_ST_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${NTP_PAGE_DAYLIGHT_ST_TOGGLE}    checked

Save settings button text should be "${text}"
    Get text    ${NTP_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
