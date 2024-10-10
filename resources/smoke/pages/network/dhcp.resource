*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                             xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_DHCP}                                                xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[4]/p
${SIDEMENU_NETWORK_LAN}                                                 xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[3]/p


###


${NETWORK_DHCP_PAGE_INNER_TITLE}                                        data-testid=inner-title

${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE}                                 data-testid=dhcp-server-enable-toggle
${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_CLICKABLE}                       xpath=//*[@id="root"]/div[3]/div/div[3]/div/label
${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_TEXT}                            data-testid=dhcp-server-enable-toggle-text

${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE}                data-testid=dns-rebind-protection-enable-toggle
${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_CLICKABLE}      xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/label
${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_TEXT}           data-testid=dns-rebind-protection-enable-toggle-text

${NETWORK_DHCP_PAGE_SAVE_SETTINGS_BUTTON}                               data-testid=save-button


*** Keywords ***
Access network DHCP settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get Element States
    ...    ${SIDEMENU_NETWORK_SUBMENU}
    ...    contains
    ...    visible

    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait For Elements State
        ...    ${SIDEMENU_NETWORK_SUBMENU}
        ...    visible
        ...    15s
        ...    Network submenu was not visible within the timeout period (15 seconds).
    END

    ${dhcp_option_is_visible}    Run keyword and return status
    ...    Get Element States
    ...    ${SIDEMENU_NETWORK_DHCP}
    ...    contains
    ...    visible

    IF    not ${dhcp_option_is_visible}
        Click    ${SIDEMENU_NETWORK_SUBMENU}
        Wait For Elements State
        ...    ${SIDEMENU_NETWORK_DHCP}
        ...    visible
        ...    15s
        ...    Network DHCP submenu option was not visible within the timeout period (15 seconds).
    END

    Click    ${SIDEMENU_NETWORK_DHCP}

    Wait Until Network Is Idle

Page inner title should be "${text}"
    Get Text    ${NETWORK_DHCP_PAGE_INNER_TITLE}    ==    ${text}

Wait until DHCP server modal is displayed
    Wait For Elements State    data-testid=dhcp-modal-text     visible    5s
    Wait Until Network Is Idle

DHCP server modal text should be "${text}"
    Get Text    data-testid=dhcp-modal-text    ==    ${text}

DHCP server modal button should be "${text}"
    Get Text    data-testid=dhcp-modal-ok-button   ==    ${text}

Disable cache DHCP enable toggle
    Click    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_CLICKABLE}
    Sleep    4s

Open DHCP server modal 
    Click    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_CLICKABLE}

Close DHCP server modal
    Click    data-testid=dhcp-modal-ok-button

DHCP enable toggle switch text should be "${text}"
    Wait For Elements State    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_TEXT}    visible    15s
    Get Text    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE_TEXT}    ==    ${text}

DHCP enable toggle switch should be on
    Get Checkbox State    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE}    ==    checked
    ...    DHCP server should be on.

DHCP enable toggle switch should be off
    Get Checkbox State    ${NETWORK_DHCP_PAGE_ENABLE_DHCP_TOGGLE}    ==    unchecked
    ...    DHCP server should be off.

DNS rebind attack protection toggle switch text should be "${text}"
    Wait For Elements State    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_TEXT}    visible    15s
    Get Text    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE_TEXT}    ==    ${text}

DNS rebind attack protection toggle switch should be on
    Get Checkbox State    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE}    ==    checked
    ...    DNS rebind attack protection should be on.

DNS rebind attack protection toggle switch should be off
    Get Checkbox State    ${NETWORK_DHCP_PAGE_ENABLE_DNS_REBIND_PROTECTION_TOGGLE}    ==    unchecked
    ...    DNS rebind attack protection should be off.

DNS rebind attack protection toggle switch should not be visible
    ${state}=    Get Element States    data-testid=dns-rebind-protection-enable-toggle
    Should Contain    ${state}    detached    DNS rebind attack protection toggle switch should not be visible.

DHCP pool initial IPv4 address input should not be visible
    ${state}=    Get Element States    data-testid=dhcp-pool-start-address-input
    Should Contain    ${state}    detached    DHCP pool initial IPv4 address input should not be visible.

DHCP pool final IPv4 address input should not be visible
    ${state}=    Get Element States    data-testid=dhcp-pool-end-address-input
    Should Contain    ${state}    detached    DHCP pool final IPv4 address input should not be visible.

DHCP pool lease time input should not be visible
    ${state}=    Get Element States    data-testid=dhcp-lease-time-input
    Should Contain    ${state}    detached    DHCP pool lease time input should not be visible.

MAC-IP bind table should not be visible
    ${state}=    Get Element States    xpath=//*[@id="form_row"]
    Should Contain    ${state}    detached    MAC-IP bind table should not be visible.
