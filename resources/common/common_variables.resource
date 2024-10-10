*** Settings ***
Library     Browser
Library     ../../libraries/ImageCompareLibrary.py
Resource    ../../resources/smoke/pages/login/login.resource
Resource    ../../resources/common/common_resources.resource


*** Variables ***
# BROWSER
${GLOBAL_DEBUG_BROWSER}                                     ${false}

# DUT
${DUT_MGMT_IPV4_ADDRESS}                                    192.168.0.72
${DUT_MGMT_HTTP_PORT}                                       80
${DUT_MGMT_HTTP_PROTOCOL}                                   http
${DUT_MGMT_URL}                                             ${DUT_MGMT_HTTP_PROTOCOL}://${DUT_MGMT_IPV4_ADDRESS}:${DUT_MGMT_HTTP_PORT}
${DUT_MGMT_USER}                                            admin
${DUT_MGMT_PASSWORD}                                        Lockzeus@1
${DUT_MGMT_FIRST_ACCESS_PASSWORD}                           M9w3#EH3

# LOGIN
${FIRST_ACCESS_URL}                                         ${DUT_MGMT_HTTP_PROTOCOL}://${DUT_MGMT_IPV4_ADDRESS}/login_first_access
${IS_LOGIN_FIRST_ACCESS}                                    ${False}

# HEADER
${HEADER_SETTINGS_ICON}                                     xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[2]/div[2]
${HEADER_SETTINGS_DROPDOWN}                                 xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]
${HEADER_SETTINGS_CONFIRM_SETTINGS_BUTTON}                  xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]
${HEADER_SETTINGS_DISCARD_SETTINGS_BUTTON}                  xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]/div/a[6]
${HEADER_SETTINGS_DISCARD_SETTINGS_MODAL_CONFIRM_BUTTON}    xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]

${HEADER_SETTINGS_APPLY_SETTINGS_BUTTON}                    xpath=//*[@id="root"]/div[2]/div[2]/div/div[3]/div[3]/div/a[5]        
${HEADER_SETTINGS_APPLY_SETTINGS_MODAL_CONFIRM_BUTTON}      xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/button[2]

${APLLYING_CONFIGURATION_ALERT}                             id="response_undefined"

# DUT PAGES
${DUT_LOGIN_WEBPAGE_URL}                                    ${DUT_MGMT_URL}/login
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
# SIDEBAR MENU
${SIDEMENU}                                                 id=sidebar_menu
${SIDE_MENU_LOGO}                                           id="sidebar-intelbras-logo"
${SIDE_MENU_DASHBOARD}                                      xpath=//*[@id="sidebar-options-menu"]/div[1]/div

# SIDEBAR NETWORK MENU
${SIDE_MENU_NETWORK}                                        xpath=//*[@id="sidebar-options-menu"]/div[2]/div/div/i
${SIDE_SUBMENU_OPERATION_MODE}                              xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[1]

# SIDEBAR WIRELESS MENU
${SIDE_MENU_WIRELESS}                                       xpath=//*[@id="sidebar-options-menu"]/div[3]/div/div/div/div
${SIDE_SUBMENU_WIRELESS}                                    xpath=//*[@id="sidebar-options-menu"]/div[3]/ul/div[1]

# SIDEBAR SYSTEM MENU
${SIDE_MENU_SYSTEM}                                         xpath=//*[@id="sidebar-options-menu"]/div[4]/div/div

${SIDE_SUBMENU_MANAGEMENT}                                  xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[1]
${SIDE_SUBMENU_BACKUP_RESTORE}                              xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[2]
${SIDE_SUBMENU_ATUALIZATION}                                xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[3]
${SIDE_SUBMENU_LOG}                                         xpath=//*[@id="sidebar-options-menu"]/div[4]/ul/div[4]

# SIDEBAR SERVICE MENU
${SIDE_MENU_SERVICES}                                       xpath=//*[@id="sidebar-options-menu"]/div[5]/div/div/i
${SIDE_SUBMENU_DISCOVERY}                                   xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[2]
${SIDE_SUBMENU_NTP}                                         xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[3]
${SIDE_SUBMENU_SNMP}                                        xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[4]
${SIDE_SUBMENU_WATCHDOG}                                    xpath=//*[@id="sidebar-options-menu"]/div[5]/ul/div[5]

# SYSTEM TABS
${SYSTEM_TAB_SSH}                                           xpath=//*[@id="root"]/div[3]/div/div[2]/ul/li[3]/button
${ENABLE_SSH_CHECKBOX}                                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/label/div

# MODAL
${MODAL_ATUALIZATION_CLOSE}                                 xpath=//*[@id="overlay-cntse"]/div/div[3]/button
${MODAL_PASSWORD_ERROR}                                     xpath=//*[@id="root"]/div[1]/div
