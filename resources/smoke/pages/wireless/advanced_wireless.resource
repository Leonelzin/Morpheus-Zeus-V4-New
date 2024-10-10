*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                            xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_WIRELESS_SUBMENU}                                                  xpath=//*[@id="sidebar-options-menu"]/div[3]/div/div/div
${SIDEMENU_ADVANCED_WIRELESS}                                                 xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[2]/p


###


${ADVANCED_WIRELESS_PAGE_INNER_TITLE}                                         xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${ADVANCED_WIRELESS_PAGE_INNER_SUBTITLE}                                      xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}                                      xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button

${ADVANCED_WIRELESS_PAGE_WIRELESS_ROAMING_TITLE}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div

${ADVANCED_WIRELESS_PAGE_WIRELESS_ROAMING_INFO}                               xpath=//*[@id="root"]/div[3]/div/div[2] >> svg
${ADVANCED_WIRELESS_PAGE_WIRELESS_ROAMING_INFO_TEXT}                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div

${ADVANCED_WIRELESS_PAGE_ASSISTED_ROAMING_TOGGLE}                             xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[1]/label/input
${ADVANCED_WIRELESS_PAGE_ASSISTED_ROAMING_TOGGLE_TEXT}                        xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[1]

${ADVANCED_WIRELESS_PAGE_FAST_ROAMING_TOGGLE}                                 xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[2]/label/input
${ADVANCED_WIRELESS_PAGE_FAST_ROAMING_TOGGLE_TEXT}                            xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[2]

${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TITLE}                                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div

${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_INFO}                                 xpath=//*[@id="root"]/div[3]/div/div[3]/div[2] >> svg
${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_INFO_TEXT}                            xpath=//*[@id="overlay-cntse"]/div/div[2]/div

${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TOGGLE}                               xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/div[1]/label/input
${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TOGGLE_TEXT}                          xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/div[1]

${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE}                               xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/div[2]/label/input
${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE_TEXT}                          xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/div[2]
${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE_LEGEND_TEXT}                   xpath=/html/body/div/div[3]/div/div[3]/div[3]/span

${ADVANCED_WIRELESS_PAGE_BAND_STEERING_TITLE}                                 xpath=//*[@id="root"]/div[3]/div/div[4]/div

${ADVANCED_WIRELESS_PAGE_BAND_STEERING_INFO}                                  xpath=//*[@id="root"]/div[3]/div/div[4] >> svg
${ADVANCED_WIRELESS_PAGE_BAND_STEERING_INFO_TEXT}                             xpath=//*[@id="overlay-cntse"]/div/div[2]/div

${ADVANCED_WIRELESS_PAGE_BAND_STEERING_TOGGLE}                                xpath=//*[@id="root"]/div[3]/div/div[5]/div/label/input
${ADVANCED_WIRELESS_PAGE_BAND_STEERING_TOGGLE_TEXT}                           xpath=//*[@id="root"]/div[3]/div/div[5]

${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_TITLE}                          xpath=/html/body/div/div[3]/div/span
${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT}                                xpath=//*[@id="root"]/div[3]/div/div[6]/div/div/div/input
${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTIONS_DROPDOWN}               xpath=//*[@id="root"]/div[3]/div/div[6]/div/div/ul
${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTION_1}                       xpath=//*[@id="root"]/div[3]/div/div[6]/div/div/ul/li[1]
${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTION_2}                       xpath=//*[@id="root"]/div[3]/div/div[6]/div/div/ul/li[2]

${ADVANCED_WIRELESS_PAGE_MU_MIMO_TITLE}                                       xpath=//*[@id="root"]/div[3]/div/div[7]/div

${ADVANCED_WIRELESS_PAGE_MU_MIMO_INFO}                                        xpath=//*[@id="root"]/div[3]/div/div[7] >> svg
${ADVANCED_WIRELESS_PAGE_MU_MIMO_INFO_TEXT}                                   xpath=//*[@id="overlay-cntse"]/div/div[2]/div

${ADVANCED_WIRELESS_PAGE_MU_MIMO_TOGGLE}                                      xpath=//*[@id="root"]/div[3]/div/div[8]/label/input
${ADVANCED_WIRELESS_PAGE_MU_MIMO_TOGGLE_TEXT}                                 xpath=//*[@id="root"]/div[3]/div/div[10]/div

${ADVANCED_WIRELESS_PAGE_BEAMFORMING_TITLE}                                   xpath=//*[@id="root"]/div[3]/div/div[9]/div

${ADVANCED_WIRELESS_PAGE_BEAMFORMING_INFO}                                    xpath=//*[@id="root"]/div[3]/div/div[9] >> svg
${ADVANCED_WIRELESS_PAGE_BEAMFORMING_INFO_TEXT}                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div/div

${ADVANCED_WIRELESS_PAGE_BEAMFORMING_TOGGLE}                                  xpath=//*[@id="root"]/div[3]/div/div[10]/label/input
${ADVANCED_WIRELESS_PAGE_BEAMFORMING_TOGGLE_TEXT}                             xpath=//*[@id="root"]/div[3]/div/div[10]/div


*** Keywords ***
Access Advanced Wireless settings page
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_WIRELESS_SUBMENU}
    ...    contains
    ...    visible
    
    IF    not ${submenu_is_visible}
        Click    ${SIDEMENU_TOGGLE}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_SUBMENU}
        ...    visible
        ...    5s
        ...    Network submenu was not visible (5 seconds timeout).
    END

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_ADVANCED_WIRELESS}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_WIRELESS_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_ADVANCED_WIRELESS}
        ...    visible
        ...    5s
        ...    Wireless SSID submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_ADVANCED_WIRELESS}
    Sleep    6

