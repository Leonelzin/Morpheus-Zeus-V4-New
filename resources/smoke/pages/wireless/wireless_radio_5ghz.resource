*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                                        xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_WIRELESS_SUBMENU}                                                              xpath=//*[@id="sidebar-options-menu"]/div[3]/div/div/div
${SIDEMENU_WIRELESS_RADIO_5GHZ}                                                           xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[4]/p


###


${WIRELESS_RADIO_5GHZ_PAGE_INNER_TITLE}                                                   xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_INNER_SUBTITLE}                                                xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_TITLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_OPTIONS_DROPDOWN}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_OPTION_AP}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div/ul/li

${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_TITLE}                                        xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT}                                              xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTIONS_DROPDOWN}                             xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTION_A}                                     xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div/div/ul/li[1]
${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTION_A_N}                                   xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div/div/ul/li[2]
${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTION_A_N_AC}                                xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div/div/ul/li[3]
${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTION_A_N_AC_AX}                             xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div/div/ul/li[4]

${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_TITLE}                                          xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT}                                                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_OPTIONS_DROPDOWN}                               xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_OPTION_BRASIL}                                  xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div/ul/li

${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_BUTTON}                                            xpath=//*[@id="root"]/div[3]/div/div[3]/div[3]/span/button

${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_INNER_TITLE}                                       xpath=//*[@id="overlay-cntse"]/div/div[1]/h2

${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_UPDATE_BUTTON_TEXT}                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div/label
${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_UPDATE_BUTTON}                                     xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div/div >> svg

${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_CHANNEL}                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div[1]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_SSID}                                       xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div[1]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_BSSID}                                      xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div[1]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_CRYPTOGRAPHY}                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div[1]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_SIGNAL}                                     xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div[1]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_CLOSE_BUTTON}                                      xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button

${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT_TITLE}                                        xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT}                                              xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT_OPTIONS_DROPDOWN}                             xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT_OPTION_50_MHZ}                                xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[1]
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT_OPTION_40_MHZ}                                xpath=//*[@id="root"]/div[3]/div/div[4]/div[1]/div/div/ul/li[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_SELECT_TITLE}                                          xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_SELECT}                                                xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_SELECT_OPTIONS_DROPDOWN}                               xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_SELECT_OPTION_AUTOMATIC}                               xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div/div/ul/li[1]

${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_TITLE}                                              xpath=//*[@id="root"]/div[3]/div/div[5]
${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_INFO}                                               xpath=//*[@id="root"]/div[3]/div/div[5]/label >> svg
${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_TEXT}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_OK_BUTTON}                                          xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button
    
${WIRELESS_RADIO_5GHZ_PAGE_SAVE_SETTINGS_BUTTON}                                          xpath=//*[@id="root"]/div[3]/div/div[6]/button


#################################################
#  Variables (Bandwidth and Channel Selection)  #     
#################################################


${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_BUTTON}                                  xpath=//*[@id="root"]/div[3]/div/div[4]/div[3]/button

${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_TITLE}                                   xpath=/html/body/div/div[3]/div/div[4]/div[3]/div/div/div[1]

${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_TITLE}                            xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT}                                  xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[1]/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTIONS_DROPDOWN}                 xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[1]/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTION_20_MHZ}                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[1]/div/ul/li[1]
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTION_40_MHZ}                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[1]/div/ul/li[2]
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTION_80_MHZ}                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[1]/div/ul/li[3]

${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT_TITLE}                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT}                                      xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[2]/div/div/div/input
${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT_OPTIONS_DROPDOWN}                     xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[2]/div/div/ul
${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT_OPTION_AUTOMATIC}                     xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[2]/div/div/ul/li[1]
${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT_OPTION_ABOVE}                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[2]/div/div/ul/li[2]
${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT_OPTION_BELOW}                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[2]/div/div/ul/li[3]

${WIRELESS_RADIO_5GHZ_PAGE_PREFERABLY_CHECKBOX}                                           xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[2]/label[1]/input
${WIRELESS_RADIO_5GHZ_PAGE_PREFERABLY_CHECKBOX_TEXT}                                      xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[2]/div[1]

