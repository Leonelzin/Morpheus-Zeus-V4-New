*** Settings ***
Library     Browser
Library     String
Resource    wireless_ssid_variables.resource
Resource    ../../../../../resources/common/common_resources.resource


*** Keywords ***
Access Wireless SSID settings page
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
    ...    ${SIDEMENU_WIRELESS_SSID}
    ...    contains
    ...    visible

    IF    not ${ntp_option_is_visible}
        Click    ${SIDEMENU_WIRELESS_SUBMENU}
        Wait for elements state
        ...    ${SIDEMENU_WIRELESS_SSID}
        ...    visible
        ...    5s
        ...    Wireless SSID submenu option was not visible (5 seconds timeout).
    END

    Click    ${SIDEMENU_WIRELESS_SSID}
    Sleep    6

Page inner title Wireless SSID should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_INNER_TITLE}    ==    ${text}

Page inner subtitle Wireless SSID should be "${text}"
    ${str}    Get text    ${WIRELESS_SSID_PAGE_INNER_SUBTITLE}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Page name in edit ssid page should be "${text}"
    ${str}    Get text    ${WIRELESS_SSID_PAGE_EDIT_SSID_NAME}
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Page inner subtitle add new network should be "${text}"
    ${str}    Get text    ${WIRELESS_SSID_PAGE_ADD_NEW_NETWORK_INNER_SUBTITLE} 
    ${str_stripped}    Strip string    ${str}
    Should be equal as strings    ${str_stripped}    ${text}

Add SSID settings button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON_TEXT}    ==    ${text}

Add SSID settings button should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON} 
    ...    contains
    ...    visible

Add SSID in table
    Click    ${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON}

Add New Network settings button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADD_SETTINGS_BUTTON}    ==    ${text}

Edit default SSID in table
    Click    ${WIRELESS_SSID_PAGE_EDIT_SSID_BUTTON}

Cancel settings button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CANCEL_SETTINGS_BUTTON}    ==    ${text}


################################
#    Keywords Table SSID       #     
################################


Wireless SSID table should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_TABLE} 
    ...    contains
    ...    visible
Checkbox header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_CHECKBOX_NAME}     ==    ${text}

Checkbox is checked
    Get Checkbox State    ${WIRELESS_SSID_PAGE_CHECKBOX}       ==    checked

SSID header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_NETWORK_NAME}     ==    ${text}

Value of the SSID in the table should be
    [Arguments]    ${expected_pattern}
    ${ssid_value}    Get Text    ${WIRELESS_SSID_PAGE_NETWORK_NAME}
    Should Match Regexp    ${ssid_value}    ${expected_pattern}    msg=SSID value does not match expected pattern
    Log To Console    SSID: ${ssid_value}

Frequency header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_FREQUENCY}    ==    ${text}

Frequency should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY}    ==    ${text}
    
Delete header should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_HEADER_DELETE} 
    ...    contains
    ...    visible




###############################################
#            Keywords (open-system)           #     
###############################################


SSID input title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT_TITLE}    ==    ${text}

SSID input should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}    ==    ${text}

Value of the SSID in the input should be
    [Arguments]    ${expected_pattern}
    ${ssid_value}          Get Text    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}
    Should Match Regexp    ${ssid_value}    ${expected_pattern}    msg=SSID value does not match expected pattern
    Log To Console         SSID: ${ssid_value}
    ${ssid_length}         Get Length    ${ssid_value}
    Should Be True         ${ssid_length} >= 1     msg=SSID length is no more than 1
    Should Be True         ${ssid_length} <= 32    msg=SSID length is not less than 32 
    

SSID placeholder should be "${text}"
    Get attribute
    ...    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}
    ...    placeholder    ==    ${text}

SSID input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}
    ...    contains
    ...    enabled
    ...    message=SSID input should be enabled (editable).

Authentication SSID title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_TITLE}    ==    ${text}

Authentication SSID select option should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}    ==    ${text}
   
Authentication SSID select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}
    ...    contains
    ...    enabled
    ...    message=Authentication SSID select should be enabled (editable).

Open Authentication SSID selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}
    END

Select Authentication SSID "${option}"
    Open Authentication SSID selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${option}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${option} authentication SSID available, but there were.
            RETURN
        END
    END
    Fail    authentication SSID method ${option} is not available.

There should be "${number}" authentication SSID available
    Open Authentication SSID selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} authentication SSID available, but there were ${list_length}.
    ...    values=${false}

