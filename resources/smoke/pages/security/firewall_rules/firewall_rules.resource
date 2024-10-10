*** Settings ***
Library     Browser
Library     String
Library     Collections
Resource    ../../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                                 xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SECURITY_SUBMENU}                                                       xpath=//*[@id="sidebar-options-menu"]/div[6]/div
${SIDEMENU_SECURITY_FIREWALL_RULES}                                                xpath=//*[@id="sidebar-options-menu"]/div[6]/ul/div[3]/p


###############################################
#             Variables (global)              #     
###############################################


${SECURITY_FIREWALL_RULES_PAGE_INNER_TITLE}                                        xpath=//*[@data-testid="inner-title"]
${SECURITY_FIREWALL_RULES_PAGE_INNER_SUBTITLE}                                     xpath=//*[@data-testid="inner-subtitle"]

${SECURITY_FIREWALL_RULES_PAGE_POP_UP_TITLE}                                       xpath=//*[@id="overlay-cntse"]/div/div[1]/div
${SECURITY_FIREWALL_RULES_PAGE_POP_UP_TEXT}                                        xpath=//*[@id="overlay-cntse"]/div/div[2]
${SECURITY_FIREWALL_RULES_PAGE_CLOSE_POP_UP_BUTTON}                                xpath=//*[@id="overlay-cntse"]/div/div[3]/button

${SECURITY_FIREWALL_RULES_PAGE_RELEASE_TRAFFIC_BUTTON}                             xpath=//*[@id="root"]/div[3]/div/div[2]/span/button[1]
${SECURITY_FIREWALL_RULES_PAGE_BLOCK_TRAFFIC_BUTTON}                               xpath=//*[@id="root"]/div[3]/div/div[2]/span/button[2]

${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_INPUT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]
${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]/input

${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_TITLE}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT}                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/div/input
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTIONS_DROPDOWN}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTION_TCP_UDP}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul/li[1]
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTION_TCP}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul/li[2]
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTION_UDP}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div/div/ul/li[3]

${SECURITY_FIREWALL_RULES_PAGE_CREATE_BUTTON}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/button

${SECURITY_FIREWALL_RULES_PAGE_SAVE_SETTINGS_BUTTON}                               xpath=//*[@id="root"]/div[3]/div/div[3]/button


###############################################
#          Variables (control-by-mac)         #     
###############################################


${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_BLOCK_TRAFFIC_BUTTON}                xpath=//*[@id="root"]/div[3]/div/div[2]/span/button

${SECURITY_FIREWALL_RULES_PAGE_MAC_DESCRIPTION_INPUT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/input

${SECURITY_FIREWALL_RULES_PAGE_MAC_ADDRESS_INPUT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]
${SECURITY_FIREWALL_RULES_PAGE_MAC_ADDRESS_INPUT}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/input

${SECURITY_FIREWALL_RULES_PAGE_HEADER_BLOCK}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[1]/div[1]
${SECURITY_FIREWALL_RULES_PAGE_HEADER_MAC_DESCRIPTION}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[1]/div[2]
${SECURITY_FIREWALL_RULES_PAGE_HEADER_MAC}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[1]/div[3]

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_CHECKBOX}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[2]/div/div[1]/label/input

${SECURITY_FIREWALL_RULES_PAGE_MAC_SETTINGS_DELETE_BUTTON}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[2]/div/div[4]/div >> svg

${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_MAC_TABLE_INPUT}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[2]/div/div[2]/input

${SECURITY_FIREWALL_RULES_PAGE_MAC_INPUT}                                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[1]/div[2]/div/div[3]/input

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_SELECT_TEXT}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[2]/p[1]

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_SELECT}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[2]/select

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_NUMBER_TEXT}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[2]/p[2]

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_BUTTON_BEFORE}            xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[2]/button[1]
${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_BUTTON_AFTER}             xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/div[2]/button[2]


###############################################
#          Variables (control-by-ip)          #     
###############################################


${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_BUTTON}                               xpath=//*[@id="root"]/div[3]/div/ul/li[2]/button

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_CHECKBOX_TEXT}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[1]
${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_CHECKBOX}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[1]/div/label/input

