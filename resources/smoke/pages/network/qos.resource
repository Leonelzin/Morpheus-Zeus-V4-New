*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                  xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                         xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_QOS}                                             xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[7]/p

###

${NETWORK_QOS_PAGE_INNER_TITLE}                                     data-testid=inner-title
${NETWORK_QOS_PAGE_INNER_SUBTITLE}                                  data-testid=inner-subtitle

# QOS ENABLE
${NETWORK_QOS_PAGE_ENABLE_TOGGLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input
${NETWORK_QOS_PAGE_ENABLE_TOGGLE_CLICKABLE}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label
${NETWORK_QOS_PAGE_ENABLE_TOGGLE_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/span

# QOS TYPE
${NETWORK_QOS_PAGE_TYPE_SELECT_TITLE}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/span
${NETWORK_QOS_PAGE_TYPE_SELECT}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/div/input
${NETWORK_QOS_PAGE_TYPE_SELECT_OPTIONS_DROPDOWN}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/ul

# INTERNET LINK
${NETWORK_QOS_PAGE_INTERNET_LINK_SECTION_TITLE}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[1]
${NETWORK_QOS_PAGE_INTERNET_LINK_UPLOAD_INPUT_TITLE}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[1]/label
${NETWORK_QOS_PAGE_INTERNET_LINK_UPLOAD_INPUT}                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[1]/input
${NETWORK_QOS_PAGE_INTERNET_LINK_DOWNLOAD_INPUT_TITLE}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[2]/label
${NETWORK_QOS_PAGE_INTERNET_LINK_DOWNLOAD_INPUT}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]/div[2]/input

# BANDWIDTH LIMIT BY SSID TABLE
${NETWORK_QOS_PAGE_BANDWIDTH_LIMIT_BY_SSID_SECTION_TITLE}           xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[1]

# BANDWIDTH GUARANTEE BY SSID TABLE
${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_BY_SSID_SECTION_TITLE}       xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[1]

${NETWORK_QOS_PAGE_SAVE_SETTINGS_BUTTON}                            xpath=//*[@id="root"]/div[3]/div/div[2]/button


*** Keywords ***
Access network QoS settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_SUBMENU}
    ...    contains
    ...    visible

    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_SUBMENU}
        ...    visible
        ...    5s
        ...    Network submenu was not visible (5 seconds timeout).
    END

    ${qos_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_QOS}
    ...    contains
    ...    visible

    IF    not ${qos_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_QOS}
        ...    visible
        ...    5s
        ...    Network QoS submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_QOS}

    Wait for elements state
    ...    ${NETWORK_QOS_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    60s
    ...    Network QoS page save settings button was not visible (60 seconds timeout).

Page inner title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${NETWORK_QOS_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

QoS enable toggle text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_ENABLE_TOGGLE_TEXT}    ==    ${text}

QoS enable toggle should be visible
    Get element states
    ...    ${NETWORK_QOS_PAGE_ENABLE_TOGGLE_CLICKABLE}
    ...    contains
    ...    visible

QoS enable toggle should be off
    Get checkbox state    ${NETWORK_QOS_PAGE_ENABLE_TOGGLE}    ==    unchecked
    ...    QoS enable toggle should be off.

QoS type select title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_TYPE_SELECT_TITLE}    ==    ${text}

QoS type select option should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_TYPE_SELECT}    ==    ${text}

#################################
#    Keywords: internet link    #
#################################

Internet link section title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INTERNET_LINK_SECTION_TITLE}    ==    ${text}

Internet link upload input title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INTERNET_LINK_UPLOAD_INPUT_TITLE}    ==    ${text}

Internet link upload input should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INTERNET_LINK_UPLOAD_INPUT}    ==    ${text}

Internet link download input title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INTERNET_LINK_DOWNLOAD_INPUT_TITLE}    ==    ${text}

Internet link download input should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_INTERNET_LINK_DOWNLOAD_INPUT}    ==    ${text}

#################################################
#    Keywords: bandwidth limit by SSID table    #
#################################################

Bandwidth limit by SSID section title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_BANDWIDTH_LIMIT_BY_SSID_SECTION_TITLE}    ==    ${text}

