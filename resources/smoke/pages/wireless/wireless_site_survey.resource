*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                            xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_WIRELESS_SUBMENU}                                                  xpath=//*[@id="sidebar-options-menu"]/div[3]/div/div/div
${SIDEMENU_WIRELESS_SITE_SURVEY}                                              xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[5]/p


###


${WIRELESS_SITE_SURVEY_PAGE_INNER_TITLE}                                      xpath=//*[@data-testid="inner-title"]
${WIRELESS_SITE_SURVEY_PAGE_INNER_SUBTITLE}                                   xpath=//*[@data-testid="inner-subtitle"]

${WIRELESS_SITE_SURVEY_PAGE_FREQUENCY_2GHZ_BUTTON}                            xpath=//*[@id="root"]/div[3]/div/ul/li[1]/button
${WIRELESS_SITE_SURVEY_PAGE_FREQUENCY_5GHZ_BUTTON}                            xpath=//*[@id="root"]/div[3]/div/ul/li[2]/button

${WIRELESS_SITE_SURVEY_PAGE_UPDATE_BUTTON_TEXT}                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/label
${WIRELESS_SITE_SURVEY_PAGE_UPDATE_BUTTON}                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div >> svg

${WIRELESS_SITE_SURVEY_PAGE_HEADER_CHANNEL}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]/div[1]
${WIRELESS_SITE_SURVEY_PAGE_HEADER_SSID}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]/div[2]
${WIRELESS_SITE_SURVEY_PAGE_HEADER_BSSID}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]/div[3]
${WIRELESS_SITE_SURVEY_PAGE_HEADER_CRYPTOGRAPHY}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]/div[4]
${WIRELESS_SITE_SURVEY_PAGE_HEADER_SIGNAL}                                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[1]/div[5]


*** Keywords ***
Access Wireless site survey settings page
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
    ...    ${SIDEMENU_WIRELESS_SITE_SURVEY}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_WIRELESS_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_SITE_SURVEY}
        ...    visible
        ...    5s
        ...    Wireless Site Survey submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_WIRELESS_SITE_SURVEY}
    Sleep    6

Page inner title wireless site survey should be "${text}"
    Get text    ${WIRELESS_SITE_SURVEY_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle wireless site survey should be "${text}"
    ${str}    Get text    ${WIRELESS_SITE_SURVEY_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Frequency 2GHz settings button should be visible
    Get element states
    ...    ${WIRELESS_SITE_SURVEY_PAGE_FREQUENCY_2GHZ_BUTTON} 
    ...    contains
    ...    visible

Conduct survey at 2GHz frequency
    ...    Click    ${WIRELESS_SITE_SURVEY_PAGE_FREQUENCY_2GHZ_BUTTON} 
   
Frequency 5GHz settings button should be visible
    Get element states
    ...    ${WIRELESS_SITE_SURVEY_PAGE_FREQUENCY_5GHZ_BUTTON} 
    ...    contains
    ...    visible

Conduct survey at 5GHz frequency
    ...    Click    ${WIRELESS_SITE_SURVEY_PAGE_FREQUENCY_5GHZ_BUTTON}
    Sleep    6

Update Survey settings button text should be "${text}"
    Get text    ${WIRELESS_SITE_SURVEY_PAGE_UPDATE_BUTTON_TEXT}    ==    ${text}

Update Survey settings button should be visible
    Get element states
    ...    ${WIRELESS_SITE_SURVEY_PAGE_UPDATE_BUTTON} 
    ...    contains
    ...    visible

Carry update survey
    ...    Click    ${WIRELESS_SITE_SURVEY_PAGE_UPDATE_BUTTON}
    
Frequency survey 2.4GHz and 5GHz table headers should be
    [Arguments]    ${channel_header_default}    ${ssid_header_default}    ${bssid_header_default}    ${cryptography_header_default}    ${signal_header_default}   
    ${channel}    Get Text    ${WIRELESS_SITE_SURVEY_PAGE_HEADER_CHANNEL}
    ${ssid}    Get Text    ${WIRELESS_SITE_SURVEY_PAGE_HEADER_SSID}
    ${bssid}    Get Text    ${WIRELESS_SITE_SURVEY_PAGE_HEADER_BSSID}
    ${cryptography}    Get Text    ${WIRELESS_SITE_SURVEY_PAGE_HEADER_CRYPTOGRAPHY}
    ${signal}    Get Text    ${WIRELESS_SITE_SURVEY_PAGE_HEADER_SIGNAL}
    @{text_parts}=    Create List    ${channel_header_default}    ${ssid_header_default}    ${bssid_header_default}    ${cryptography_header_default}    ${signal_header_default}    
    Should Be Equal As Strings    ${channel}    ${text_parts}[0]
    Should Be Equal As Strings    ${ssid.title()}    ${text_parts}[1]
    Should Be Equal As Strings    ${bssid}    ${text_parts}[2]
    Should Be Equal As Strings    ${cryptography}    ${text_parts}[3]
    Should Be Equal As Strings    ${signal}    ${text_parts}[4]
