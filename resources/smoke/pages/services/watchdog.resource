*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                              xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_SERVICES_SUBMENU}                    xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/div/div
${SIDEMENU_SERVICES_WATCHDOG}                   xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[5]/p

###

${WATCHDOG_PAGE_INNER_TITLE}                    xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${WATCHDOG_PAGE_INNER_SUBTITLE}                 xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${WATCHDOG_PAGE_ENABLE_TOGGLE}                  xpath=//*[@id="root"]/div[3]/div/div[2]/label/input
${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}        xpath=//*[@id="root"]/div[3]/div/div[2]/label/span
${WATCHDOG_PAGE_ENABLE_TOGGLE_TEXT}             xpath=//*[@id="root"]/div[3]/div/div[2]/div

${WATCHDOG_PAGE_ADDRESS_1_INPUT_TITLE}          xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${WATCHDOG_PAGE_ADDRESS_1_INPUT}                xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/input

${WATCHDOG_PAGE_ADDRESS_2_INPUT_TITLE}          xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${WATCHDOG_PAGE_ADDRESS_2_INPUT}                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/input

${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT_TITLE}     xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]
${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT}           xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/input

${WATCHDOG_PAGE_SAVE_SETTINGS_BUTTON}           xpath=//*[@id="root"]/div[3]/div/div[4]/button


*** Keywords ***
Access watchdog service settings page
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

    ${watchdog_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_SERVICES_WATCHDOG}
    ...    contains
    ...    visible

    IF    not ${watchdog_option_is_visible}
        Click    ${SIDEMENU_SERVICES_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_SERVICES_WATCHDOG}
        ...    visible
        ...    5s
        ...    Watchdog service submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_SERVICES_WATCHDOG}

    Wait for elements state
    ...    ${WATCHDOG_PAGE_SAVE_SETTINGS_BUTTON}
    ...    visible
    ...    10s
    ...    Watchdog page save settings button was not visible (10 seconds timeout).

Page inner title should be "${text}"
    Get text    ${WATCHDOG_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle should be "${text}"
    ${str}    Get text    ${WATCHDOG_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Toggle switch text should be "${text}"
    Get text    ${WATCHDOG_PAGE_ENABLE_TOGGLE_TEXT}    ==    ${text}

Toggle switch should be off
    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}    ==    unchecked
    ...    Watchdog service should be disabled.

Address 1 input title should be "${text}"
    Get text    ${WATCHDOG_PAGE_ADDRESS_1_INPUT_TITLE}    ==    ${text}

Address 1 should be "${text}"
    Get text    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}    ==    ${text}

Address 1 input should be enabled
    Get element states
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    contains
    ...    enabled
    ...    message=IP address 1 input should be enabled (editable).

Address 1 input should be disabled
    Get element states
    ...    ${WATCHDOG_PAGE_ADDRESS_1_INPUT}
    ...    contains
    ...    disabled
    ...    message=IP address 1 input should be disabled (not editable).

Address 2 input title should be "${text}"
    Get text    ${WATCHDOG_PAGE_ADDRESS_2_INPUT_TITLE}    ==    ${text}

Address 2 should be "${text}"
    Get text    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}    ==    ${text}

Address 2 input should be enabled
    Get element states
    ...    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}
    ...    contains
    ...    enabled
    ...    message=IP address 2 input should be enabled (editable).

Address 2 input should be disabled
    Get element states
    ...    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}
    ...    contains
    ...    disabled
    ...    message=IP address 2 input should be disabled (not editable).

Address 2 placeholder should be "${text}"
    Get attribute
    ...    ${WATCHDOG_PAGE_ADDRESS_2_INPUT}
    ...    placeholder    ==    ${text}

Check interval input title should be "${text}"
    Get text    ${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT_TITLE}    ==    ${text}

Check interval input should be enabled
    Get element states
    ...    ${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT}
    ...    contains
    ...    enabled
    ...    message=Check interval input should be enabled (editable).

Check interval input should be disabled
    Get element states
    ...    ${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT}
    ...    contains
    ...    disabled
    ...    message=Check interval input should be disabled (not editable).

Check interval placeholder should be "${text}"
    Get attribute
    ...    ${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT}
    ...    placeholder    ==    ${text}

Check interval should be "${text}"
    Get text    ${WATCHDOG_PAGE_CHECK_INTERVAL_INPUT}    ==    ${text}

Save settings button text should be "${text}"
    Get text    ${WATCHDOG_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}

Enable watchdog service
    ${checked}    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END

Disable watchdog service
    ${checked}    Get checkbox state    ${WATCHDOG_PAGE_ENABLE_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${WATCHDOG_PAGE_ENABLE_TOGGLE_CLICKABLE}
    END