Authentication SSID "${text}" should be available
    Select Authentication SSID "${text}"

Frequency toggle text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_TEXT}     ==    ${text}

Frequency toggle should be enabled
    ${element_states}    Get element states    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}
    Should Contain    ${element_states}    checked    Frequency toggle should be enabled (editable).

Frequency toggle should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}    ==    unchecked
    ...    Frequency toggle should be disabled.

Enable Frequency toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}    checked

Disable Frequency toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}    unchecked

Frequency 2.4GHz checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_TEXT}    ==    ${text}

Frequency 2.4GHz checkbox should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_CLICKABLE}
    ...    contains
    ...    visible

Frequency 2.4GHz checkbox should be enabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX}    ==    checked
    ...    Frequency 2.4GHz checkbox should be enabled.

Frequency 5GHz checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_TEXT}    ==    ${text}

Frequency 5GHz checkbox should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_CLICKABLE}
    ...    contains
    ...    visible

Frequency 5GHz checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX}    ==    unchecked
    ...    Frequency 5GHz checkbox should be disabled.

Advanced setting title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADVANCED_SETTING_TITLE}    ==    ${text}

Isolate SSID checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX_TEXT}     ==    ${text}

Isolate SSID checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX}    ==    unchecked
    ...    Isolate SSID checkbox should be disabled.

Only Internet checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX_TEXT}     ==    ${text}

Only Internet checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX}    ==    unchecked
    ...    Only Internet checkbox should be disabled.
    
Hide SSID checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX_TEXT}     ==    ${text}

Hide SSID checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX}    ==    unchecked
    ...    Hide SSID checkbox should be disabled.

Isolate customers checkbox text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX_TEXT}     ==    ${text}

Isolate customers checkbox should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX}    ==    unchecked
    ...    Isolate customers checkbox should be disabled.

VLAN toggle text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE_TEXT}    ==    ${text}

VLAN toggle should be enabled
    ${element_states}    Get element states    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}
    Should Contain    ${element_states}    checked    VLAN toggle should be enabled (editable).

VLAN toggle should be disabled
    Get checkbox state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}    ==    unchecked
    ...    VLAN toggle should be disabled.

Enable VLAN toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}    checked

Disable VLAN toggle
    ${checked}    Get checkbox state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${WIRELESS_SSID_PAGE_VLAN_TOGGLE}    unchecked

Slider input VLAN should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}    ==    ${text}

Slider input VLAN should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input VLAN should be enabled (editable).

Slider input VLAN should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}
    ...    contains
    ...    visible
    ...    message=Slider input VLAN should be visible (editable).

Slider VLAN should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_VLAN_SLIDER}
    ...    contains
    ...    visible

Minimum value of the slider VLAN should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_VLAN_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider VLAN should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_VLAN_MAXIMUM_VALUE_SLIDER}    ==    ${text}

ACL title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_SELECT_TITLE}    ==    ${text}

ACL select option should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_SELECT}    ==    ${text}
   
ACL select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_SELECT}
    ...    contains
    ...    enabled
    ...    message=ACL select should be enabled (editable).

Open ACL selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_ACL_SELECT}
    END

Select ACL "${option}"
    Open ACL selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    '$method_text' == '$option'
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${option} ACL available, but there were.
            RETURN
        END
    END
    Fail    ACL method ${option} is not available.

There should be "${number}" ACL available
    Open ACL selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} ACL available, but there were ${list_length}.
    ...    values=${false}

ACL "${text}" should be available
    Select ACL "${text}"

Add settings ACL rules button text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON_TEXT}    ==    ${text}

Add settings ACL rules button should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON} 
    ...    contains
    ...    visible

Add ACL rule in table
    Click    ${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON}

Wireless SSID ACL table should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_TABLE}
    ...    contains
    ...    visible

Description header should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_HEADER_DESCRIPTION} 
    ...    contains
    ...    visible
    
Description header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_DESCRIPTION}    ==    ${text}

Description input text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_DESCRIPTION_INPUT}    ==    ${text}

Description input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_DESCRIPTION_INPUT}
    ...    contains
    ...    enabled
    ...    message=Description input should be enabled (editable).

MAC header should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_HEADER_MAC} 
    ...    contains
    ...    visible
    
MAC header should be "${text}" in table
    Get text    ${WIRELESS_SSID_PAGE_HEADER_MAC}    ==    ${text}

MAC input text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_MAC_INPUT}    ==    ${text}

