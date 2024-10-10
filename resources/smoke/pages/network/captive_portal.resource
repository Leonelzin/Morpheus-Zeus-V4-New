*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                                            xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                                                   xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_CAPTIVE_PORTAL}                                                            xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[6]/p


###


${NETWORK_CAPTIVE_PORTAL_PAGE_INNER_TITLE}                                                    xpath=//*[@data-testid="inner-title"]
${NETWORK_CAPTIVE_PORTAL_PAGE_INNER_SUBTITLE}                                                 xpath=//*[@data-testid="inner-subtitle"]

${NETWORK_CAPTIVE_PORTAL_PAGE_POP_UP_TITLE}                                                   xpath=//*[@id="overlay-cntse"]/div/div[1]/div
${NETWORK_CAPTIVE_PORTAL_PAGE_POP_UP_TEXT}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]

${NETWORK_CAPTIVE_PORTAL_PAGE_CLOSE_POP_UP_BUTTON}                                            xpath=//*[@id="overlay-cntse"]/div/div[3]/button

${NETWORK_CAPTIVE_PORTAL_PAGE_SSID_LIST_TITLE}                                                xpath=//*[@id="root"]/div[3]/div/h2[1]

${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_ENABLED}                                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_SSID}                                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_FREQUENCY}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[3]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_AUTHENTICATION_TYPE}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[4]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_SERVER}                                                  xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[1]/div[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_SERVER_ADDRESS}                                          xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[1]/div[2]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_AUTHENTICATION_PORT}                                     xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[1]/div[3]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_ACCOUNTING_PORT}                                         xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[1]/div[4]
${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_ADDRESS}                                                 xpath=//*[@id="root"]/div[3]/div/div[9]/div[1]/div[1]

${NETWORK_CAPTIVE_PORTAL_PAGE_EXTERNAL_CONFIGURATION_TITLE}                                   xpath=//*[@id="root"]/div[3]/div/h2[2]

${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATOR_INPUT_TITLE}                                      xpath=//*[@id="root"]/div[3]
${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATOR_INPUT}                                            xpath=//*[@id="root"]/div[3]/div/div[3]/input

${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_TITLE}                                             xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_INPUT}                                             xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/input

${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_INFO}                                              xpath=//*[@id="root"]/div[3]/div/div[4]/div[1] >> svg
${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_INFO_TEXT}                                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div

${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT}                                            xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/div/input
${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTIONS_DROPDOWN}                           xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/ul
${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTION_MINUTES}                             xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/ul/li[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTION_HOURS}                               xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/ul/li[2]
${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTION_DAYS}                                xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/ul/li[3]

${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_TITLE}                                                 xpath=//*[@id="root"]/div[3]/div/div[4]/div[3]
${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_INPUT}                                                 xpath=//*[@id="root"]/div[3]/div/div[4]/div[3]/div/input

${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_INFO}                                                  xpath=//*[@id="root"]/div[3]/div/div[4]/div[3] >> svg
${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_INFO_TEXT}                                             xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div
${NETWORK_CAPTIVE_PORTAL_PAGE_INFO_OK_BUTTON}                                                 xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button

${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT}                                                xpath=//*[@id="root"]/div[3]/div/div[4]/div[4]/div/div/div/input
${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTIONS_DROPDOWN}                               xpath=//*[@id="root"]/div[3]/div/div[4]/div[4]/div/div/ul
${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTION_MINUTES}                                 xpath=//*[@id="root"]/div[3]/div/div[4]/div[4]/div/div/ul/li[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTION_HOURS}                                   xpath=//*[@id="root"]/div[3]/div/div[4]/div[4]/div/div/ul/li[2]
${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTION_DAYS}                                    xpath=//*[@id="root"]/div[3]/div/div[4]/div[4]/div/div/ul/li[3]

${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_TILE}                                xpath=//*[@id="root"]/div[3]/div/div[5]/div[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT}                                     xpath=//*[@id="root"]/div[3]/div/div[5]/div[1]/div/div/div/input
${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTIONS_DROPDOWN}                    xpath=//*[@id="root"]/div[3]/div/div[5]/div[1]/div/div/ul
${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTION_EXTERNAL}                     xpath=//*[@id="root"]/div[3]/div/div[5]/div[1]/div/div/ul/li[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTION_RADIUS}                       xpath=//*[@id="root"]/div[3]/div/div[5]/div[1]/div/div/ul/li[2]

${NETWORK_CAPTIVE_PORTAL_PAGE_RADIUS_ADD_BUTTON}                                              xpath=//*[@id="root"]/div[3]/div/div[6]/span/button
${NETWORK_CAPTIVE_PORTAL_PAGE_RADIUS_TYPE_ADD_BUTTON_TEXT}                                    xpath=//*[@id="root"]/div[3]/div/div[6]/span/span