${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT_TITLE}                             xpath=//*[@id="root"]/div[3]/div/div[2]
${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[10]/input

${SECURITY_FIREWALL_RULES_PAGE_HEADER_ENABLE}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[1]/div[1]
${SECURITY_FIREWALL_RULES_PAGE_HEADER_DESCRIPTION}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[1]/div[2]
${SECURITY_FIREWALL_RULES_PAGE_HEADER_ACTION}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[1]/div[3]
${SECURITY_FIREWALL_RULES_PAGE_HEADER_PROTOCOL}                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[1]/div[4]
${SECURITY_FIREWALL_RULES_PAGE_HEADER_IP_NETWORK}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[1]/div[5]

${SECURITY_FIREWALL_RULES_PAGE_ENABLE_IP_TABLE_CHECKBOX}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[1]/label/input

${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_IP_TABLE_INPUT}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[2]/input

${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[3]/div/div/div/div/input
${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTIONS_DROPDOWN}            xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[3]/div/div/div/ul
${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTION_TCP_UDP}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[3]/div/div/div/ul/li[1]
${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTION_TCP}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[3]/div/div/div/ul/li[2]

${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[4]/div/div/div/div/input
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTIONS_DROPDOWN}          xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[4]/div/div/div/ul
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTION_TCP_UDP}            xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[4]/div/div/div/ul/li[1]
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTION_TCP}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[4]/div/div/div/ul/li[2]
${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTION_UDP}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[4]/div/div/div/ul/li[3]

${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_TABLE_INPUT}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[5]/input

${SECURITY_FIREWALL_RULES_PAGE_IP_SETTINGS_DELETE_BUTTON}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[15]/div[2]/div/div[6]/div/div >> svg

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_SELECT_TEXT}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[16]/p[1]

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_SELECT}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[16]/select

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_NUMBER_TEXT}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[16]/p[2]

${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_BUTTON_BEFORE}             xpath=//*[@id="root"]/div[3]/div/div[2]/div[16]/button[1] 
${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_BUTTON_AFTER}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[16]/button[2]


*** Keywords ***
Access security firewall rules settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SECURITY_SUBMENU}
    ...    contains
    ...    visible

    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_SECURITY_SUBMENU}
        ...    visible
        ...    5s
        ...    Security firewall rules submenu was not visible (5 seconds timeout).
    END

    ${mgmt_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SECURITY_FIREWALL_RULES}
    ...    contains
    ...    visible

    IF    not ${mgmt_option_is_visible}
        Click    ${SIDEMENU_SECURITY_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SECURITY_FIREWALL_RULES}
        ...    visible
        ...    5s
        ...    Security firewall rules submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SECURITY_FIREWALL_RULES}


###############################################
#              Keywords (global)              #     
###############################################


Firewall rules page inner title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_INNER_TITLE}    ==    ${text}

Firewall rules page inner subtitle should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_INNER_SUBTITLE}    ==    ${text}

Pop up screen only in router mode title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_POP_UP_TITLE}    ==    ${text}

Pop up screen only in router mode text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_POP_UP_TEXT}    ==    ${text}

Pop up button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CLOSE_POP_UP_BUTTON}     ==    ${text}

Close pop up
    Click    ${SECURITY_FIREWALL_RULES_PAGE_CLOSE_POP_UP_BUTTON}

Release traffic button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_RELEASE_TRAFFIC_BUTTON}    ==    ${text}

Block traffic button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_BLOCK_TRAFFIC_BUTTON}    ==    ${text}

Description input title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_INPUT_TITLE}    ==    ${text}

Description input should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input should be enabled (editable).

Protocol select title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_TITLE}    ==    ${text}

Protocol select option should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT}    ==    ${text}
   
Protocol select should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT}
    ...    contains
    ...    enabled
    ...    message=Protocol select should be enabled (editable).

Open Protocol selection dropdown menu
    ${elem_states}    Get element states    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT}
    END

Select Protocol "${option}"
    Open Protocol selection dropdown menu

    ${method_list}    Get elements    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${option}"
            Click    ${method_elem}
            Get element states
            ...    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${option} protocol available, but there were.
            RETURN
        END
    END
    Fail    protocol method ${option} is not available.

