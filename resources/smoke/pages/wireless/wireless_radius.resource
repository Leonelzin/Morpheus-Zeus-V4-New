*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                                        xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_WIRELESS_SUBMENU}                                                              xpath=//*[@id="sidebar-options-menu"]/div[3]/div
${SIDEMENU_WIRELESS_RADIUS}                                                               xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[6]/p


###


${WIRELESS_RADIUS_PAGE_INNER_TITLE}                                                       xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${WIRELESS_RADIUS_PAGE_INNER_SUBTITLE}                                                    xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${WIRELESS_RADIUS_PAGE_NAS_ID_INPUT_TITLE}                                                xpath=//*[@id="form_row"]/div[1]/div/div
${WIRELESS_RADIUS_PAGE_NAS_ID_INPUT}                                                      id=radius_nas_id

${WIRELESS_RADIUS_PAGE_ADD_SERVER_BUTTON_TEXT}                                            xpath=//*[@id="form_row"]/div[1]/span/span
${WIRELESS_RADIUS_PAGE_ADD_SERVER_BUTTON}                                                 xpath=//*[@id="form_row"]/div[1]/span/button

${WIRELESS_RADIUS_PAGE_HEADER_DESCRIPTION}                                                xpath=//*[@id="form_row"]/div[2]/div[1]/div[1]
${WIRELESS_RADIUS_PAGE_HEADER_SERVER_ADDRESS}                                             xpath=//*[@id="form_row"]/div[2]/div[1]/div[2]
${WIRELESS_RADIUS_PAGE_HEADER_AUTHENTICATION_PORT}                                        xpath=//*[@id="form_row"]/div[2]/div[1]/div[3]
${WIRELESS_RADIUS_PAGE_HEADER_PASSWORD}                                                   xpath=//*[@id="form_row"]/div[2]/div[1]/div[4]

${WIRELESS_RADIUS_PAGE_DESCRIPTION_INPUT}                                                 xpath=//*[@id="form_row"]/div[2]/div[2]/div/div[1]/input
${WIRELESS_RADIUS_PAGE_SERVER_ADDRESS_INPUT}                                              xpath=//*[@id="form_row"]/div[2]/div[2]/div/div[2]/input
${WIRELESS_RADIUS_PAGE_AUTHENTICATION_PORT_INPUT}                                         xpath=//*[@id="form_row"]/div[2]/div[2]/div/div[3]/input
${WIRELESS_RADIUS_PAGE_PASSWORD_INPUT}                                                    xpath=//*[@id="form_row"]/div[2]/div[2]/div/div[4]/input

${WIRELESS_RADIUS_PAGE_DELETE_BUTTON}                                                     xpath=//*[@id="form_row"]/div[2]/div[2]/div/div[5]            

${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_TEXT}                                            xpath=//*[@id="form_row"]/div[3]/p[1]

${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT}                                                 xpath=//*[@id="form_row"]/div[3]/select
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_1}                                       xpath=//*[@id="form_row"]/div[3]/select/option[1]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_2}                                       xpath=//*[@id="form_row"]/div[3]/select/option[2]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_3}                                       xpath=//*[@id="form_row"]/div[3]/select/option[3]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_4}                                       xpath=//*[@id="form_row"]/div[3]/select/option[4]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_5}                                       xpath=//*[@id="form_row"]/div[3]/select/option[5]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_6}                                       xpath=//*[@id="form_row"]/div[3]/select/option[6]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_7}                                       xpath=//*[@id="form_row"]/div[3]/select/option[7]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_8}                                       xpath=//*[@id="form_row"]/div[3]/select/option[8]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_9}                                       xpath=//*[@id="form_row"]/div[3]/select/option[9]
${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_OPTIONS_10}                                      xpath=//*[@id="form_row"]/div[3]/select/option[10]

${WIRELESS_RADIUS_PAGE_PAGINATION_NUMBER_TEXT}                                            xpath=//*[@id="form_row"]/div[3]/p[2]

${WIRELESS_RADIUS_PAGE_PAGINATION_BUTTON_BEFORE}                                          xpath=//*[@id="form_row"]/div[3]/button[2]
${WIRELESS_RADIUS_PAGE_PAGINATION_BUTTON_AFTER}                                           xpath=//*[@id="form_row"]/div[3]/button[1]

${WIRELESS_RADIUS_PAGE_SAVE_SETTINGS_BUTTON}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/button