Bandwidth limit by SSID table headers should be "${comma_separated_headers}"
    [Tags]    robot:continue-on-failure
    @{expected_headers_list}    Split string    ${comma_separated_headers}    separator=,
    @{headers}    Get elements    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[1] >> div

    FOR    ${index}    ${header}    IN ENUMERATE    @{headers}
        ${header_text}    Get text    ${header}
        Should be equal as strings
        ...    ${header_text}
        ...    ${expected_headers_list[${index}].strip()}
        ...    values=${false}
        ...    msg=Bandwidth limit by SSID table header at position #${index} should be "${expected_headers_list[${index}].strip()}" but it is "${header_text}".
    END

Bandwidth limit by SSID table should contain entry
    [Arguments]    ${enabled}    ${ssid}    ${frequency}    ${upload}    ${download}
    ${row}    Get SSID row in QoS bandwidth limit table    ssid=${ssid}

    IF    ${enabled} == ${true}
        Get checkbox state
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div[${row}]/div[1]/label/input
        ...    ==
        ...    checked
        ...    SSID QoS bandwidth limit should be checked.
    ELSE
        Get checkbox state
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div[${row}]/div[1]/label/input
        ...    ==
        ...    unchecked
        ...    SSID QoS bandwidth limit should not be checked.
    END

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div[${row}]/div[3]
    ...    ==
    ...    ${frequency}

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div[${row}]/div[4]/div/input
    ...    ==
    ...    ${upload}

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div[${row}]/div[5]/div/input
    ...    ==
    ...    ${download}

Get SSID row in QoS bandwidth limit table
    [Arguments]    ${ssid}
    @{table_rows}    Get elements    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/*
    ${rows}    Get length    ${table_rows}

    FOR    ${row}    IN RANGE    1    ${rows}+1
        ${row_ssid}    Get text
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/div[2]/div[2]/div[${row}]/div[2]

        IF    "${row_ssid}" == "${ssid}"    RETURN    ${row}
    END

    Fail    SSID "${ssid}" not found in QoS bandwidth limit table.

Save QoS settings button text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

#####################################################
#    Keywords: bandwidth guarantee by SSID table    #
#####################################################

Bandwidth guarantee by SSID section title should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_BANDWIDTH_GUARANTEE_BY_SSID_SECTION_TITLE}    ==    ${text}

Bandwidth Guarantee by SSID table headers should be "${comma_separated_headers}"
    [Tags]    robot:continue-on-failure
    @{expected_headers_list}    Split string    ${comma_separated_headers}    separator=,
    @{headers}    Get elements    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[1] >> div

    FOR    ${index}    ${header}    IN ENUMERATE    @{headers}
        ${header_text}    Get text    ${header}
        Should be equal as strings
        ...    ${header_text}
        ...    ${expected_headers_list[${index}].strip()}
        ...    values=${false}
        ...    msg=Bandwidth guarantee by SSID table header at position #${index} should be "${expected_headers_list[${index}].strip()}" but it is "${header_text}".
    END

Bandwidth guarantee by SSID table should contain entry
    [Arguments]    ${enabled}    ${ssid}    ${frequency}    ${upload}    ${download}
    ${row}    Get SSID row in QoS bandwidth limit table    ssid=${ssid}

    IF    ${enabled} == ${true}
        Get checkbox state
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div[${row}]/div[1]/label/input
        ...    ==
        ...    checked
        ...    SSID QoS bandwidth guarantee should be checked.
    ELSE
        Get checkbox state
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div[${row}]/div[1]/label/input
        ...    ==
        ...    unchecked
        ...    SSID QoS bandwidth guarantee should not be checked.
    END

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div[${row}]/div[3]
    ...    ==
    ...    ${frequency}

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div[${row}]/div[4]/div/input
    ...    ==
    ...    ${upload}

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div[${row}]/div[5]/div/input
    ...    ==
    ...    ${download}

Get SSID row in QoS bandwidth guarantee table
    [Arguments]    ${ssid}
    @{table_rows}    Get elements    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/*

    ${rows}    Get length    ${table_rows}

    FOR    ${row}    IN RANGE    1    ${rows}+1
        ${row_ssid}    Get text
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/div[2]/div[2]/div[${row}]/div[2]
        IF    "${row_ssid}" == "${ssid}"    RETURN    ${row}
    END

    Fail    SSID "${ssid}" not found in QoS bandwidth guarantee table.

Save QoS settings button text should be "${text}"
    Get text    ${NETWORK_QOS_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
