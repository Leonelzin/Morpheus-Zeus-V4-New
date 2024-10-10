*** Settings ***
Library     Browser
Library     String
Resource    wireless_ssid_keywords.resource
Resource    ../../../../../resources/common/common_resources.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                            xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_WIRELESS_SUBMENU}                                                  xpath=//*[@id="sidebar-options-menu"]/div[3]/div/div/div
${SIDEMENU_WIRELESS_SSID}                                                     xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[1]/p


${WIRELESS_SSID_PAGE_INNER_TITLE}                                             xpath=//*[@id="root"]/div[3]/div/div[1]/div[1]
${WIRELESS_SSID_PAGE_INNER_SUBTITLE}                                          xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]
${WIRELESS_SSID_PAGE_ADD_NEW_NETWORK_INNER_SUBTITLE}                          xpath=//*[@id="root"]/div[3]/div/div[1]/div[2]

${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON_TEXT}                                    xpath=//*[@id="root"]/div[3]/div/div[2]
${WIRELESS_SSID_PAGE_ADD_SSID_BUTTON}                                         xpath=//*[@id="root"]/div[3]/div/div[2]/span/button

${WIRELESS_SSID_PAGE_EDIT_SSID_BUTTON}                                        data-testid=table-edit-option


################################
#    Variables Table SSID      #     
################################


${WIRELESS_SSID_PAGE_TABLE}                                                   xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]

${WIRELESS_SSID_PAGE_HEADER_CHECKBOX_NAME}                                    xpath=//*[@id="root"]/div[3]/div/div[3]/div[1]/div[1]
${WIRELESS_SSID_PAGE_HEADER_NETWORK_NAME}                                     data-testid=table-ssid-header
${WIRELESS_SSID_PAGE_HEADER_FREQUENCY}                                        data-testid=table-frequency-header
${WIRELESS_SSID_PAGE_HEADER_EDIT}                                             data-testid=table-edit-header
${WIRELESS_SSID_PAGE_HEADER_DELETE}                                           data-testid=table-delete-header

${WIRELESS_SSID_PAGE_CHECKBOX}                                                xpath=//*[@id="root"]/div[3]/div/div[3]/div[2]/div/div[1]/label/input
${WIRELESS_SSID_PAGE_NETWORK_NAME}                                            data-testid=table-ssid
${WIRELESS_SSID_PAGE_FREQUENCY}                                               data-testid=table-frequency
${WIRELESS_SSID_PAGE_EDIT}                                                    data-testid=table-edit-option
${WIRELESS_SSID_PAGE_DELETE}                                                  data-testid=table-delete-option

${WIRELESS_SSID_PAGE_ADD_SETTINGS_BUTTON}                                     data-testid=add-ssid-button
${WIRELESS_SSID_PAGE_CANCEL_SETTINGS_BUTTON}                                  data-testid=cancel-ssid-button


###############################################
#          Variables (open-system)            #     
###############################################


${WIRELESS_SSID_PAGE_EDIT_SSID_NAME}                                          data-testid=inner-title

${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT_TITLE}                                data-testid=ssid-input-title
${WIRELESS_SSID_PAGE_NETWORK_NAME_INPUT}                                      data-testid=ssid-input

${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_TITLE}                             data-testid=authentication-select-title
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT}                                   data-testid=authentication-select
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTIONS_DROPDOWN}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_OPEN_SYSTEM}                xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[1]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA_PSK}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[2]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA2_PSK}                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[3]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[4]
${WIRELESS_SSID_PAGE_AUTHENTICATION_SELECT_OPTION_WPA2}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div[2]/div/div/ul/li[5]

${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE}                                        data-testid=dual-band-toggle
${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_CLICKABLE}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div/label
${WIRELESS_SSID_PAGE_FREQUENCY_TOGGLE_TEXT}                                   data-testid=dual-band-toggle-text

