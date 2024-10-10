*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource
Resource    ../../../../resources/common/common_variables.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                              xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                                     xpath=//*[@id="sidebar-options-menu"]/div[2]/div/div
${SIDEMENU_NETWORK_WAN}                                                         xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[2]/p


###############################################
#             Variables (global)              #     
###############################################


${NETWORK_WAN_PAGE_INNER_TITLE}                                                 data-testid=inner-title

${NETWORK_WAN_PAGE_POP_UP_TITLE}                                                data-testid=card-inner-title
${NETWORK_WAN_PAGE_POP_UP_TEXT}                                                 data-testid=card-inner-text
${NETWORK_WAN_PAGE_CLOSE_POP_UP_BUTTON}                                         data-testid=close-button

${NETWORK_WAN_PAGE_SAVE_SETTINGS_BUTTON}                                        xpath=//*[@id="root"]/div[3]/div/div[3]/button


###############################################
#          Variables (ipv4)                   #     
###############################################


${NETWORK_WAN_PAGE_IPV4_SETTINGS_BUTTON}                                        data-testid=ipv4-settings-button

${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT_TITLE}                               data-testid=ipv4-config-mode-select-title
${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT}                                     data-testid=ipv4-config-mode-select
${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT_DROPDOWN}                            data-testid=ipv4-config-mode-select-ul

${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE_TEXT}                               data-testid=ipv4-clone-mac-address-toggle-title
${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE}                                    data-testid=ipv4-clone-mac-address-toggle
${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE_CLICKABLE}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div[2]/label

${NETWORK_WAN_PAGE_MAC_ADDRESS_INPUT_TITLE}                                     data-testid=ipv4-clone-mac-address-input-title
${NETWORK_WAN_PAGE_MAC_ADDRESS_INPUT}                                           data-testid=ipv4-clone-mac-address-input

${NETWORK_WAN_PAGE_IPV4_ADDRESS_INPUT_TITLE}                                    data-testid=ipv4-manual-ip-address-input-title
${NETWORK_WAN_PAGE_IPV4_ADDRESS_INPUT}                                          data-testid=ipv4-manual-ip-address-input

${NETWORK_WAN_PAGE_SUBNET_MASK_INPUT_TITLE}                                     data-testid=ipv4-manual-netmask-input-title
${NETWORK_WAN_PAGE_SUBNET_MASK_INPUT}                                           data-testid=ipv4-manual-netmask-input

${NETWORK_WAN_PAGE_IPV4_GATEWAY_INPUT_TITLE}                                    data-testid=ipv4-manual-gateway-input-title
${NETWORK_WAN_PAGE_IPV4_GATEWAY_INPUT}                                          data-testid=ipv4-manual-gateway-input

${NETWORK_WAN_PAGE_MPPE_TOGGLE_TEXT}                                            data-testid=ipv4-pppoe-mppe-toggle-title
${NETWORK_WAN_PAGE_MPPE_TOGGLE}                                                 data-testid=ipv4-pppoe-mppe-toggle

${NETWORK_WAN_PAGE_SERVICE_NAME_INPUT_TITLE}                                    data-testid=ipv4-pppoe-service-name-input-title
${NETWORK_WAN_PAGE_SERVICE_NAME_INPUT}                                          data-testid=ipv4-pppoe-service-name-input

${NETWORK_WAN_PAGE_USER_INPUT_TITLE}                                            data-testid=ipv4-pppoe-username-input-title
${NETWORK_WAN_PAGE_USER_INPUT}                                                  data-testid=ipv4-pppoe-username-input

${NETWORK_WAN_PAGE_PASSWORD_INPUT_TITLE}                                        data-testid=ipv4-pppoe-password-input-title
${NETWORK_WAN_PAGE_PASSWORD_INPUT}                                              data-testid=ipv4-pppoe-password-input

${NETWORK_WAN_PAGE_PASSWORD_REVEALER}                                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[7]/div/span[2] >> svg

${NETWORK_WAN_PAGE_MTU_INPUT_TITLE}                                             data-testid=ipv4-mtu-input-title
${NETWORK_WAN_PAGE_MTU_INPUT}                                                   data-testid=ipv4-mtu-input

${NETWORK_WAN_PAGE_VLAN_TOGGLE_TEXT}                                            data-testid=ipv4-vlan-toggle-title
${NETWORK_WAN_PAGE_VLAN_TOGGLE}                                                 data-testid=ipv4-vlan-toggle
${NETWORK_WAN_PAGE_VLAN_TOGGLE_CLICKABLE}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[10]/div[2]/label