${NETWORK_CAPTIVE_PORTAL_PAGE_PASSWORD_INPUT_TITLE}                                           xpath=//*[@id="root"]/div[3]/div/div[5]/div[2]
${NETWORK_CAPTIVE_PORTAL_PAGE_PASSWORD_INPUT}                                                 xpath=//*[@id="root"]/div[3]/div/div[5]/div[2]/div/div/input
${NETWORK_CAPTIVE_PORTAL_PAGE_PASSWORD_REVEALER}                                              xpath=//*[@id="root"]/div[3]/div/div[5]/div[2]/div/div/span[2] >> svg

${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT}                                                  xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[2]/div/div[1]/div/div/div/input
${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}                                 xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[2]/div/div[1]/div/div/ul
${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT_OPTION_EXAMPLE_SERVER}                            xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[2]/div/div[1]/div/div/ul/li

${NETWORK_CAPTIVE_PORTAL_PAGE_RADIUS_SETTINGS_DELETE_BUTTON}                                  xpath=//*[@id="root"]/div[3]/div/div[4]/div[3] >> svg

${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_TITLE}                                            xpath=//*[@id="root"]/div[3]/div/div[8]/h2

${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_INFO}                                             xpath=//*[@id="root"]/div[3]/div/div[8]/h2 >> svg
${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_INFO_TEXT}                                        xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div

${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_ADD_BUTTON}                                       xpath=//*[@id="root"]/div[3]/div/div[8]/div/div/span/button
${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_ADD_BUTTON_TEXT}                                  xpath=//*[@id="root"]/div[3]/div/div[8]/div/div/span/span

${NETWORK_CAPTIVE_PORTAL_PAGE_ADDRESS_INPUT}                                                  xpath=//*[@id="root"]/div[3]/div/div[9]/div[2]/div/div[1]/div/div/div/input

${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_SETTINGS_DELETE_BUTTON}                           xpath=//*[@id="root"]/div[3]/div/div[9]/div[2]/div/div[2] >> svg

${NETWORK_CAPTIVE_PORTAL_PAGE_DELETE_BUTTON}                                                  xpath=//*[@id="root"]/div[3]/div/div[10]/button[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_DELETE_BUTTON_TEXT}                                             xpath=//*[@id="root"]/div[3]/div/div[10]/button[1]/span
${NETWORK_CAPTIVE_PORTAL_PAGE_DELETE_SETTINGS_TEXT}                                           xpath=//*[@id="overlay-cntse"]/div/div[2]/div

${NETWORK_CAPTIVE_PORTAL_PAGE_BACK_BUTTON}                                                    xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[1]
${NETWORK_CAPTIVE_PORTAL_PAGE_BACK_BUTTON_TEXT}                                               xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[1]/span

${NETWORK_CAPTIVE_PORTAL_PAGE_CONTINUE_BUTTON}                                                xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[2]
${NETWORK_CAPTIVE_PORTAL_PAGE_CONTINUE_BUTTON_TEXT}                                           xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[2]/span

${NETWORK_CAPTIVE_PORTAL_PAGE_SAVE_BUTTON_TEXT}                                               xpath=//*[@id="root"]/div[3]/div/div[10]/button[2]/span


*** Keywords ***
Access network captive portal settings page
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

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_CAPTIVE_PORTAL}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_CAPTIVE_PORTAL}
        ...    visible
        ...    5s
        ...    Network captive portal submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_CAPTIVE_PORTAL}
    Sleep    6

Page inner title network captive portal should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle network captive portal should be "${text}"
    ${str}    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

[Captive Portal] pop up title should be "${text}"
    ...    [Documentation]    This pop up appears only in bridge mode
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_POP_UP_TITLE}    ==    ${text}

[Captive Portal] pop up text should be "${text}"
    ...    [Documentation]    This pop up appears only in bridge mode
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_POP_UP_TEXT}    ==    ${text}

[Captive Portal] button text should be "${text}"
    ...    [Documentation]    This pop up appears only in bridge mode
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_CLOSE_POP_UP_BUTTON}    ==    ${text}

Close captive portal pop up
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_CLOSE_POP_UP_BUTTON}

Info button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_INFO_OK_BUTTON}    ==    ${text}

SSID list title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_SSID_LIST_TITLE}    ==    ${text}

SSID list table headers should be
    [Arguments]    ${enabled_header_default}    ${ssid_header_default}    ${frequency_header_default}    ${authentication_type_header_default}   
    ${enabled}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_ENABLED}
    ${ssid}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_SSID}
    ${frequency}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_FREQUENCY}
    ${authentication_type}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_AUTHENTICATION_TYPE}
    @{text_parts}=    Create List    ${enabled_header_default}    ${ssid_header_default}    ${frequency_header_default}    ${authentication_type_header_default}    
    Should Be Equal As Strings    ${enabled}    ${text_parts}[0]
    Should Be Equal As Strings    ${ssid}    ${text_parts}[1]
    Should Be Equal As Strings    ${frequency}    ${text_parts}[2]
    Should Be Equal As Strings    ${authentication_type}    ${text_parts}[3]