${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX}                                 data-testid=2ghz-checkbox
${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_CLICKABLE}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[2]/div/label[1]
${WIRELESS_SSID_PAGE_FREQUENCY_2GHZ_CHECKBOX_TEXT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[2]

${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX}                                 data-testid=5ghz-checkbox
${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_CLICKABLE}                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[3]/div/label[1]
${WIRELESS_SSID_PAGE_FREQUENCY_5GHZ_CHECKBOX_TEXT}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[4]/div/div[3]

${WIRELESS_SSID_PAGE_ADVANCED_SETTING_TITLE}                                  data-testid=advanced-setting-title

${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX}                                   data-testid=isolate-ssid-checkbox
${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX_CLICKABLE}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[1]/div/label
${WIRELESS_SSID_PAGE_ISOLATE_SSID_CHECKBOX_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[1]

${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX}                                  data-testid=only-internet-checkbox
${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX_CLICKABLE}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[2]/div/label
${WIRELESS_SSID_PAGE_ONLY_INTERNET_CHECKBOX_TEXT}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[2]

${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX}                                      data-testid=hide-ssid-checkbox
${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX_CLICKABLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[3]/div/label
${WIRELESS_SSID_PAGE_HIDE_SSID_CHECKBOX_TEXT}                                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[3]

${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX}                              data-testid=isolate-customers-checkbox
${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX_CLICKABLE}                    xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[4]/div/label
${WIRELESS_SSID_PAGE_ISOLATE_CUSTOMERS_CHECKBOX_TEXT}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div[2]/div[4]

${WIRELESS_SSID_PAGE_VLAN_TOGGLE}                                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]/div[1]/div/label/input
${WIRELESS_SSID_PAGE_VLAN_TOGGLE_CLICKABLE}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]/div/div/label
${WIRELESS_SSID_PAGE_VLAN_TOGGLE_TEXT}                                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[6]

${WIRELESS_SSID_PAGE_VLAN_SLIDER_INPUT}                                       xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[1]/div/div/input
${WIRELESS_SSID_PAGE_VLAN_SLIDER}                                             xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[2]/div[2]/div[1]/div
${WIRELESS_SSID_PAGE_VLAN_MINIMUM_VALUE_SLIDER}                               xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[2]/div[1]
${WIRELESS_SSID_PAGE_VLAN_MAXIMUM_VALUE_SLIDER}                               xpath=/html/body/div/div[3]/div/div[2]/div[6]/div[2]/div[2]/div[3]
    
${WIRELESS_SSID_PAGE_ACL_TITLE}                                               data-testid=acl-title
${WIRELESS_SSID_PAGE_ACL_SELECT_TITLE}                                        data-testid=acl-select-title
${WIRELESS_SSID_PAGE_ACL_SELECT}                                              data-testid=acl-select
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTIONS_DROPDOWN}                             data-testid=acl-select-option
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTION_DISABLED}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[7]/div/div/ul/li[1]/div
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTION_ALLOW_LISTINGS}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[7]/div/div/ul/li[2]/div
${WIRELESS_SSID_PAGE_ACL_SELECT_OPTION_LISTED_BLOCKS}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[7]/div/div/ul/li[3]/div

${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON_TEXT}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/span/span
${WIRELESS_SSID_PAGE_ADD_ACL_RULE_BUTTON}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[8]/span/button

${WIRELESS_SSID_PAGE_DELETE_ACL_RULE_BUTTON}                                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[2]/div/div[3]

${WIRELESS_SSID_PAGE_ACL_TABLE}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[1]

${WIRELESS_SSID_PAGE_HEADER_DESCRIPTION}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[1]/div[1]
${WIRELESS_SSID_PAGE_HEADER_MAC}                                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[1]/div[2]

${WIRELESS_SSID_PAGE_DESCRIPTION_INPUT}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[2]/div/div[1]/div/div/div/input
${WIRELESS_SSID_PAGE_MAC_INPUT}                                               xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[1]/div[2]/div/div[2]/div/div/div/input

${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/p[1]

${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_1}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[1]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_2}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[2]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_3}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[3]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_4}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[4]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_5}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[5]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_6}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[6]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_7}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[7]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_8}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[8]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_9}                         xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[9]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_SELECT_OPTIONS_10}                        xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/select/option[10]

${WIRELESS_SSID_PAGE_ACL_PAGINATION_NUMBER_TEXT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/p[2]

${WIRELESS_SSID_PAGE_ACL_PAGINATION_BUTTON_BEFORE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/button[1]
${WIRELESS_SSID_PAGE_ACL_PAGINATION_BUTTON_AFTER}                             xpath=//*[@id="root"]/div[3]/div/div[2]/div[9]/div/div[2]/button[2]

${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_TITLE}                     data-testid=slider-clients-connected-2ghz-title
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER_INPUT}                     data-testid=slider-clients-connected-2ghz-input
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_SLIDER}                           data-testid=slider-clients-connected-2ghz
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MINIMUM_VALUE_SLIDER}             xpath=//*[@id="range_min_max_editable"]/div[1]/span
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_2GHZ_MAXIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[8]/div/div[2]/div[3]

