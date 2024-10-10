*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SERVICES_SUBMENU}                            xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/div/div
${SIDEMENU_SERVICES_DISCOVERY}                          xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[2]/p

###

${DISCOVERY_PAGE_INNER_TITLE}                           xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${DISCOVERY_PAGE_INNER_SUBTITLE}                        xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${DISCOVERY_PAGE_ENABLE_TOGGLE_BRUTE_FORCE}             xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[1]/label/input
${DISCOVERY_PAGE_ENABLE_TOGGLE_BRUTE_FORCE_CLICKABLE}   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[1]/label/span
${DISCOVERY_PAGE_ENABLE_TOGGLE_BRUTE_FORCE_TEXT}        xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[1]

${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/label/input
${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP_CLICKABLE}          xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/label/span
${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP_TEXT}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]

${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[3]/label/input
${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP_CLICKABLE}           xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[3]/label/span
${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP_TEXT}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[3]

${DISCOVERY_PAGE_ENABLE_TOGGLE_INTELBRAS}               xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[4]/label/input
${DISCOVERY_PAGE_ENABLE_TOGGLE_INTELBRAS_CLICKABLE}     xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[4]/label/span
${DISCOVERY_PAGE_ENABLE_TOGGLE_INTELBRAS_TEXT}          xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[4]

${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[5]/label/input
${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN_CLICKABLE}           xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[5]/label/span
${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN_TEXT}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[5]

${DISCOVERY_PAGE_SAVE_SETTINGS_BUTTON}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/button

*** Keywords ***
Access discovery service settings page
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

    ${discovery_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SERVICES_DISCOVERY}
    ...    contains
    ...    visible

    IF    not ${discovery_option_is_visible}
        Click    ${SIDEMENU_SERVICES_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SERVICES_DISCOVERY}
        ...    visible
        ...    5s
        ...    Discovery service submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SERVICES_DISCOVERY}

    Wait for elements state
    ...    ${DISCOVERY_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    Discovery page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${DISCOVERY_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${DISCOVERY_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Toggle switch brute force text should be "${text}"
    Get text    ${DISCOVERY_PAGE_ENABLE_TOGGLE_BRUTE_FORCE_TEXT}    ==    ${text}

Toggle switch brute force should be on
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_BRUTE_FORCE}    ==    checked
    ...    Discovery protocol LLDP should be enabled.

Toggle switch LLDP text should be "${text}"
    Get text    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP_TEXT}    ==    ${text}

Toggle switch LLDP should be on
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}    ==    checked
    ...    Discovery protocol CDP should be enabled.

Toggle switch LLDP should be off
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}    ==    unchecked
    ...    Discovery protocol CDP should be disabled.

Toggle switch CDP text should be "${text}"
    Get text    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP_TEXT}    ==    ${text}

Toggle switch CDP should be on
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}    ==    checked
    ...    Discovery protocol CDP should be enabled.

Toggle switch CDP should be off
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}    ==    unchecked
    ...    Discovery protocol CDP should be disabled.

Toggle switch Intelbras text should be "${text}"
    Get text    ${DISCOVERY_PAGE_ENABLE_TOGGLE_INTELBRAS_TEXT}    ==    ${text}

Toggle switch Intelbras should be on
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_INTELBRAS}    ==    checked
    ...    Discovery protocol Intelbras should be enabled.

Toggle switch WAN text should be "${text}"
    Get text    ${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN_TEXT}    ==    ${text}

Toggle switch WAN should be on
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN}    ==    checked
    ...    Discovery protocol in the WAN should be enabled.
  
Toggle switch WAN should be off
    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN}    ==    unchecked
    ...    Discovery protocol in the WAN should be disabled.

Toggle switch WAN should be visible
    Get element states
    ...    ${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN_TEXT}
    ...    contains
    ...    visible
    ...    message=Toggle Discovery in the WAN should be visible.

Toggle switch WAN should not be visible
    Get element states
    ...    ${DISCOVERY_PAGE_ENABLE_TOGGLE_WAN_CLICKABLE}
    ...    not contains
    ...    visible
    ...    message=Discovery protocol WAN should not be visible.

Save changes button text should be "${text}"
    Get text    ${DISCOVERY_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

Enable discovery LLDP
    ${checked}    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}
    IF    ${checked} == ${false}
        Click    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP_CLICKABLE}
    END
    Wait for elements state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}    checked

Disable discovery LLDP
    ${checked}    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}
    IF    ${checked} == ${true}
        Click    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP_CLICKABLE}
    END
    Wait for elements state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_LLDP}    unchecked

Enable discovery CDP
    ${checked}    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}
    IF    ${checked} == ${false}
        Click    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP_CLICKABLE}
    END
    Wait for elements state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}    checked

Disable discovery CDP
    ${checked}    Get checkbox state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}
    IF    ${checked} == ${true}
        Click    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP_CLICKABLE}
    END
    Wait for elements state    ${DISCOVERY_PAGE_ENABLE_TOGGLE_CDP}    unchecked
