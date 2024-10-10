*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                      xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SERVICES_SUBMENU}            xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/div/div
${SIDEMENU_SERVICES_SNMP}               xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[4]/p

###

${SNMP_PAGE_INNER_TITLE}                xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${SNMP_PAGE_INNER_SUBTITLE}             xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${SNMP_PAGE_ENABLE_TOGGLE}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/input
${SNMP_PAGE_ENABLE_TOGGLE_CLICKABLE}    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label/span
${SNMP_PAGE_ENABLE_TOGGLE_TEXT}         xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div

${SNMP_PAGE_SAVE_SETTINGS_BUTTON}       xpath=//*[@id="root"]/div[3]/div/button

${SNMP_PAGE_COMMUNITY_INPUT_TITLE}      xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${SNMP_PAGE_COMMUNITY_INPUT}            xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/input

${SNMP_PAGE_PORT_INPUT_TITLE}           xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${SNMP_PAGE_PORT_INPUT}                 xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/input

${SNMP_PAGE_LOCATION_INPUT_TITLE}       xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]
${SNMP_PAGE_LOCATION_INPUT}             xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/input

${SNMP_PAGE_CONTACT_INPUT_TITLE}        xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]
${SNMP_PAGE_CONTACT_INPUT}              xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/input

${SNMP_PAGE_NAME_INPUT_TITLE}           xpath=//*[@id="root"]/div[3]/div/div[5]
${SNMP_PAGE_NAME_INPUT}                 xpath=//*[@id="root"]/div[3]/div/div[5]/input


*** Keywords ***
Access SNMP service settings page
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

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SERVICES_SNMP}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_SERVICES_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SERVICES_SNMP}
        ...    visible
        ...    5s
        ...    SNMP service submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SERVICES_SNMP}

    Wait for elements state
    ...    ${SNMP_PAGE_ENABLE_TOGGLE_CLICKABLE}
    ...    visible
    ...    10s
    ...    SNMP page enable toggle switch was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${SNMP_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${SNMP_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

SNMP toggle switch text should be "${text}"
    Get text    ${SNMP_PAGE_ENABLE_TOGGLE_TEXT}    ==    ${text}

SNMP toggle switch should be off
    Get checkbox state    ${SNMP_PAGE_ENABLE_TOGGLE}    ==    unchecked
    ...    SNMP should be disabled.

Enable SNMP
    ${checked}    Get checkbox state    ${SNMP_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${SNMP_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${SNMP_PAGE_ENABLE_TOGGLE}    checked

Community input title should be "${text}"
    Get text    ${SNMP_PAGE_COMMUNITY_INPUT_TITLE}    ==    ${text}

Community should be "${text}"
    Get text    ${SNMP_PAGE_COMMUNITY_INPUT}    ==    ${text}

Community input should be enabled
    Get element states
    ...    ${SNMP_PAGE_COMMUNITY_INPUT}
    ...    contains
    ...    enabled
    ...    message=SNMP community input should be enabled (editable).

Community input should be disabled
    Get element states
    ...    ${SNMP_PAGE_COMMUNITY_INPUT}
    ...    contains
    ...    disabled
    ...    message=SNMP community input should be disabled (not editable).

Port input title should be "${text}"
    Get text    ${SNMP_PAGE_PORT_INPUT_TITLE}    ==    ${text}

Port should be "${text}"
    Get text    ${SNMP_PAGE_PORT_INPUT}    ==    ${text}

Port input should be enabled
    Get element states
    ...    ${SNMP_PAGE_PORT_INPUT}
    ...    contains
    ...    enabled
    ...    message=SNMP port input should be enabled (editable).

Port input should be disabled
    Get element states
    ...    ${SNMP_PAGE_PORT_INPUT}
    ...    contains
    ...    disabled
    ...    message=SNMP port input should be disabled (not editable).

Location input title should be "${text}"
    Get text    ${SNMP_PAGE_LOCATION_INPUT_TITLE}    ==    ${text}

Location should be "${text}"
    Get text    ${SNMP_PAGE_LOCATION_INPUT}    ==    ${text}

Location input should be enabled
    Get element states
    ...    ${SNMP_PAGE_LOCATION_INPUT}
    ...    contains
    ...    enabled
    ...    message=SNMP location input should be enabled (editable).

Location input should be disabled
    Get element states
    ...    ${SNMP_PAGE_LOCATION_INPUT}
    ...    contains
    ...    disabled
    ...    message=SNMP location input should be disabled (not editable).

Contact input title should be "${text}"
    Get text    ${SNMP_PAGE_CONTACT_INPUT_TITLE}    ==    ${text}

Contact should be "${text}"
    Get text    ${SNMP_PAGE_CONTACT_INPUT}    ==    ${text}

Contact input should be enabled
    Get element states
    ...    ${SNMP_PAGE_CONTACT_INPUT}
    ...    contains
    ...    enabled
    ...    message=SNMP contact input should be enabled (editable).

Contact input should be disabled
    Get element states
    ...    ${SNMP_PAGE_CONTACT_INPUT}
    ...    contains
    ...    disabled
    ...    message=SNMP contact input should be disabled (not editable).

Name input title should be "${text}"
    Get text    ${SNMP_PAGE_NAME_INPUT_TITLE}    ==    ${text}

Name should be "${text}"
    Get text    ${SNMP_PAGE_NAME_INPUT}    ==    ${text}

Name input should be enabled
    Get element states
    ...    ${SNMP_PAGE_NAME_INPUT}
    ...    contains
    ...    enabled
    ...    message=SNMP name input should be enabled (editable).

Name input should be disabled
    Get element states
    ...    ${SNMP_PAGE_NAME_INPUT}
    ...    contains
    ...    disabled
    ...    message=SNMP name input should be disabled (not editable).

Save settings button text should be "${text}"
    Get text    ${SNMP_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}