${WIRELESS_RADIO_5GHZ_PAGE_SHOW_DFS_CHECKBOX}                                             xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[2]/label[2]/input
${WIRELESS_RADIO_5GHZ_PAGE_SHOW_DFS_CHECKBOX_TEXT}                                        xpath=//*[@id="overlay-cntse"]/div/div[2]/div[1]/div[1]/div[2]/div[2]

${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_BUTTON}                           xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[2]
${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_CLOSE_BUTTON}                            xpath=//*[@id="overlay-cntse"]/div/div[3]/div/button[1]


###########################################################
#    Variables (table bandwidth and channel selection)    #     
###########################################################


${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_TABLE}                                   xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[1]

${WIRELESS_RADIO_5GHZ_PAGE_HEADER_CHANNEL_CHECKBOX}                                       xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[1]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_HEADER_CHANNEL}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[1]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_HEADER_DBM}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[1]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_HEADER_BANDWIDTH}                                              xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[1]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_HEADER_DFS}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[1]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_CHECKBOX}                                           xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_DBM}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_BANDWIDTH}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_DFS}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_CHECKBOX}                                           xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_DBM}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_BANDWIDTH}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_DFS}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_CHECKBOX}                                           xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[3]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[3]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_DBM}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[3]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_BANDWIDTH}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[3]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_DFS}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[3]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_CHECKBOX}                                           xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[4]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48}                                                    xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[4]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_DBM}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[4]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_BANDWIDTH}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[4]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_DFS}                                                xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[4]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_CHECKBOX}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[5]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149}                                                   xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[5]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_DBM}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[5]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_BANDWIDTH}                                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[5]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_DFS}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[5]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_CHECKBOX}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[6]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153}                                                   xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[6]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_DBM}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[6]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_BANDWIDTH}                                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[6]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_DFS}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[6]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_CHECKBOX}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[7]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157}                                                   xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[7]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_DBM}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[7]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_BANDWIDTH}                                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[7]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_DFS}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[7]/div[5]

${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_CHECKBOX}                                          xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[8]/div[1]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161}                                                   xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[8]/div[2]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_DBM}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[8]/div[3]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_BANDWIDTH}                                         xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[8]/div[4]
${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_DFS}                                               xpath=//*[@id="overlay-cntse"]/div/div[2]/div[2]/div/div/div[2]/div[8]/div[5]


*** Keywords ***
Access Wireless Radio 5GHz settings page
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
        ...    Wireless submenu was not visible (5 seconds timeout).
    END

    ${ntp_option_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${SIDEMENU_WIRELESS_RADIO_5GHZ}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_WIRELESS_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_RADIO_5GHZ}
        ...    visible
        ...    5s
        ...    Wireless Radio 5ghz submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_WIRELESS_RADIO_5GHZ}
    Sleep    6

Page inner title wireless radio 5ghz should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle wireless radio 5ghz should be "${text}"
    ${str}    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Operation Mode select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_TITLE}    ==    ${text}

Operation Mode select option should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT}    ==    ${text}
   
Operation Mode select should be enabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT}
    ...    contains
    ...    enabled
    ...    message=Operation mode select should be enabled (editable).

Open Operation Mode selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT}
    END

Select Operation Mode "${text}"
    Open Operation Mode selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Operation mode dropdown method did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Operation mode method ${text} is not available.

There should be "${number}" operation mode available
    Open Operation Mode selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_OPERATION_MODE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} operation mode method available, but there was ${list_length}.
    ...    values=${false}

Operation Mode "${text}" should be available
    Select Operation Mode "${text}"

IEEE mode select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_TITLE}    ==    ${text}

IEEE mode select option should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT}    ==    ${text}
   
IEEE mode select should be enabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT}
    ...    contains
    ...    enabled
    ...    message=IEEE mode select should be enabled (editable).

Open IEEE mode selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT}
    END

Select IEEE mode "${text}"
    Open IEEE mode selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=IEEE mode dropdown method did not automatically close upon selection.
            RETURN
        END
    END
    Fail    IEEE mode method ${text} is not available.

