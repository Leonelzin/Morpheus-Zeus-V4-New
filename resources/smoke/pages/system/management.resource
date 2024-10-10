*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SYSTEM_SUBMENU}                                              xpath=//*[@id="sidebar-options-menu"]/div[4]/div/div/div/div
${SIDEMENU_SYSTEM_MGMT}                                                 xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[1]/p

###

${MGMT_PAGE_INNER_TITLE}                                                xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${MGMT_PAGE_INNER_SUBTITLE}                                             xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${MGMT_PAGE_SESSION_TIME_TITLE}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]
${MGMT_PAGE_SESSION_TIME_INPUT}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/input

# HTTP
${MGMT_PAGE_HTTP_TAB_BUTTON}                                            xpath=//*[@id="root"]/div[3]/div/div[2]/ul/li[1]/button
${MGMT_PAGE_HTTP_TAB_TITLE}                                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]

${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[1]/label/input
${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX_CLICKABLE}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[1]/label/div
${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[1]/div

${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[3]/label/input
${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_CLICKABLE}         xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[3]/label/div
${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[3]/div

${MGMT_PAGE_HTTP_TAB_PORT_INPUT_TITLE}                                  ${EMPTY}
${MGMT_PAGE_HTTP_TAB_PORT_INPUT}                                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/input

# HTTPS
${MGMT_PAGE_HTTPS_TAB_BUTTON}                                           xpath=//*[@id="root"]/div[3]/div/div[2]/ul/li[2]/button
${MGMT_PAGE_HTTPS_TAB_TITLE}                                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]

${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_TITLE}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div[3]/div
${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div[3]/div/div/input
${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTIONS_DROPDOWN}      xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div[3]/div/ul
${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTION_DEFAULT}        xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div[3]/div/ul/li[1]/div
${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTION_CUSTOM}         xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div[3]/div/ul/li[2]/div

${MGMT_PAGE_HTTPS_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/label/input
${MGMT_PAGE_HTTPS_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_CLICKABLE}        xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/label/div
${MGMT_PAGE_HTTPS_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}             xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div

${MGMT_PAGE_HTTPS_TAB_PORT_INPUT_TITLE}                                 ${EMPTY}
${MGMT_PAGE_HTTPS_TAB_PORT_INPUT}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/input

${MGMT_PAGE_UPLOAD_CERTIFICATE_INPUT_TITLE}                             ${EMPTY}
${MGMT_PAGE_UPLOAD_CERTIFICATE_INPUT_PLACEHOLDER}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[2]/div/span
${MGMT_PAGE_UPLOAD_CERTIFICATE_INPUT_CLICKABLE}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[2]/div

${MGMT_PAGE_UPLOAD_KEY_INPUT_TITLE}                                     ${EMPTY}
${MGMT_PAGE_UPLOAD_KEY_INPUT_PLACEHOLDER}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[4]/div/span
${MGMT_PAGE_UPLOAD_KEY_INPUT_CLICKABLE}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[4]/div

# SSH
${MGMT_PAGE_SSH_TAB_BUTTON}                                             xpath=//*[@id="root"]/div[3]/div/div[2]/ul/li[3]/button
${MGMT_PAGE_SSH_TAB_TITLE}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]

${MGMT_PAGE_SSH_TAB_ENABLE_CHECKBOX}                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/label/input
${MGMT_PAGE_SSH_TAB_ENABLE_CHECKBOX_CLICKABLE}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div/div[1]/label/div
${MGMT_PAGE_SSH_TAB_ENABLE_CHECKBOX_TEXT}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div

${MGMT_PAGE_SSH_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[3]/label/input
${MGMT_PAGE_SSH_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_CLICKABLE}          xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[3]/label/div
${MGMT_PAGE_SSH_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[3]/div

${MGMT_PAGE_SSH_TAB_PORT_INPUT}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/input

# VLAN
${MGMT_PAGE_VLAN_TAB_BUTTON}                                            xpath=//*[@id="root"]/div[3]/div/div[2]/ul/li[4]/button
${MGMT_PAGE_VLAN_TAB_TITLE}                                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]

${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_TITLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div
${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/div/input
${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTIONS_DROPDOWN}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/ul
${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTION_DEACTIVATED}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/ul/li[1]/div
${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTION_ETHERNET}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/ul/li[2]/div

${MGMT_PAGE_VLAN_TAB_ID_INPUT}                                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/input

${MGMT_PAGE_SAVE_SETTINGS_BUTTON}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/button


*** Keywords ***
Access system management settings page
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
    ...    ${SIDEMENU_SYSTEM_MGMT}
    ...    contains
    ...    visible

    IF    not ${mgmt_option_is_visible}
        Click    ${SIDEMENU_SYSTEM_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SYSTEM_MGMT}
        ...    visible
        ...    5s
        ...    System management submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SYSTEM_MGMT}

    Wait for elements state
    ...    ${MGMT_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    System management page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${MGMT_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${MGMT_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Session time input title should be "${text}"
    Get text    ${MGMT_PAGE_SESSION_TIME_TITLE}    ==    ${text}

Session time should be "${text}"
    Get text    ${MGMT_PAGE_SESSION_TIME_INPUT}    ==    ${text}

HTTP settings tab should be open
    Get element states
    ...    ${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX_CLICKABLE}
    ...    contains
    ...    visible

    Get element states
    ...    ${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX_TEXT}
    ...    contains
    ...    visible

    Get element states
    ...    ${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_CLICKABLE}
    ...    contains
    ...    visible

    Get element states
    ...    ${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}
    ...    contains
    ...    visible

    Get element states
    ...    ${MGMT_PAGE_HTTP_TAB_PORT_INPUT}
    ...    contains
    ...    visible

Save settings button text should be "${text}"
    Get text    ${MGMT_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

##############
#    HTTP    #
##############

Open HTTP settings tab
    Click    ${MGMT_PAGE_HTTP_TAB_BUTTON}
    Wait for elements state
    ...    ${MGMT_PAGE_HTTP_TAB_PORT_INPUT}
    ...    visible
    ...    5s
    ...    HTTP settings were not visible (5 seconds timeout, searched for HTTP port input).

HTTP tab inner title should be "${text}"
    Get text    ${MGMT_PAGE_HTTP_TAB_TITLE}    ==    ${text}

HTTP enable checkbox should be checked
    Get checkbox state    ${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX}    ==    checked
    ...    HTTP enable checkbox should be checked.

HTTP enable checkbox text should be "${text}"
    Get text    ${MGMT_PAGE_HTTP_TAB_ENABLE_CHECKBOX_TEXT}    ==    ${text}

HTTP brute force attack protection checkbox should be checked
    Get checkbox state    ${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX}    ==    checked
    ...    HTTP brute force attack protection checkbox should be checked.

HTTP brute force attack protection checkbox text should be "${text}"
    Get text    ${MGMT_PAGE_HTTP_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}    ==    ${text}

HTTP port input title should be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[2]    ${text}

HTTP port input placeholder should be "${text}"
    Get attribute
    ...    ${MGMT_PAGE_HTTP_TAB_PORT_INPUT}
    ...    placeholder    ==    ${text}

HTTP port should be "${text}"
    Get text    ${MGMT_PAGE_HTTP_TAB_PORT_INPUT}    ==    ${text}

###############
#    HTTPS    #
###############

Open HTTPS settings tab
    Click    ${MGMT_PAGE_HTTPS_TAB_BUTTON}

    Wait for elements state
    ...    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT}
    ...    visible
    ...    5s
    ...    HTTPS settings were not visible (5 seconds timeout, searched for HTTPS certificate and key select).

HTTPS tab inner title should be "${text}"
    Get text    ${MGMT_PAGE_HTTPS_TAB_TITLE}    ==    ${text}

HTTPS brute force attack protection checkbox should be checked
    Get checkbox state    ${MGMT_PAGE_HTTPS_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX}    ==    checked
    ...    HTTPS brute force attack protection checkbox should be checked.

HTTPS brute force attack protection checkbox text should be "${text}"
    Get text    ${MGMT_PAGE_HTTPS_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}    ==    ${text}

HTTPS port input title should be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

HTTPS port input placeholder should be "${text}"
    Get attribute
    ...    ${MGMT_PAGE_HTTPS_TAB_PORT_INPUT}
    ...    placeholder    ==    ${text}

HTTPS port should be "${text}"
    Get text    ${MGMT_PAGE_HTTPS_TAB_PORT_INPUT}    ==    ${text}

HTTPS certificate and key select title should be "${text}"
    Get text    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_TITLE}    ==    ${text}

HTTPS certificate and key select option should be "${text}"
    Get text    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT}    ==    ${text}

Open HTTPS certificate and key selection dropdown menu
    ${elem_states}    Get element states    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT}
    END

    Wait for elements state
    ...    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTIONS_DROPDOWN}
    ...    visible
    ...    5s
    ...    HTTPS certificate and key select dropdown was not visible (5 seconds timeout).

HTTPS certificate and key "${text}" select option should be available
    Open HTTPS certificate and key selection dropdown menu

    ${cert_elem_list}    Get elements    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${cert_elem}    IN    @{cert_elem_list}
        ${cert_text}    Get text    ${cert_elem}
        IF    "${cert_text}" == "${text}"
            Click    ${cert_elem}
            Get element states
            ...    ${MGMT_PAGE_HTTPS_TAB_CERTIFICATE_AND_KEY_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=HTTPS certificate and key dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    HTTPS certificate and key select option ${text} is not available.

HTTPS certificate upload input title shoulde be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[2]
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

HTTPS certificate upload input placeholder should be "${text}"
    Get text    ${MGMT_PAGE_UPLOAD_CERTIFICATE_INPUT_PLACEHOLDER}    ==    ${text}

HTTPS key upload input title shoulde be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[2]
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[2]    ${text}

HTTPS key upload input placeholder should be "${text}"
    Get text    ${MGMT_PAGE_UPLOAD_KEY_INPUT_PLACEHOLDER}    ==    ${text}

#############
#    SSH    #
#############

Open SSH settings tab
    Click    ${MGMT_PAGE_SSH_TAB_BUTTON}

    Wait for elements state
    ...    ${MGMT_PAGE_SSH_TAB_PORT_INPUT}
    ...    visible
    ...    5s
    ...    SSH settings were not visible (5 seconds timeout, searched for SSH port input).

SSH tab inner title should be "${text}"
    Get text    ${MGMT_PAGE_SSH_TAB_TITLE}    ==    ${text}

SSH enable checkbox should be checked
    Get checkbox state    ${MGMT_PAGE_SSH_TAB_ENABLE_CHECKBOX}    ==    checked
    ...    SSH enable checkbox should be checked.

SSH enable checkbox text should be "${text}"
    Get text    ${MGMT_PAGE_SSH_TAB_ENABLE_CHECKBOX_TEXT}    ==    ${text}

SSH brute force attack protection checkbox should be checked
    Get checkbox state    ${MGMT_PAGE_SSH_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX}    ==    checked
    ...    SSH brute force attack protection checkbox should be checked.

SSH brute force attack protection checkbox text should be "${text}"
    Get text    ${MGMT_PAGE_SSH_TAB_BRUTE_FORCE_PROTECTION_CHECKBOX_TEXT}    ==    ${text}

SSH port input title should be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[2]    ${text}

SSH port input placeholder should be "${text}"
    Get attribute
    ...    ${MGMT_PAGE_SSH_TAB_PORT_INPUT}
    ...    placeholder    ==    ${text}

SSH port should be "${text}"
    Get text    ${MGMT_PAGE_SSH_TAB_PORT_INPUT}    ==    ${text}

##############
#    VLAN    #
##############

Open VLAN settings tab
    Click    ${MGMT_PAGE_VLAN_TAB_BUTTON}

    Wait for elements state
    ...    ${MGMT_PAGE_VLAN_TAB_ID_INPUT}
    ...    visible
    ...    5s
    ...    VLAN settings were not visible (5 seconds timeout, searched for VLAN ID input).

VLAN tab inner title should be "${text}"
    Get text    ${MGMT_PAGE_VLAN_TAB_TITLE}    ==    ${text}

VLAN interface input title should be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[1]    ${text}

VLAN ID input title should be "${text}"
    # TODO: report problem to WEB developers (can't access this element directly)
    ${str}    Get Text    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]
    @{str_list}    Split String    ${str}    \n
    Should be equal as strings    ${str_list}[1]    ${text}

VLAN ID should be "${text}"
    Get text    ${MGMT_PAGE_VLAN_TAB_ID_INPUT}    ==    ${text}

VLAN interface select title should be "${text}"
    Get text    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_TITLE}    ==    ${text}

VLAN interface select option should be "${text}"
    Get text    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT}    ==    ${text}

VLAN ID input should be enabled
    Get element states
    ...    ${MGMT_PAGE_VLAN_TAB_ID_INPUT}
    ...    contains
    ...    enabled
    ...    message=VLAN ID input should be enabled.

VLAN ID input should be visible
    Get element states
    ...    ${MGMT_PAGE_VLAN_TAB_ID_INPUT}
    ...    contains
    ...    visible
    ...    message=VLAN ID input should be visible.

VLAN ID input should not be visible
    Get element states
    ...    ${MGMT_PAGE_VLAN_TAB_ID_INPUT}
    ...    contains
    ...    hidden
    ...    message=VLAN ID input should not be visible.

Open VLAN interface selection dropdown menu
    ${elem_states}    Get element states    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT}
    END

Select VLAN interface "${text}" option
    Open VLAN interface selection dropdown menu
    Click    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTION_ETHERNET}

VLAN interface "${text}" select option should be available
    Open VLAN interface selection dropdown menu

    ${vlan_ifaces_elem_list}    Get elements    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${vlan_iface_elem}    IN    @{vlan_ifaces_elem_list}
        ${vlan_iface_text}    Get text    ${vlan_iface_elem}
        IF    "${vlan_iface_text}" == "${text}"
            Click    ${vlan_iface_elem}
            Get element states
            ...    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=VLAN interface dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    VLAN interface ${text} is not available.

There should be "${number}" VLAN interfaces available
    Open VLAN interface selection dropdown menu

    ${levels_elem_list}    Get elements    ${MGMT_PAGE_VLAN_TAB_INTERFACE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${levels_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} VLAN interfaces available, but there was ${list_length}.
    ...    values=${false}