SSID list table should contain entry
    [Arguments]    ${enabled}    ${ssid}    ${frequency}    ${authentication_type}
    ${row}    Get SSID row in captive portal SSID list table    ssid=${ssid}

    IF    ${enabled} == ${true}
        Get checkbox state
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[${row}]/div[1]/label/input
        ...    ==
        ...    checked
        ...    SSID list captive portal should be checked.
    ELSE
        Get checkbox state
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[${row}]/div[1]/label/input
        ...    ==
        ...    unchecked
        ...    SSID list captive portal should be checked.
    END

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[${row}]/div[3]
    ...    ==
    ...    ${frequency}

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[${row}]/div[4]
    ...    ==
    ...    ${authentication_type}
    
Get SSID row in captive portal SSID list table
    [Arguments]    ${ssid}
    @{table_rows}    Get elements    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div/*
    ${rows}    Get length    ${table_rows}

    FOR    ${row}    IN RANGE    1    ${rows}+1
        ${row_ssid}    Get text
        ...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[${row}]/div[2]

        IF    "${row_ssid}" == "${ssid}"    RETURN    ${row}
    END

    Fail    SSID "${ssid}" not found in captive portal SSID list table.

External Configuration title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_EXTERNAL_CONFIGURATION_TITLE}    ==    ${text}

Authenticator input title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATOR_INPUT_TITLE}    ==    ${text}

Authenticator input should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATOR_INPUT}    ==    ${text}

Authenticator input placeholder should be "${text}"
    Get attribute
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATOR_INPUT}
    ...    placeholder    ==    ${text}

Session time input title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_TITLE}    ==    ${text}

Session time input should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_INPUT}    ==    ${text}

Open Session time info
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_INFO}

Close Session time info
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_INFO_OK_BUTTON}
    
Session time text info should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_INFO_TEXT}    ==    ${text}

Session time select option should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT}    ==    ${text}
   
Session time select should be enabled
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT}
    ...    contains
    ...    enabled
    ...    message=Session time select should be enabled (editable).

Open Session time selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT}
    END

Select Session time "${text}"
    Open Session time selection dropdown menu

    ${method_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} session time available, but there were.
            RETURN
        END
    END
    Fail    Session time method ${text} is not available.

There should be "${number}" Session time methods available
    Open Session Time selection dropdown menu

    ${method_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_SESSION_TIME_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} session time available, but there were ${list_length}.
    ...    values=${false}

Session time "${text}" should be available
    Select Session time "${text}"

Downtime input title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_TITLE}    ==    ${text}

Downtime input should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_INPUT}    ==    ${text}

Open Downtime info
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_INFO}

Close Downtime info
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_INFO_OK_BUTTON}
    
Downtime text info should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_INFO_TEXT}    ==    ${text}

Downtime select option should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT}    ==    ${text}
   
Downtime select should be enabled
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT}
    ...    contains
    ...    enabled
    ...    message=Downtime select should be enabled (editable).

Open Downtime selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT}
    END

Select Downtime "${text}"
    Open Downtime selection dropdown menu

    ${method_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} downtime available, but there were.
            RETURN
        END
    END
    Fail    Downtime method ${text} is not available.

There should be "${number}" Downtime methods available
    Open Downtime selection dropdown menu

    ${method_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_DOWNTIME_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} downtime available, but there were ${list_length}.
    ...    values=${false}

Downtime "${text}" should be available
    Select Downtime "${text}"

Authentication type select title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_TILE}    ==    ${text}

Authentication type select option should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT}    ==    ${text}
   
Authentication type select should be enabled
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT}
    ...    contains
    ...    enabled
    ...    message=Authentication type select should be enabled (editable).

Open Authentication type selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT}
    END

Select Authentication type "${text}"
    Open Authentication type selection dropdown menu

    ${method_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} authentication type available, but there were.
            RETURN
        END
    END
    Fail    Authentication type method ${text} is not available.

There should be "${number}" Authentication type methods available
    Open Authentication type selection dropdown menu

    ${method_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_AUTHENTICATION_TYPE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} authentication type available, but there were ${list_length}.
    ...    values=${false}

Authentication type "${text}" should be available
    Select Authentication type "${text}"

Password input title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_PASSWORD_INPUT_TITLE}    ==    ${text}

External configuration password input should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_PASSWORD_INPUT}    ==    ${text}

Password revealer for screen captive portal should be visible
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_PASSWORD_REVEALER}
    ...    contains
    ...    visible
    
ADD radius settings button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_RADIUS_TYPE_ADD_BUTTON_TEXT}    ==    ${text}

Click ADD radius settings
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_RADIUS_ADD_BUTTON}

Radius table headers should be
    [Arguments]    ${server_header_default}    ${sever_address_header_default}    ${authentication_port_header_default}    ${accounting_port_header_default}   
    ${server}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_SERVER}
    ${server_address}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_SERVER_ADDRESS}
    ${authentication_port}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_AUTHENTICATION_PORT}
    ${accounting_port}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_ACCOUNTING_PORT}
    @{text_parts}=    Create List    ${server_header_default}    ${sever_address_header_default}    ${authentication_port_header_default}    ${accounting_port_header_default}   
    Should Be Equal As Strings    ${server}    ${text_parts}[0]
    Should Be Equal As Strings    ${server_address}    ${text_parts}[1]
    Should Be Equal As Strings    ${authentication_port}    ${text_parts}[2]
    Should Be Equal As Strings    ${accounting_port}    ${text_parts}[3]

Radius table should contain entry
    [Arguments]    ${server_address}    ${authentication_port}    ${accounting_port}
    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[2]/div/div[2]/div
    ...    ==
    ...    ${server_address}

    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[2]/div/div[3]/div
    ...    ==
    ...    ${authentication_port}
    
    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[7]/div/div[2]/div/div[4]/div
    ...    ==
    ...    ${accounting_port}

Server select should be enabled for captive portal screen
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT}
    ...    contains
    ...    enabled
    ...    message=Server select should be enabled (editable).

Open Server selection dropdown menu for captive portal screen
    ${elem_states}    Get element states    ${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT}
    END

Select Server on captive portal screen should have text "${text}"
    Open Server selection dropdown menu

    ${server_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${server_elem}    IN    @{server_list}
        ${method_text}    Get text    ${server_elem}
        IF    "${method_text}" == "${text}"
            Click    ${server_elem}
            Get element states
            ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} server available, but there were.
            RETURN
        END
    END
    Fail    server method ${text} is not available.

There should be "${number}" server methods available for captive portal screen
    Open Server selection dropdown menu

    ${server_list}    Get elements    ${NETWORK_CAPTIVE_PORTAL_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${server_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} server available, but there were ${list_length}.
    ...    values=${false}

Server "${text}" should be available for captive portal screen
    Select Server "${text}"

Delete radius settings button should be visible
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_RADIUS_SETTINGS_DELETE_BUTTON}
    ...    contains
    ...    visible
    ...    message=Delete radius settings button should be visible (editable).

Walled Garden title should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_TITLE}    ==    ${text}

Open Walled Garden info
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_INFO}

Close Walled Garden info
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_INFO_OK_BUTTON}
    
Walled Garden text info should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_INFO_TEXT}    ==    ${text}

ADD walled garden settings button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_ADD_BUTTON_TEXT}    ==    ${text}

Click ADD walled garden settings
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_ADD_BUTTON}

Walled Garden table should contain entry
    [Arguments]    ${address}
    Get text
    ...    xpath=//*[@id="root"]/div[3]/div/div[9]/div[1]/div[1]
    ...    ==
    ...    ${address}

Walled Garden address input should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_ADDRESS_INPUT}    ==    ${text}

Walled Garden address input placeholder should be "${text}"
    Get attribute
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_ADDRESS_INPUT}
    ...    placeholder    ==    ${text}

Walled Garden table headers should be
    [Arguments]    ${address_header_default}      
    ${address}    Get Text    ${NETWORK_CAPTIVE_PORTAL_PAGE_HEADER_ADDRESS}
    @{text_parts}=    Create List    ${address_header_default}       
    Should Be Equal As Strings    ${address}    ${text_parts}[0]

Delete walled garden settings button should be visible
    Get element states
    ...    ${NETWORK_CAPTIVE_PORTAL_PAGE_WALLED_GARDEN_SETTINGS_DELETE_BUTTON}
    ...    contains
    ...    visible
    ...    message=Delete walled garden settings button should be visible (editable).

Delete captive settings button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_DELETE_BUTTON_TEXT}    ==    ${text}

Open delete captive settings
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_DELETE_BUTTON}

Close delete captive settings
    Click    ${NETWORK_CAPTIVE_PORTAL_PAGE_BACK_BUTTON}
    
Delete captive settings text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_DELETE_SETTINGS_TEXT}    ==    ${text}

Back button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_BACK_BUTTON_TEXT}    ==    ${text}

Continue button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_CONTINUE_BUTTON_TEXT}    ==    ${text}

Save button text should be "${text}"
    Get text    ${NETWORK_CAPTIVE_PORTAL_PAGE_SAVE_BUTTON_TEXT}    ==    ${text}