${NETWORK_WAN_PAGE_VLAN_ID_INPUT_TITLE}                                         data-testid=ipv4-vlan-id-input-title
${NETWORK_WAN_PAGE_VLAN_ID_INPUT}                                               data-testid=ipv4-vlan-id-input


###############################################
#          Variables (ipv6)                   #     
###############################################


${NETWORK_WAN_PAGE_IPV6_SETTINGS_BUTTON}                                        data-testid=ipv6-settings-button

${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT_TITLE}                               data-testid=ipv6-config-mode-select-title
${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT}                                     data-testid=ipv6-config-mode-input
${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}                            data-testid=ipv6-config-mode-select

${NETWORK_WAN_PAGE_LINK_LOCAL_TITLE}                                            data-testid=ipv6-link-local-title
${NETWORK_WAN_PAGE_LINK_LOCAL}                                                  data-testid=ipv6-link-local

${NETWORK_WAN_PAGE_IPV6_ADDRESS_INPUT_TITLE}                                    data-testid=ipv6-manual-ip-address-input-title
${NETWORK_WAN_PAGE_IPV6_ADDRESS_INPUT}                                          data-testid=ipv6-manual-ip-address-input

${NETWORK_WAN_PAGE_PREFIX_LENGTH_INPUT_TITLE}                                   data-testid=ipv6-manual-prefix-length-input-title
${NETWORK_WAN_PAGE_PREFIX_LENGTH_INPUT}                                         data-testid=ipv6-manual-prefix-length-input

${NETWORK_WAN_PAGE_IPV6_GATEWAY_INPUT_TITLE}                                    data-testid=ipv6-manual-gateway-input-title
${NETWORK_WAN_PAGE_IPV6_GATEWAY_INPUT}                                          data-testid=ipv6-manual-gateway-input


*** Keywords ***
Access WAN network settings page
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

    ${wan_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_WAN}
    ...    contains
    ...    visible

    IF    not ${wan_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_WAN}
        ...    visible
        ...    5s
        ...    WAN network submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_WAN}
    Sleep    1s
    Wait until network is idle    30s
    Wait for elements state
    ...    ${NETWORK_WAN_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    30s


###############################################
#              Keywords (global)              #     
###############################################


Page inner title WAN page should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_INNER_TITLE}    ==    ${text}

[WAN] pop up title should be "${text}"
    ...    [Documentation]    This pop up appears only in bridge mode
    Get text    ${NETWORK_WAN_PAGE_POP_UP_TITLE}    ==    ${text}

[WAN] pop up text should be "${text}"
    ...    [Documentation]    This pop up appears only in bridge mode
    Get text    ${NETWORK_WAN_PAGE_POP_UP_TEXT}    ==    ${text}

[WAN] button text should be "${text}"
    ...    [Documentation]    This pop up appears only in bridge mode
    Get text    ${NETWORK_WAN_PAGE_CLOSE_POP_UP_BUTTON}     ==    ${text}

Close WAN pop up
    Click    ${NETWORK_WAN_PAGE_CLOSE_POP_UP_BUTTON}

Save settings button text WAN should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}


###############################################
#              Keywords (ipv4)                #     
###############################################


Open IPv4 settings
    Click    ${NETWORK_WAN_PAGE_IPV4_SETTINGS_BUTTON}

IPv4 configuration type select title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT_TITLE}    ==    ${text}

IPv4 configuration type select option should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT}    ==    ${text}

Open IPv4 configuration type selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${NETWORK_WAN_PAGE_IPV4_CONFIG_TYPE_SELECT}
    END

Select IPv4 configuration type "${text}"
    Open IPv4 configuration type selection dropdown menu

    ${ipv4_elem_list}    Get elements    css=[data-testid="ipv4-config-mode-select-ul"] li
    FOR    ${ipv4_elem}    IN    @{ipv4_elem_list}
        ${ipv4_text}    Get text    ${ipv4_elem}
        IF    "${ipv4_text}" == "${text}"
            Click    ${ipv4_elem}
            Get element states
            ...    [data-testid="ipv4-config-mode-select-ul"]
            ...    not contains
            ...    visible
            ...    message=IPv4 configuration type dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    IPv4 configuration type ${text} is not available.