There should be "${number}" IEEE mode available
    Open IEEE mode selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_IEEE_MODE_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} IEEE mode method available, but there was ${list_length}.
    ...    values=${false}

IEEE mode "${text}" should be available
    Select IEEE mode "${text}"

Country select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_TITLE}    ==    ${text}

Country select option should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT}    ==    ${text}
   
Country select should be enabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT}
    ...    contains
    ...    enabled
    ...    message=Country select should be enabled (editable).

Open Country selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT}
    END

Select Country "${text}"
    Open Country selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Country dropdown method did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Country method ${text} is not available.

There should be "${number}" Country available
    Open Country selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_COUNTRY_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} Country method available, but there was ${list_length}.
    ...    values=${false}

Country "${text}" should be available
    Select Country "${text}"

Open site survey 5GHz
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_BUTTON}

Page inner title wireless site survey 5GHz should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_INNER_TITLE}    ==    ${text}

Update survey 5GHz settings button text should be "${text}"
    Sleep    2
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_UPDATE_BUTTON_TEXT}    ==    ${text}

Update survey 5GHz settings button should be visible
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_UPDATE_BUTTON} 
    ...    contains
    ...    visible

Carry update survey 5GHz
    ...    Click    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_UPDATE_BUTTON}

Frequency survey 5GHz table headers should be
    Sleep    2
    [Arguments]    ${channel_header_default}    ${ssid_header_default}    ${bssid_header_default}    ${cryptography_header_default}    ${signal_header_default}   
    ${channel}    Get Text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_CHANNEL}
    ${ssid}    Get Text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_SSID}
    ${bssid}    Get Text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_BSSID}
    ${cryptography}    Get Text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_CRYPTOGRAPHY}
    ${signal}    Get Text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_HEADER_SIGNAL}
    @{text_parts}=    Create List    ${channel_header_default}    ${ssid_header_default}    ${bssid_header_default}    ${cryptography_header_default}    ${signal_header_default}    
    Should Be Equal As Strings    ${channel}    ${text_parts}[0]
    Should Be Equal As Strings    ${ssid.title()}    ${text_parts}[1]
    Should Be Equal As Strings    ${bssid}    ${text_parts}[2]
    Should Be Equal As Strings    ${cryptography}    ${text_parts}[3]
    Should Be Equal As Strings    ${signal}    ${text_parts}[4]

Close site survey 5GHz button text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_CLOSE_BUTTON}    ==    ${text}

Close site survey 5GHz
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_SITE_SURVEY_CLOSE_BUTTON}

Bandwidth select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT_TITLE}    ==    ${text}

Bandwidth select should be disabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT}
    ...    not contains
    ...    disabled
    ...    message=Bandwidth select should be disabled (not editable).

Channel select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_SELECT_TITLE}    ==    ${text}

Channel select should be disabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_SELECT}
    ...    not contains
    ...    disabled
    ...    message=Channel select should be disabled (not editable).
    
Transmission Power (dBm) title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_TITLE}    ==    ${text}

Open Transmission Power (dBm) info
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_INFO}

Close Transmission Power (dBm) info
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_OK_BUTTON}
    
Transmission Power (dBm) text info should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_DBM_SLIDER_TEXT}    ==    ${text}

Save settings button text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_SAVE_SETTINGS_BUTTON}    ==    ${text}


#################################################
#   Keywords (bandwidth and channel selection)  #     
#################################################


Select band and channel button text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_BUTTON}    ==    ${text}

Open select band and channel settings
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_BUTTON}

Bandwidth and channel title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_TITLE}    ==    ${text}

Bandwidth and channel select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_TITLE}    ==    ${text}

Bandwidth and channel select option should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT}   ==    ${text}

Bandwidth and channel select should be enabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT}
    ...    contains
    ...    enabled
    ...    message=Bandwidth and channel select should be enabled (editable).

Open Bandwidth and channel selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT}
    END

Select Bandwidth and channel "${text}"
    Open Bandwidth and channel selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=Bandwidth and channel dropdown method did not automatically close upon selection.
            RETURN
        END
    END
    Fail    Bandwidth and channel method ${text} is not available.