${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_TITLE}                     data-testid=slider-clients-connected-5ghz-title
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER_INPUT}                     data-testid=slider-clients-connected-5ghz-input
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_SLIDER}                           data-testid=slider-clients-connected-5ghz
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MINIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[9]/div/div[2]/div[1]
${WIRELESS_SSID_PAGE_CLIENTS_CONNECTED_5GHZ_MAXIMUM_VALUE_SLIDER}             xpath=/html/body/div/div[3]/div/div[2]/div[9]/div/div[2]/div[3]

${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_TITLE}                         data-testid=slider-clients-signal-dbm-title
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER_INPUT}                         data-testid=slider-clients-signal-dbm-input
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_SLIDER}                               data-testid=slider-clients-signal-dbm
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MINIMUM_VALUE_SLIDER}                 xpath=/html/body/div/div[3]/div/div[2]/div[10]/div/div[2]/div[1]
${WIRELESS_SSID_PAGE_CLIENTS_SIGNAL_DBM_MAXIMUM_VALUE_SLIDER}                 xpath=/html/body/div/div[3]/div/div[2]/div[10]/div/div[2]/div[3]


###############################################
#            Variables (psk-psk2)             #     
###############################################

${WIRELESS_SSID_PAGE_PASSWORD_TITLE}                                          data-testid=password-input-title
${WIRELESS_SSID_PAGE_PASSWORD_INPUT}                                          data-testid=password-input

${WIRELESS_SSID_PAGE_PASSWORD_REVEALER}                                       xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div[1]/div/div[2]/span[2] >> svg

${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_TITLE}                      data-testid=cryptography-psk-psk2-select-title
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT}                            data-testid=cryptography-psk-psk2-select
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTIONS_DROPDOWN}           xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div[2]/div/div/ul
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTION_SELECT}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div[2]/div/div/ul/li[1]
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_PSK_PSK2_SELECT_OPTION_AES}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div[2]/div/div/ul/li[2]


###############################################
#            Variables (wpa-wpa2)             #     
###############################################


${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_TITLE}                      data-testid=cryptography-psk-psk2-select-title
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT}                            data-testid=cryptography-psk-psk2-select
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTIONS_DROPDOWN}           xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/div/div/ul
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTION_SELECT}              xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/div/div/ul/li[1]
${WIRELESS_SSID_PAGE_CRYPTOGRAPHY_WPA_WPA2_SELECT_OPTION_AES}                 xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div/div/div/div/ul/li[2]

${WIRELESS_SSID_PAGE_SERVER_RADIUS_TITLE}                                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[1]/div

${WIRELESS_SSID_PAGE_REGISTER_SETTINGS_BUTTON}                                xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[1]/span/button
${WIRELESS_SSID_PAGE_REGISTER_SETTINGS_BUTTON_TEXT}                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[1]/span/span

${WIRELESS_SSID_PAGE_HEADER_SERVER}                                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[2]/div[1]
${WIRELESS_SSID_PAGE_HEADER_SERVER_ADDRESS}                                   xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[2]/div[2]
${WIRELESS_SSID_PAGE_HEADER_AUTHENTICATION_PORT}                              xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[2]/div[3]

${WIRELESS_SSID_PAGE_SERVER_SELECT}                                           xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[3]/div[1]/div/div/div/input
${WIRELESS_SSID_PAGE_SERVER_SELECT_OPTIONS_DROPDOWN}                          xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[3]/div[1]/div/div/ul
${WIRELESS_SSID_PAGE_SERVER_SELECT_OPTION_EXAMPLE_SERVER}                     xpath=//*[@id="root"]/div[3]/div/div[2]/div[3]/div/div[3]/div[1]/div/div/ul/li

${WIRELESS_SSID_PAGE_SERVER_ADDRESS}                                          xpath=/html/body/div/div[3]/div/div[2]/div[3]/div/div[3]/div[2]
${WIRELESS_SSID_PAGE_AUTHENTICATION_PORT}                                     xpath=/html/body/div/div[3]/div/div[2]/div[3]/div/div[3]/div[3]