There should be "${number}" IPv4 configuration type available
    Open IPv4 configuration type selection dropdown menu

    ${ipv4_elem_list}    Get elements    css=[data-testid="ipv4-config-mode-select-ul"] li
    ${list_length}    Get length    ${ipv4_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} IPv4 configuration type available, but there was ${list_length}.
    ...    values=${false}

IPv4 configuration type "${text}" should be available
    Select IPv4 configuration type "${text}"

Clone MAC address toggle text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE_TEXT}    ==    ${text}

Clone MAC address toggle should be disabled
    ${element_states}    Get element states    ${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE}
    Should Contain    ${element_states}    unchecked   Clone MAC address toggle should be disabled (editable).

Enable MAC address toggle
    ${checked}    Get checkbox state    ${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${NETWORK_WAN_PAGE_CLONE_MAC_ADDRESS_TOGGLE}    checked

MAC address input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_MAC_ADDRESS_INPUT_TITLE}    ==    ${text}

Value of the MAC address should be
    [Arguments]    ${expected_pattern}
    ${mac_value}    Get Text    ${NETWORK_WAN_PAGE_MAC_ADDRESS_INPUT}
    Should Match Regexp    ${mac_value}    ${expected_pattern}    msg=MAC address value does not match expected pattern
    Log To Console    MAC: ${mac_value}

MAC address input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_MAC_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=MAC address input should be enabled (editable).

IPv4 address input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV4_ADDRESS_INPUT_TITLE}    ==    ${text}

Value of the IPv4 should be
    [Arguments]    ${expected_pattern}
    ${ipv4_value}    Get Text    ${NETWORK_WAN_PAGE_IPV4_ADDRESS_INPUT}
    Should Match Regexp    ${ipv4_value}    ${expected_pattern}    msg=IPv4 value does not match expected pattern
    Log To Console    IPv4: ${ipv4_value}
 
IPv4 address input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_IPV4_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=IPv4 address input should be enabled (editable).

Subnet mask input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_SUBNET_MASK_INPUT_TITLE}    ==    ${text}

Value of the mask should be
    [Arguments]    ${expected_pattern}
    ${mask_value}    Get Text    ${NETWORK_WAN_PAGE_SUBNET_MASK_INPUT}
    Should Match Regexp    ${mask_value}    ${expected_pattern}    msg=Mask value does not match expected pattern
    Log To Console    Mask: ${mask_value}
 
Subnet mask input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_SUBNET_MASK_INPUT}
    ...    contains
    ...    enabled
    ...    message=Subnet mask input should be enabled (editable).

Gateway IPv4 input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV4_GATEWAY_INPUT_TITLE}    ==    ${text}

Value of the gateway IPv4 should be
    [Arguments]    ${expected_pattern}
    ${gateway_value}    Get Text    ${NETWORK_WAN_PAGE_IPV4_GATEWAY_INPUT}
    Should Match Regexp    ${gateway_value}    ${expected_pattern}    msg=Gateway IPv4 value does not match expected pattern
    Log To Console    Gateway IPv4: ${gateway_value}
 
Gateway IPv4 input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_IPV4_GATEWAY_INPUT}
    ...    contains
    ...    enabled
    ...    message=Gateway IPv4 input should be enabled (editable).

MPPE toggle text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_MPPE_TOGGLE_TEXT}    ==    ${text}

MPPE toggle should be disabled
    ${element_states}    Get element states    ${NETWORK_WAN_PAGE_MPPE_TOGGLE}
    Should Contain    ${element_states}    unchecked   MPPE toggle should be disabled (editable).

Service name input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_SERVICE_NAME_INPUT_TITLE}    ==    ${text}

Service name input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_SERVICE_NAME_INPUT}    ==    ${text}

Service name input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_SERVICE_NAME_INPUT}
    ...    contains
    ...    enabled
    ...    message=Service name input should be enabled (editable).

User input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_USER_INPUT_TITLE}    ==    ${text}

User input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_USER_INPUT}    ==    ${text}

User input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_USER_INPUT}
    ...    contains
    ...    enabled
    ...    message=User input should be enabled (editable).
    
Password input title should be "${text}" for WAN screen
    Get text    ${NETWORK_WAN_PAGE_PASSWORD_INPUT_TITLE}    ==    ${text}

Password input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_PASSWORD_INPUT}    ==    ${text}