There should be "${number}" protocol available
    Open Protocol selection dropdown menu

    ${method_list}    Get elements    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} protocol available, but there were ${list_length}.
    ...    values=${false}

Protocol "${text}" should be available
    Select Protocol "${text}"

Create firewall rules button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CREATE_BUTTON}    ==    ${text}

Create firewall rule
    Click    ${SECURITY_FIREWALL_RULES_PAGE_CREATE_BUTTON}

Save settings firewall rules button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}


###############################################
#          Keywords (control-by-mac)          #     
###############################################


Block MAC traffic button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_BLOCK_TRAFFIC_BUTTON}    ==    ${text}

Description input in control by MAC should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_MAC_DESCRIPTION_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input in control by MAC should be enabled (editable).

MAC address input title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_MAC_ADDRESS_INPUT_TITLE}    ==    ${text}

MAC address input should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_MAC_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=MAC address input should be enabled (editable).

Control by MAC table headers should be
    [Arguments]    ${block_header_default}    ${description_header_default}    ${mac_header_default}      
    ${block}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_BLOCK}
    ${description}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_MAC_DESCRIPTION}
    ${mac}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_MAC}
    @{text_parts}=    Create List    ${block_header_default}    ${description_header_default}    ${mac_header_default}     
    Should Be Equal As Strings    ${block}    ${text_parts}[0]
    Should Be Equal As Strings    ${description.title()}    ${text_parts}[1]
    Should Be Equal As Strings    ${mac}    ${text_parts}[2]

Block checkbox present in the mac table should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_CHECKBOX}
    Should Contain    ${element_states}    checked    Enabled checkbox present in the mac table should be enabled (editable).

Description input text of present in the mac table should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_MAC_TABLE_INPUT}    ==    ${text}

Description input text of present in the mac table should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_MAC_TABLE_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input in the mac table should be enabled (editable).

MAC input text of present in the mac table should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_MAC_INPUT}    ==    ${text}

MAC input text of present in the mac table should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_MAC_INPUT}
    ...    contains
    ...    enabled
    ...    message=MAC input in the mac table should be enabled (editable).

Delete MAC settings button should be visible
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_MAC_SETTINGS_DELETE_BUTTON}
    ...    contains
    ...    visible
    ...    message=Delete MAC settings button should be visible (editable).

(Control by MAC) Rows per page select title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_SELECT_TEXT}    ==    ${text}

(Control by MAC) Rows per page select for pagination should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_SELECT}    ==    ${text}
   
(Control by MAC) Rows per page select should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_SELECT}
    ...    contains
    ...    enabled
    ...    message=Control by IP pagination select should be enabled (editable).

(Control by MAC) Pagination number text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_NUMBER_TEXT}    ==    ${text}

(Control by MAC) Pagination button before should be visible
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_BUTTON_BEFORE} 
    ...    contains
    ...    visible

(Control by MAC) Pagination button after should be visible
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_MAC_PAGINATION_BUTTON_AFTER} 
    ...    contains
    ...    visible


###############################################
#          Keywords (control-by-ip)           #     
###############################################


Access control by IP
    ...    Click    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_BUTTON} 

Control by IP checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_CHECKBOX_TEXT}    ==    ${text}

Control by IP checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_CHECKBOX}
    Should Contain    ${element_states}    checked   Control by IP checkbox should be enabled (editable).

IP / Network input title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT_TITLE}    ==    ${text}

IP / Network should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT}
    ...    contains
    ...    enabled
    ...    message=IP / Network input should be enabled (editable).

Enter IP / Network Address
    [Arguments]    ${ip_address}
    Wait For Elements State    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT}    visible    timeout=10s
    Click    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT}
    Fill Text    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_INPUT}    ${ip_address}

Control by IP table headers should be
    [Arguments]    ${enable_header_default}    ${description_header_default}    ${action_header_default}    ${protocol_header_default}    ${ip_network_header_default}   
    ${enable}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_ENABLE}
    ${description}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_DESCRIPTION}
    ${action}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_ACTION}
    ${protocol}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_PROTOCOL}
    ${ip_network}    Get Text    ${SECURITY_FIREWALL_RULES_PAGE_HEADER_IP_NETWORK}
    @{text_parts}=    Create List    ${enable_header_default}    ${description_header_default}    ${action_header_default}    ${protocol_header_default}    ${ip_network_header_default}       
    Should Be Equal As Strings    ${enable}    ${text_parts}[0]
    Should Be Equal As Strings    ${description.title()}    ${text_parts}[1]
    Should Be Equal As Strings    ${action}    ${text_parts}[2]
    Should Be Equal As Strings    ${protocol}    ${text_parts}[3]
    Should Be Equal As Strings    ${ip_network}    ${text_parts}[4]