There should be "${number}" Bandwidth and channel available
    Open Bandwidth and Channel selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} Bandwidth and channel method available, but there was ${list_length}.
    ...    values=${false}

Bandwidth and channel "${text}" should be available
    Select Bandwidth and channel "${text}"

Extension channel select title should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_EXTENSION_CHANNEL_SELECT_TITLE}    ==    ${text}

Extension channel select should be disabled
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_SELECT}
    ...    not contains
    ...    disabled
    ...    message=Extension channel select should be disabled (not editable).

Preferably checkbox text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_PREFERABLY_CHECKBOX_TEXT}    ==    ${text}

Preferably checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_PREFERABLY_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Show DFS checkbox text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_SHOW_DFS_CHECKBOX_TEXT}    ==    ${text}

Show DFS checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_SHOW_DFS_CHECKBOX}    ==    unchecked
    ...    Show DFS checkbox should be enabled, but unchecked.

Enabled Show DFS checkbox
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_SHOW_DFS_CHECKBOX}

Select button text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_BUTTON}    ==    ${text}

Select band and channel settings
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_SELECT_BUTTON}

Close button text should be "${text}"
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_CLOSE_BUTTON}    ==    ${text}

Close band and channel settings
    Click    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_CLOSE_BUTTON}


###########################################################
#    Keywords (table bandwidth and channel selection)     #     
###########################################################


Wireless Radio 5GHz table should be visible
    Get element states
    ...    ${WIRELESS_RADIO_5GHZ_PAGE_BANDWIDTH_AND_CHANNEL_TABLE} 
    ...    contains
    ...    visible
    
Channel checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_HEADER_CHANNEL_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel header should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_HEADER_CHANNEL}     ==    ${text}

dBm header should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_HEADER_DBM}     ==    ${text}

Bandwidth header should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_HEADER_BANDWIDTH}    ==    ${text}
    
DFS header should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_HEADER_DFS}    ==    ${text}

Channel 36 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 36 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36}     ==    ${text}

Channel 36 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_DBM}     ==    ${text}

Channel 36 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_BANDWIDTH}    ==    ${text}

Channel 36 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_36_DFS}    ==    ${text}

Channel 40 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 40 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40}     ==    ${text}

Channel 40 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_DBM}     ==    ${text}

Channel 40 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_BANDWIDTH}    ==    ${text}

Channel 40 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_40_DFS}    ==    ${text}

Channel 44 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 44 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44}     ==    ${text}

Channel 44 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_DBM}     ==    ${text}

Channel 44 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_BANDWIDTH}    ==    ${text}

Channel 44 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_44_DFS}    ==    ${text}

Channel 48 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 48 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48}     ==    ${text}

Channel 48 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_DBM}     ==    ${text}

Channel 48 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_BANDWIDTH}    ==    ${text}

Channel 48 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_48_DFS}    ==    ${text}

Channel 149 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 149 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149}     ==    ${text}

Channel 149 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_DBM}     ==    ${text}

Channel 149 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_BANDWIDTH}    ==    ${text}

Channel 149 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_149_DFS}    ==    ${text}

Channel 153 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 153 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153}     ==    ${text}

Channel 153 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_DBM}     ==    ${text}

Channel 153 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_BANDWIDTH}    ==    ${text}

Channel 153 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_153_DFS}    ==    ${text}

Channel 157 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 157 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157}     ==    ${text}

Channel 157 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_DBM}     ==    ${text}

Channel 157 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_BANDWIDTH}    ==    ${text}

Channel 157 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_157_DFS}    ==    ${text}

Channel 161 checkbox should be enabled
    Get checkbox state    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_CHECKBOX}    ==    unchecked
    ...    Preferably checkbox should be enabled, but unchecked.

Channel 161 should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161}     ==    ${text}

Channel 161 dBm should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_DBM}     ==    ${text}

Channel 161 Bandwidth should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_BANDWIDTH}    ==    ${text}

Channel 161 DFS should be "${text}" in table
    Get text    ${WIRELESS_RADIO_5GHZ_PAGE_CHANNEL_161_DFS}    ==    ${text}