Password input should be enabled for WAN screen
    Get element states
    ...    ${NETWORK_WAN_PAGE_PASSWORD_INPUT}
    ...    contains
    ...    enabled
    ...    message=Password input should be enabled (editable).

Password revealer should be visible for WAN screen
    Get element states
    ...    ${NETWORK_WAN_PAGE_PASSWORD_REVEALER}
    ...    contains
    ...    visible

MTU input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_MTU_INPUT_TITLE}    ==    ${text}

MTU input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_MTU_INPUT}    ==    ${text}

MTU input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_MTU_INPUT}
    ...    contains
    ...    enabled
    ...    message=MTU input should be enabled (editable).

VLAN toggle text should be "${text}" for WAN screen
    Get text    ${NETWORK_WAN_PAGE_VLAN_TOGGLE_TEXT}    ==    ${text}

VLAN toggle should be disabled for WAN screen
    ${element_states}    Get element states    ${NETWORK_WAN_PAGE_VLAN_TOGGLE}
    Should Contain    ${element_states}    unchecked   VLAN toggle should be disabled (editable).

Enable VLAN toggle for WAN screen
    ${checked}    Get checkbox state    ${NETWORK_WAN_PAGE_VLAN_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${NETWORK_WAN_PAGE_VLAN_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${NETWORK_WAN_PAGE_VLAN_TOGGLE}    checked

VLAN input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_VLAN_ID_INPUT_TITLE}    ==    ${text}

VLAN input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_VLAN_ID_INPUT}
    ...    contains
    ...    enabled
    ...    message=VLAN input should be enabled (editable).


###############################################
#              Keywords (ipv6)                #     
###############################################


Open IPv6 settings
    Click    ${NETWORK_WAN_PAGE_IPV6_SETTINGS_BUTTON}

IPv6 configuration type select title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT_TITLE}    ==    ${text}

IPv6 configuration type select option should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT}    ==    ${text}

Open IPv6 configuration type selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${NETWORK_WAN_PAGE_IPV6_CONFIG_TYPE_SELECT}
    END

Select IPv6 configuration type "${text}"
    Open IPv6 configuration type selection dropdown menu

    ${ipv6_elem_list}    Get elements    css=[data-testid="ipv6-config-mode-select"] li
    FOR    ${ipv6_elem}    IN    @{ipv6_elem_list}
        ${ipv6_text}    Get text    ${ipv6_elem}
        IF    "${ipv6_text}" == "${text}"
            Click    ${ipv6_elem}
            Get element states
            ...    [data-testid="ipv4-config-mode-select-ul"]
            ...    not contains
            ...    visible
            ...    message=IPv6 configuration type dropdown did not automatically close upon selection.
            RETURN
        END
    END
    Fail    IPv6 configuration type ${text} is not available.

There should be "${number}" IPv6 configuration type available
    Open IPv6 configuration type selection dropdown menu

    ${ipv6_elem_list}    Get elements    css=[data-testid="ipv6-config-mode-select"] li
    ${list_length}    Get length    ${ipv6_elem_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} IPv6 configuration type available, but there was ${list_length}.
    ...    values=${false}

IPv6 configuration type "${text}" should be available
    Select IPv6 configuration type "${text}"

Link local title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_LINK_LOCAL_TITLE}    ==    ${text}

Link local text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_LINK_LOCAL}    ==    ${text}

IPv6 address input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV6_ADDRESS_INPUT_TITLE}    ==    ${text}

IPv6 address input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV6_ADDRESS_INPUT}    ==    ${text}

IPv6 address input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_IPV6_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=IPv6 address input should be enabled (editable).

Prefix length input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_PREFIX_LENGTH_INPUT_TITLE}    ==    ${text}

Prefix length input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_PREFIX_LENGTH_INPUT}    ==    ${text}

Prefix length input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_PREFIX_LENGTH_INPUT}
    ...    contains
    ...    enabled
    ...    message=Prefix length input should be enabled (editable).

Gateway IPv6 input title should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV6_GATEWAY_INPUT_TITLE}    ==    ${text}

Gateway IPv6 input text should be "${text}"
    Get text    ${NETWORK_WAN_PAGE_IPV6_GATEWAY_INPUT}    ==    ${text}

Gateway IPv6 input should be enabled
    Get element states
    ...    ${NETWORK_WAN_PAGE_IPV6_GATEWAY_INPUT}
    ...    contains
    ...    enabled
    ...    message=Gateway IPv6 input should be enabled (editable).