MAC input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_MAC_INPUT}
    ...    contains
    ...    enabled
    ...    message=MAC input should be enabled (editable).

Delete settings ACL rules button should be visible in table
    Get element states
    ...    ${WIRELESS_SSID_PAGE_DELETE_ACL_RULE_BUTTON} 
    ...    contains
    ...    visible

Rows per page select title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_TEXT}    ==    ${text}

Rows per page select for pagination should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT}    ==    ${text}
   
Rows per page select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT}
    ...    contains
    ...    enabled
    ...    message=ACL Pagination select should be enabled (editable).

Pagination number text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_ACL_PAGINATION_NUMBER_TEXT}    ==    ${text}

Pagination button before should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_PAGINATION_BUTTON_BEFORE} 
    ...    contains
    ...    visible

Pagination button after should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_ACL_PAGINATION_BUTTON_AFTER} 
    ...    contains
    ...    visible

Slider title for clients connected on the 2.4GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_TITLE}    ==    ${text}

Slider input for clients connected on the 2.4GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}    ==    ${text}

Slider input for clients connected on the 2.4GHz frequency should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input for clients connected on the 2.4GHz frequency should be enabled (editable).

Slider input for clients connected on the 2.4GHz frequency should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}
    ...    contains
    ...    visible
    ...    message=Slider input for clients connected on the 2.4GHz frequency should be visible (editable).

Slider clients connected on the 2.4GHz frequency should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER}
    ...    contains
    ...    visible

Minimum value of the slider for 2.4GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider for 2.4GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MAXIMUM_VALUE_SLIDER}    ==    ${text}

Slider title for clients connected on the 5GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_TITLE}    ==    ${text}
    
Slider input for clients connected on the 5GHz frequency should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}    ==    ${text}

Slider input for clients connected on the 5GHz frequency should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input for clients connected on the 5GHz frequency should be enabled (editable).

Slider input for clients connected on the 5GHz frequency should be not visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}
    ...    not contains
    ...    detached
    ...    message=Slider input for clients connected on the 5GHz frequency should be not visible (not editable).

Slider clients connected on the 5GHz frequency should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER}
    ...    contains
    ...    visible

Slider clients connected on the 5GHz frequency should be not visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER}
    ...    not contains
    ...    detached

Minimum value of the slider for 5GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider for 5GHz clients connected should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MAXIMUM_VALUE_SLIDER}    ==    ${text}

Slider title for clients signal dBm should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_TITLE}    ==    ${text}

Slider input for clients signal dBm should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_INPUT}    ==    ${text}

Slider input for clients signal dBm should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_INPUT}
    ...    contains
    ...    enabled
    ...    message=Slider input for clients signal dBm should be enabled (editable).

Slider clients signal dBm should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER}
    ...    contains
    ...    visible
    
Minimum value of the slider for clients signal dBm should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MINIMUM_VALUE_SLIDER}    ==    ${text}

Maximum value of the slider for clients signal dBm should be ${text}
    Get text    ${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MAXIMUM_VALUE_SLIDER}    ==    ${text}


###############################################
#           Keywords (psk-psk2)               #     
###############################################


Value of the password in the input should be
    [Arguments]    ${expected_pattern}
    ${password_value}    Get Text    ${WIRELESS_SSID_PAGE_PASSWORD_INPUT}
    Should Match Regexp    ${password_value}         ${expected_pattern}    msg=Password value does not match expected pattern
    Log To Console         Password: ${password_value}
    ${password_length}     Get Length    ${password_value}
    Should Be True         ${password_length} >= 8     msg=Password length is no more than 8
    Should Be True         ${password_length} <= 63    msg=Password length is not less than 63 

Password input should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_PASSWORD_INPUT}
    ...    contains
    ...    enabled
    ...    message=Password input should be enabled (editable).

Click password revealer
    Click    ${WIRELESS_SSID_PAGE_PASSWORD_REVEALER}

Password revealer should be visible
    Get element states
    ...    ${WIRELESS_SSID_PAGE_PASSWORD_REVEALER}
    ...    contains
    ...    visible

Cryptography PSK-PSK2 title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_TITLE}    ==    ${text}

Cryptography PSK-PSK2 select option should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT}    ==    ${text}
   
Cryptography PSK-PSK2 select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT}
    ...    contains
    ...    enabled
    ...    message=Cryptography select should be enabled (editable).

Open Cryptography PSK-PSK2 selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT}
    END