Page inner title advanced wireless should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle advanced wireless should be "${text}"
    ${str}    Get text    ${ADVANCED_WIRELESS_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Wireless Roaming title should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_WIRELESS_ROAMING_TITLE}    ==    ${text}

Open Wireless Roaming info
    Click    ${ADVANCED_WIRELESS_PAGE_WIRELESS_ROAMING_INFO}

Close Wireless Roaming info
    Click    ${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}

Wireless Roaming text info should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_WIRELESS_ROAMING_INFO_TEXT}    ==    ${text}

Button info text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}    ==    ${text}

Assisted Roaming toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_ASSISTED_ROAMING_TOGGLE_TEXT}     ==    ${text}

Assisted Roaming toggle should be enabled
    ${element_states}    Get element states    ${ADVANCED_WIRELESS_PAGE_ASSISTED_ROAMING_TOGGLE}
    Should Contain    ${element_states}    checked    Assisted Roaming toggle should be enabled (editable).

Fast Roaming toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_FAST_ROAMING_TOGGLE_TEXT}     ==    ${text}

Fast Roaming toggle should be disabled
    Get checkbox state    ${ADVANCED_WIRELESS_PAGE_FAST_ROAMING_TOGGLE}    ==    unchecked
    ...    Fast Roaming toggle should be disabled.

Smart Handover title should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TITLE}    ==    ${text}

Smart Handover title should be not visible
    Get element states
    ...    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TITLE}
    ...    not contains
    ...    visible

Open Smart Handover info
    Click    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_INFO}

Close Smart Handover info
    Click    ${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}
    
Smart Handover info should be not visible
    Get element states
    ...    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_INFO}
    ...    not contains
    ...    visible

Smart Handover text info should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_INFO_TEXT}    ==    ${text}

Smart Handover toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TOGGLE_TEXT}     ==    ${text}

Smart Handover toggle should be disabled
    Get checkbox state    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TOGGLE}    ==    unchecked
    ...    Smart Handover toggle should be disabled.

Smart Handover toggle should be not visible
    Get element states
    ...    ${ADVANCED_WIRELESS_PAGE_SMART_HANDOVER_TOGGLE}
    ...    not contains
    ...    visible

Define AP toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE_TEXT}     ==    ${text}

Define AP toggle legend text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE_LEGEND_TEXT}     ==    ${text}

Define AP toggle legend text should be not visible
    Get element states
    ...    ${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE_LEGEND_TEXT}
    ...    not contains
    ...    visible

Define AP toggle should be disabled
    Get checkbox state    ${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE}    ==    unchecked
    ...    Define AP toggle should be disabled.

Define AP toggle should be not visible
    Get element states
    ...    ${ADVANCED_WIRELESS_PAGE_DEFINE_AP_MAIN_TOGGLE}
    ...    not contains
    ...    visible

Band Steering title should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_TITLE}    ==    ${text}

Open Band Steering info
    Click    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_INFO}

Close Band Steering info
    Click    ${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}
    
Band Steering text info should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_INFO_TEXT}    ==    ${text}

Band Steering toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_TOGGLE_TEXT}     ==    ${text}

Band Steering toggle should be enabled
    ${element_states}    Get element states    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_TOGGLE}
    Should Contain    ${element_states}    checked    Band Steering toggle should be enabled (editable).

Band Steering select title should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_TITLE}    ==    ${text}

Band Steering select option should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT}    ==    ${text}
   
Band Steering select should be enabled
    Get element states
    ...    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT}
    ...    contains
    ...    enabled
    ...    message=Band Steering select should be enabled (editable).

Open Band Steering selection dropdown menu
    ${elem_states}    Get element states    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT}
    END

Select Band Steering "${text}"
    Open Band Steering selection dropdown menu

    ${method_list}    Get elements    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Band steering dropdown method did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Band Steering method ${text} is not available.

There should be "${number}" band steering available
    Open Band Steering selection dropdown menu

    ${method_list}    Get elements    ${ADVANCED_WIRELESS_PAGE_BAND_STEERING_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} band steering method available, but there was ${list_length}.
    ...    values=${false}

Band Steering "${text}" should be available
    Select Band Steering "${text}"

Multi-User MIMO title should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_MU_MIMO_TITLE}    ==    ${text}

Open Multi-User MIMO info
    Click    ${ADVANCED_WIRELESS_PAGE_MU_MIMO_INFO}

Close Multi-User MIMO info
    Click    ${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}

Multi-User MIMO text info should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_MU_MIMO_INFO_TEXT}    ==    ${text}

Multi-User MIMO toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_MU_MIMO_TOGGLE_TEXT}    ==    ${text}

Multi-User MIMO toggle should be enabled
    ${element_states}    Get element states    ${ADVANCED_WIRELESS_PAGE_MU_MIMO_TOGGLE}
    Should Contain    ${element_states}    checked    Multi-User MIMO toggle should be enabled (editable).

Beamforming title should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BEAMFORMING_TITLE}    ==    ${text}

Open Beamforming info
    Click    ${ADVANCED_WIRELESS_PAGE_BEAMFORMING_INFO}

Close Beamforming info
    Click    ${ADVANCED_WIRELESS_PAGE_INFO_OK_BUTTON}

Beamforming text info should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BEAMFORMING_INFO_TEXT}    ==    ${text}

Beamforming toggle text should be "${text}"
    Get text    ${ADVANCED_WIRELESS_PAGE_BEAMFORMING_TOGGLE_TEXT}    ==    ${text}

Beamforming toggle should be enabled
    ${element_states}    Get element states    ${ADVANCED_WIRELESS_PAGE_BEAMFORMING_TOGGLE}
    Should Contain    ${element_states}    checked    Beamforming toggle should be enabled (editable).
