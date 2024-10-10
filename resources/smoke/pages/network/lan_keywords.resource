*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource
Resource    lan_variables.resource


*** Keywords ***
Access LAN network settings page
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

    ${lan_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_NETWORK_LAN}
    ...    contains
    ...    visible

    IF    not ${lan_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_NETWORK_LAN}
        ...    visible
        ...    5s
        ...    LAN network submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_NETWORK_LAN}
    Sleep    1s
    Wait until network is idle    30s
    Wait for elements state
    ...    ${NETWORK_LAN_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    30s

Page inner title LAN page should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle LAN page should be "${text}"
    ${element_text}    Get text    ${NETWORK_LAN_PAGE_INNER_SUBTITLE}
    ${normalized_element_text}    Strip string    ${element_text}
    Should be equal as strings    ${normalized_element_text}    ${text}

Save settings button text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

#########################
#    IPv4 - keywords    #
#########################

IPv4 settings button text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_SETTINGS_BUTTON}    ==    ${text}

Automatic IPv4 address toggle title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_TITLE}    ==    ${text}

Automatic IPv4 address toggle switch should be on
    Get checkbox state    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE}    ==    checked
    ...    message=Automatic IPv4 address (DHCP client) should be enabled.

Open automatic IPv4 address info
    Click    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_ICON}

Close automatic IPv4 address info
    Click    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_CLOSE_BUTTON}

Automatic IPv4 address info modal text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_TEXT}    ==    ${text}

Static IPv4 address input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT_TITLE}    ==    ${text}

Static IPv4 address input should be enabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT}
    ...    contains
    ...    enabled
    ...    message=Static IPv4 address input should be enabled (editable).

Static IPv4 address should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT}    ==    ${text}

IPv4 subnet mask input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT_TITLE}    ==    ${text}

IPv4 subnet mask input should be enabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT}
    ...    contains
    ...    enabled
    ...    message=Subnet mask input should be enabled (editable).

IPv4 subnet mask should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT}    ==    ${text}

IPv4 default gateway input title should be "${text}"
    Get Text    ${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT_TITLE}    ==    ${text}

IPv4 default gateway input should be enabled
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT}
    ...    contains
    ...    enabled
    ...    message=Default gateway input should be enabled (editable).

IPv4 default gateway should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT}    ==    ${text}

#########################
#    IPv6 - keywords    #
#########################

IPv6 settings button text should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_SETTINGS_BUTTON}    ==    ${text}

Open IPv6 settings
    Click    ${NETWORK_LAN_PAGE_IPV6_SETTINGS_BUTTON}

IPv6 link-local should be visible
    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TITLE}
    ...    contains
    ...    visible
    ...    message=Link-local title should be visible.

    Get element states
    ...    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TEXT}
    ...    contains
    ...    visible
    ...    message=Link-local text should be visible.

IPv6 link-local should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TEXT}    ==    ${text}

IPv6 configuration type select title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_TITLE}    ==    ${text}

IPv6 configuration type select option should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT}    ==    ${text}

IPv6 link title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TITLE}    ==    ${text}

IPv6 link text should not be empty
    Should Not Be Empty    ${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TEXT}

Open IPv6 configuration type selection dropdown menu
    ${elem_states}    Get element states    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT}
    END
    Wait for elements state    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}    visible

Select IPv6 configuration type "${option}"
    Open IPv6 configuration type selection dropdown menu
    ${elements}    Get elements    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN} >> li

    FOR    ${element}    IN    @{elements}
        ${element_text}    Get text    ${element}
        ${normalized_element_text}    Set variable    ${element_text.lower().strip()}
        ${normalized_option}    Set variable    ${option.lower().strip()}
        IF    "${normalized_element_text}" == "${normalized_option}"
            Click    ${element}
            BREAK
        END
    END

There should be "${number}" LAN IPv6 configuration types available
    Open IPv6 configuration type selection dropdown menu
    ${elements}    Get elements    ${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN} >> li
    ${list_length}    Get length    ${elements}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} network LAN IPv6 configuration types available, but there were ${list_length}.
    ...    values=${false}

IPv6 configuration type "${text}" should be available
    Select IPv6 configuration type "${text}"

IPv6 address input title should be "${text}"
    ${str}    Get Text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT_TITLE}
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[0]    ${text}

IPv6 address input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

IPv6 prefix length input title should be "${text}"
    ${str}    Get Text    ${NETWORK_LAN_PAGE_IPV6_PREFIX_LENGTH_INPUT_TITLE}
    @{str_list}    Split string    ${str}    \n
    Should be equal as strings    ${str_list}[1]    ${text}

IPv6 prefix length input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}    ==    ${text}

IPv6 default gateway input title should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT_TITLE}    ==    ${text}

IPv6 default gateway input should be "${text}"
    Get text    ${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}    ==    ${text}