Select Cryptography PSK-PSK2 "${text}"
    Open Cryptography PSK-PSK2 selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} encryption available, but there were.
            RETURN
        END
    END
    Fail    encryption method ${text} is not available.

There should be "${number}" encryption PSK-PSK2 methods available
    Open Cryptography PSK-PSK2 selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} encryption available, but there were ${list_length}.
    ...    values=${false}

Cryptography PSK-PSK2 "${text}" should be available
    Select Cryptography PSK-PSK2 "${text}"


###############################################
#           Keywords (wpa-wpa2)               #     
###############################################


Cryptography WPA-WPA2 title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_TITLE}    ==    ${text}

Cryptography WPA-WPA2 select option should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT}    ==    ${text}
   
Cryptography WPA-WPA2 select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT}
    ...    contains
    ...    enabled
    ...    message=Cryptography select should be enabled (editable).

Open Cryptography WPA-WPA2 selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT}
    END

Select Cryptography WPA-WPA2 "${text}"
    Open Cryptography WPA-WPA2 selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${method_elem}    IN    @{method_list}
        ${method_text}    Get text    ${method_elem}
        IF    "${method_text}" == "${text}"
            Click    ${method_elem}
            Get element states
            ...    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} encryption available, but there were.
            RETURN
        END
    END
    Fail    encryption method ${text} is not available.

There should be "${number}" encryption WPA-WPA2 methods available
    Open Cryptography WPA-WPA2 selection dropdown menu

    ${method_list}    Get elements    ${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${method_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} encryption available, but there were ${list_length}.
    ...    values=${false}

Cryptography WPA-WPA2 "${text}" should be available
    Select Cryptography WPA-WPA2 "${text}"

Server Authentication Radius title should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_SERVER_RADIUS_TITLE}    ==    ${text}

Register Server Radius in table
    Click    ${WIRELESS_SSID_PAGE_REGISTER_SETTINGS_BUTTON}

Radius server registration button should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_REGISTER_SETTINGS_BUTTON_TEXT}    ==    ${text}

Radius server table headers should be
    [Arguments]    ${server_header_default}    ${server_address_header_default}    ${authentication_port_header_default}   
    ${server}    Get Text    ${WIRELESS_SSID_PAGE_HEADER_SERVER}
    ${server_address}    Get Text    ${WIRELESS_SSID_PAGE_HEADER_SERVER_ADDRESS}
    ${authentication_port}    Get Text    ${WIRELESS_SSID_PAGE_HEADER_AUTHENTICATION_PORT}
    @{text_parts}=    Create List    ${server_header_default}    ${server_address_header_default}    ${authentication_port_header_default}    
    Should Be Equal As Strings    ${server}    ${text_parts}[0]
    Should Be Equal As Strings    ${server_address.title()}    ${text_parts}[1]
    Should Be Equal As Strings    ${authentication_port}    ${text_parts}[2]

Server select should be enabled
    Get element states
    ...    ${WIRELESS_SSID_PAGE_SERVER_SELECT}
    ...    contains
    ...    enabled
    ...    message=Server select should be enabled (editable).

Open Server selection dropdown menu
    ${elem_states}    Get element states    ${WIRELESS_SSID_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    
        Click    ${WIRELESS_SSID_PAGE_SERVER_SELECT}
    END

Select Server "${text}"
    Open Server selection dropdown menu

    ${server_list}    Get elements    ${WIRELESS_SSID_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}/li
    FOR    ${server_elem}    IN    @{server_list}
        ${method_text}    Get text    ${server_elem}
        IF    "${method_text}" == "${text}"
            Click    ${server_elem}
            Get element states
            ...    ${WIRELESS_SSID_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}
            ...    not contains
            ...    visible
            ...    message=There should be ${text} server available, but there were.
            RETURN
        END
    END
    Fail    server method ${text} is not available.

There should be "${number}" server methods available
    Open Server selection dropdown menu

    ${server_list}    Get elements    ${WIRELESS_SSID_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}/li
    ${list_length}    Get length    ${server_list}

    Should be equal as integers
    ...    ${list_length}
    ...    ${number}
    ...    msg=There should be ${number} server available, but there were ${list_length}.
    ...    values=${false}

Server "${text}" should be available
    Select Server "${text}"

Server address text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_SERVER_ADDRESS}    ==    ${text}

Port authentication text should be "${text}"
    Get text    ${WIRELESS_SSID_PAGE_AUTHENTICATION_PORT}    ==    ${text}