Description input text of present in the ip table should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_IP_TABLE_INPUT}    ==    ${text}

Description input text of present in the ip table should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_DESCRIPTION_IP_TABLE_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input in the ip table should be enabled (editable).

Enabled checkbox present in the ip table should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_CHECKBOX}
    Should Contain    ${element_states}    checked    Enabled checkbox present in the ip table should be enabled (editable).

Action select option present in the ip table should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT}    ==    ${text}
   
Action select present in the ip table should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT}
    ...    contains
    ...    enabled
    ...    message=Action select present in the ip table should be enabled (editable).

Open Action selection dropdown menu present in the ip table
    ${elem_states}    Get element states    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT}
    END

Select Action present in the ip table "${option}"
    Open Action selection dropdown menu present in the ip table

    ${method_list}    Get elements    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${option}"
            Click    ${method_elem}
            Get element states
            ...    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${option} action present in the ip table available, but there were.
            RETURN
        END
    END
    Fail    action method present in the ip table ${option} is not available.

There should be "${number}" action present in the ip table available
    Open Action selection dropdown menu present in the ip table

    ${method_list}    Get elements    ${SECURITY_FIREWALL_RULES_PAGE_ACTION_IP_TABLE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} action present in the ip table available, but there were ${list_length}.
    ...    values=${false}

Action present in the ip table "${text}" should be available
    Select action present in the ip table "${text}"

Protocol select option present in the ip table should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT}    ==    ${text}
   
Protocol select present in the ip table should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT}
    ...    contains
    ...    enabled
    ...    message=Protocol select present in the ip table should be enabled (editable).

Open Protocol selection dropdown menu present in the ip table
    ${elem_states}    Get element states    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT}
    END

Select Protocol present in the ip table "${option}"
    Open Protocol selection dropdown menu present in the ip table

    ${method_list}    Get elements    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${option}"
            Click    ${method_elem}
            Get element states
            ...    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${option} protocol present in the ip table available, but there were.
            RETURN
        END
    END
    Fail    protocol method present in the ip table ${option} is not available.

There should be "${number}" protocol present in the ip table available
    Open Protocol selection dropdown menu present in the ip table

    ${method_list}    Get elements    ${SECURITY_FIREWALL_RULES_PAGE_PROTOCOL_IP_TABLE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} protocol present in the ip table available, but there were ${list_length}.
    ...    values=${false}

Protocol present in the ip table "${text}" should be available
    Select protocol present in the ip table "${text}"

IP / Network input text of present in the table should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_TABLE_INPUT}    ==    ${text}

IP / Network input text of present in the table should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_IP_NETWORK_TABLE_INPUT}
    ...    contains
    ...    enabled
    ...    message=IP / Network input in the table should be enabled (editable).

Delete IP settings button should be visible
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_IP_SETTINGS_DELETE_BUTTON}
    ...    contains
    ...    visible
    ...    message=Delete IP settings button should be visible (editable).

(Control by IP) Rows per page select title should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_SELECT_TEXT}    ==    ${text}

(Control by IP) Rows per page select for pagination should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_SELECT}    ==    ${text}
   
(Control by IP) Rows per page select should be enabled
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_SELECT}
    ...    contains
    ...    enabled
    ...    message=Control by IP pagination select should be enabled (editable).

(Control by IP) Pagination number text should be "${text}"
    Get text    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_NUMBER_TEXT}    ==    ${text}

(Control by IP) Pagination button before should be visible
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_BUTTON_BEFORE} 
    ...    contains
    ...    visible

(Control by IP) Pagination button after should be visible
    Get element states
    ...    ${SECURITY_FIREWALL_RULES_PAGE_CONTROL_BY_IP_PAGINATION_BUTTON_AFTER} 
    ...    contains
    ...    visible