*** Keywords ***
Access Wireless Radius settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_WIRELESS_SUBMENU}
    ...    contains
    ...    visible
    
    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_SUBMENU}
        ...    visible
        ...    5s
        ...    Wireless submenu was not visible (5 seconds timeout).
    END

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_WIRELESS_RADIUS}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_WIRELESS_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_RADIUS}
        ...    visible
        ...    5s
        ...    Wireless Radius submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_WIRELESS_RADIUS}
    Sleep    6

Page inner title wireless radius should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle wireless radius should be "${text}"
    ${str}    Get text    ${WIRELESS_RADIUS_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

NAS ID input title should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_NAS_ID_INPUT_TITLE}    ==    ${text}

NAS ID input text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_NAS_ID_INPUT}    ==    ${text}

NAS ID input should be enabled
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_NAS_ID_INPUT}
    ...    contains
    ...    enabled
    ...    message=NAS ID input should be enabled (editable).

Radius table headers should be "${text}" in table
    Get text    ${WIRELESS_RADIUS_PAGE_HEADER_DESCRIPTION}     ==    ${text}
    Get text    ${WIRELESS_RADIUS_PAGE_HEADER_SERVER_ADDRESS}    ==    ${text}
    Get text    ${WIRELESS_RADIUS_PAGE_HEADER_AUTHENTICATION_PORT}    ==    ${text}
    Get text    ${WIRELESS_RADIUS_PAGE_HEADER_PASSWORD}    ==    ${text}

Add radius server settings button text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_ADD_SERVER_BUTTON_TEXT}    ==    ${text}

Add radius server settings button should be visible in table
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_ADD_SERVER_BUTTON} 
    ...    contains
    ...    visible

Radius table headers should be
    [Arguments]    ${description_header_default}    ${server_address_header_default}    ${authentication_port_header_default}    ${password_header_default}
    ${description}    Get Text    ${WIRELESS_RADIUS_PAGE_HEADER_DESCRIPTION}
    ${server_address}    Get Text    ${WIRELESS_RADIUS_PAGE_HEADER_SERVER_ADDRESS}
    ${authentication_port}    Get Text    ${WIRELESS_RADIUS_PAGE_HEADER_AUTHENTICATION_PORT}
    ${password}    Get Text    ${WIRELESS_RADIUS_PAGE_HEADER_PASSWORD}
    @{text_parts}=    Create List    ${description_header_default}    ${server_address_header_default}    ${authentication_port_header_default}    ${password_header_default}
    Should Be Equal As Strings    ${description}    ${text_parts}[0]
    Should Be Equal As Strings    ${server_address.title()}    ${text_parts}[1]
    Should Be Equal As Strings    ${authentication_port}    ${text_parts}[2]
    Should Be Equal As Strings    ${password}    ${text_parts}[3]

Description input text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_DESCRIPTION_INPUT}    ==    ${text}

Description input should be enabled
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_DESCRIPTION_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input should be enabled (editable).

Server Address input text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_SERVER_ADDRESS_INPUT}    ==    ${text}

Server Address input should be enabled
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_SERVER_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=Server Address input should be enabled (editable).

Authentication Port input text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_AUTHENTICATION_PORT_INPUT}    ==    ${text}

Authentication Port input should be enabled
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_AUTHENTICATION_PORT_INPUT}
    ...    contains
    ...    enabled
    ...    message=Authentication Port input should be enabled (editable).

Password input text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_PASSWORD_INPUT}    ==    ${text}

Password input should be enabled
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_PASSWORD_INPUT}
    ...    contains
    ...    enabled
    ...    message=Password input should be enabled (editable).

Delete settings button should be visible
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_DELETE_BUTTON} 
    ...    contains
    ...    visible

Rows per page select title should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT_TEXT}    ==    ${text}

Rows per page select for pagination should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT}    ==    ${text}
   
Rows per page select should be enabled
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_PAGINATION_SELECT}
    ...    contains
    ...    enabled
    ...    message=Pagination select should be enabled (editable).

Pagination number text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_PAGINATION_NUMBER_TEXT}    ==    ${text}

Pagination button before should be visible
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_PAGINATION_BUTTON_BEFORE} 
    ...    contains
    ...    visible

Pagination button after should be visible
    Get element states
    ...    ${WIRELESS_RADIUS_PAGE_PAGINATION_BUTTON_AFTER} 
    ...    contains
    ...    visible

Save settings button text should be "${text}"
    Get text    ${WIRELESS_RADIUS_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
