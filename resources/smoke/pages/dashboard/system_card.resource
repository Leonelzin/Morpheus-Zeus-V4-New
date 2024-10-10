*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                   xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_DASHBOARD_SUBMENU}                        xpath=//*[@id="sidebar-options-menu"]/div[1]/div/div/div/div
${SIDEMENU_DASHBOARD_SYSTEM}                         xpath=//*[@id="system-card-title"]


###


${DASHBOARD_PAGE_SECTION_SYSTEM_TITLE}               xpath=//*[@data-testid="system-card-title"]

${DASHBOARD_PAGE_SECTION_SYSTEM_HOSTNAME_TITLE}      xpath=//*[@data-testid="system-card-device-hostname-title"]
${DASHBOARD_PAGE_SECTION_SYSTEM_HOSTNAME}            xpath=//*[@data-testid="system-card-device-hostname"]

${DASHBOARD_PAGE_SECTION_SYSTEM_FW_VERSION_TITLE}    xpath=//*[@data-testid="system-card-fw-version-title"]
${DASHBOARD_PAGE_SECTION_SYSTEM_FW_VERSION}          xpath=//*[@data-testid="system-card-fw-version"]

${DASHBOARD_PAGE_SECTION_SYSTEM_USE_TERMS_TITLE}     xpath=//*[@data-testid="system-card-terms-title"]
${DASHBOARD_PAGE_SECTION_SYSTEM_USE_TERMS}           xpath=//*[@data-testid="system-card-terms"]

${DASHBOARD_PAGE_SECTION_SYSTEM_UPDATE_BUTTON}       xpath=//*[@id="root"]/div[3]/div/div/div[3]/div/div/div[1]/button


*** Keywords ***
Access dashboard settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_DASHBOARD_SUBMENU}
    ...    contains
    ...    visible
    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_DASHBOARD_SUBMENU}
        ...    visible
        ...    5s
        ...    Dashboard menu was not visible (5 seconds timeout).
    END

Dashboard system section title should be "${text}"
    Get text    ${DASHBOARD_PAGE_SECTION_SYSTEM_TITLE}    ==    ${text}

Dashboard system section hostname title should be "${text}"
    Get text    ${DASHBOARD_PAGE_SECTION_SYSTEM_HOSTNAME_TITLE}    ==    ${text}

Dashboard system section DUT hostname should be 
    [Arguments]    ${expected_pattern}
    ${hostname_value}    Get Text    ${DASHBOARD_PAGE_SECTION_SYSTEM_HOSTNAME}
    Should Match Regexp    ${hostname_value}    ${expected_pattern}    msg=DUT hostname value does not match expected pattern
    Log To Console    DUT Hostname: ${hostname_value}

Dashboard system section fw version title should be "${text}"
    Get text    ${DASHBOARD_PAGE_SECTION_SYSTEM_FW_VERSION_TITLE}    ==    ${text}

Dashboard system section fw version should be 
    [Arguments]    ${expected_pattern}
    ${fw_value}    Get Text    ${DASHBOARD_PAGE_SECTION_SYSTEM_FW_VERSION}
    Should Match Regexp    ${fw_value}    ${expected_pattern}    msg=Firmware version value does not match expected pattern
    Log To Console    Firmware Version: ${fw_value}

Dashboard system section terms title and its enablement of the should be "${text}"
    Get text    ${DASHBOARD_PAGE_SECTION_SYSTEM_USE_TERMS_TITLE}    ==    ${text}

Dashboard system section button title should be "${text}"
    Get text    ${DASHBOARD_PAGE_SECTION_SYSTEM_UPDATE_BUTTON}    ==    ${text}
