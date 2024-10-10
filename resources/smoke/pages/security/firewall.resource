*** Settings ***
Library     Browser
Library     String
Library     Collections
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                           xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SECURITY_SUBMENU}                                                 xpath=//*[@id="sidebar-options-menu"]/div[6]/div
${SIDEMENU_SECURITY_FIREWALL}                                                xpath=//*[@id="sidebar-options-menu"]/div[6]/ul/div[1]/p


###


${SECURITY_FIREWALL_PAGE_INNER_TITLE}                                        xpath=//*[@data-testid="inner-title"]
${SECURITY_FIREWALL_PAGE_INNER_SUBTITLE}                                     xpath=//*[@data-testid="inner-subtitle"]

${SECURITY_FIREWALL_PAGE_ENABLE_FIREWALL_TOGGLE_TEXT}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div/div[2]
${SECURITY_FIREWALL_PAGE_ENABLE_FIREWALL_TOGGLE}                             xpath=//*[@data-testid="enabledFirewall"]

${SECURITY_FIREWALL_PAGE_ENABLE_WAN_CHECKBOX_TEXT}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div[1]
${SECURITY_FIREWALL_PAGE_ENABLE_WAN_CHECKBOX}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div[1]/label/input

${SECURITY_FIREWALL_PAGE_ENABLE_UPNP_CHECKBOX_TEXT}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div[2]
${SECURITY_FIREWALL_PAGE_ENABLE_UPNP_CHECKBOX}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div[2]/label/input

${SECURITY_FIREWALL_SECURITY_PAGE_INNER_TITLE}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[2] 

${SECURITY_FIREWALL_PAGE_ACTIVATE_ALL_TOGGLE_TEXT}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div[2]
${SECURITY_FIREWALL_PAGE_ACTIVATE_ALL_TOGGLE}                                xpath=//*[@data-testid="checkAllOptions"]

${SECURITY_FIREWALL_PAGE_ICMP_FLOOD_ATTACK_CHECKBOX_TEXT}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]
${SECURITY_FIREWALL_PAGE_ICMP_FLOOD_ATTACK_CHECKBOX}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[1]/label/input

${SECURITY_FIREWALL_PAGE_TCP_FLOOD_ATTACK_CHECKBOX_TEXT}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]
${SECURITY_FIREWALL_PAGE_TCP_FLOOD_ATTACK_CHECKBOX}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[2]/label/input

${SECURITY_FIREWALL_PAGE_UDP_FLOOD_ATTACK_CHECKBOX_TEXT}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[3]
${SECURITY_FIREWALL_PAGE_UDP_FLOOD_ATTACK_CHECKBOX}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[3]/label/input

${SECURITY_FIREWALL_PAGE_PORT_SCANNING_CHECKBOX_TEXT}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[4]
${SECURITY_FIREWALL_PAGE_PORT_SCANNING_CHECKBOX}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[4]/label/input

${SECURITY_FIREWALL_PAGE_IP_SPOOFING_CHECKBOX_TEXT}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[5]
${SECURITY_FIREWALL_PAGE_IP_SPOOFING_CHECKBOX}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[5]/label/input

${SECURITY_FIREWALL_PAGE_INVALID_PACKAGES_CHECKBOX_TEXT}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[6]/span/label
${SECURITY_FIREWALL_PAGE_INVALID_PACKAGES_CHECKBOX}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div[6]/label/input

${SECURITY_FIREWALL_PAGE_SAVE_SETTINGS_BUTTON}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/button


*** Keywords ***
Access security firewall settings page
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
        ...    Security firewall submenu was not visible (5 seconds timeout).
    END

    ${mgmt_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SECURITY_FIREWALL}
    ...    contains
    ...    visible

    IF    not ${mgmt_option_is_visible}
        Click    ${SIDEMENU_SECURITY_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SECURITY_FIREWALL}
        ...    visible
        ...    5s
        ...    Security firewall submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SECURITY_FIREWALL}

Firewall page inner title should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_INNER_TITLE}    ==    ${text}

Firewall page inner subtitle should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_INNER_SUBTITLE}    ==    ${text}

Enable Firewall toggle text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_ENABLE_FIREWALL_TOGGLE_TEXT}    ==    ${text}

Enable Firewall toggle should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_ENABLE_FIREWALL_TOGGLE}
    Should Contain    ${element_states}    detached   Enable Firewall toggle should be enabled (editable).

Enable WAN ping checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_ENABLE_WAN_CHECKBOX_TEXT}    ==    ${text}

Enable WAN ping checkbox should be disabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_ENABLE_WAN_CHECKBOX}
    Should Contain    ${element_states}    unchecked   Enable WAN ping checkbox should be enabled (editable).

Enable UPnP checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_ENABLE_UPNP_CHECKBOX_TEXT}    ==    ${text}

Enable UPnP checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_ENABLE_UPNP_CHECKBOX}
    Should Contain    ${element_states}    checked   Enable UPnP checkbox should be enabled (editable).

Firewall security title should be "${text}"
    Get text    ${SECURITY_FIREWALL_SECURITY_PAGE_INNER_TITLE}    ==    ${text}

Activate all toggle text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_ACTIVATE_ALL_TOGGLE_TEXT}    ==    ${text}

Activate all toggle should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_ACTIVATE_ALL_TOGGLE}
    Should Contain    ${element_states}    detached    Activate all toggle should be enabled (editable).

Defense against ICMP Flood attack checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_ICMP_FLOOD_ATTACK_CHECKBOX_TEXT}    ==    ${text}

Defense against ICMP Flood attack checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_ICMP_FLOOD_ATTACK_CHECKBOX}
    Should Contain    ${element_states}    checked    Defense against ICMP Flood attack checkbox should be enabled (editable).

Defense against TCP SYN Flood attack checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_TCP_FLOOD_ATTACK_CHECKBOX_TEXT}    ==    ${text}

Defense against TCP SYN Flood attack checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_TCP_FLOOD_ATTACK_CHECKBOX}
    Should Contain    ${element_states}    checked    Defense against TCP SYN Flood attack checkbox should be enabled (editable).

Defense against UDP Flood attack checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_UDP_FLOOD_ATTACK_CHECKBOX_TEXT}    ==    ${text}

Defense against UDP Flood attack checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_UDP_FLOOD_ATTACK_CHECKBOX}
    Should Contain    ${element_states}    checked    Defense against UDP Flood attack checkbox should be enabled (editable).

Defense against port scanning / Invalid TCP Flags checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_PORT_SCANNING_CHECKBOX_TEXT}    ==    ${text}

Defense against port scanning / Invalid TCP Flags checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_PORT_SCANNING_CHECKBOX}
    Should Contain    ${element_states}    checked   Defense against port scanning / Invalid TCP Flags checkbox should be enabled (editable).

Defense against IP Spoofing checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_IP_SPOOFING_CHECKBOX_TEXT}    ==    ${text}

Defense against IP Spoofing checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_IP_SPOOFING_CHECKBOX}
    Should Contain    ${element_states}    checked   Defense against IP Spoofing checkbox should be enabled (editable).

Defense against invalid packages checkbox text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_INVALID_PACKAGES_CHECKBOX_TEXT}    ==    ${text}

Defense against invalid packages checkbox should be enabled
    ${element_states}    Get element states    ${SECURITY_FIREWALL_PAGE_INVALID_PACKAGES_CHECKBOX}
    Should Contain    ${element_states}    checked   Defense against invalid packages checkbox should be enabled (editable).

Save settings firewall button text should be "${text}"
    Get text    ${SECURITY_FIREWALL_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
