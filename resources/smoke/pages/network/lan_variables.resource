*** Settings ***
Library     Browser
Library     String
Resource    ../../../../resources/common/common_resources.resource
Resource    lan_keywords.resource


*** Variables ***
${SIDEMENU_TOGGLE}                                                              xpath=//*[@id="sidebar_menu"]/div[1]/div[1]
${SIDEMENU_NETWORK_SUBMENU}                                                     xpath=//*[@id="sidebar-options-menu"]/div[2]/div
${SIDEMENU_NETWORK_LAN}                                                         xpath=//*[@id="sidebar-options-menu"]/div[2]/ul/div[3]/p

###

${NETWORK_LAN_PAGE_INNER_TITLE}                                                 data-testid=inner-title
${NETWORK_LAN_PAGE_INNER_SUBTITLE}                                              data-testid=inner-subtitle

${NETWORK_LAN_PAGE_SAVE_SETTINGS_BUTTON}                                        xpath=//*[@id="root"]/div[3]/div/div[3]/button

##############
#    IPV4    #
##############
${NETWORK_LAN_PAGE_IPV4_SETTINGS_BUTTON}                                        data-testid=ipv4-settings-button

${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_TITLE}                      xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div[2]
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE}                            xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div[1]/label/input
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_CLICKABLE}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1]/div/div[1]/label
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_ICON}                  xpath=//*[@id="root"]/div[3]/div/div[2]/div[1] >> svg

${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_TEXT}            xpath=//*[@id="overlay-cntse"]/div/div[2]/div
${NETWORK_LAN_PAGE_IPV4_AUTOMATIC_IP_ADDRESS_TOGGLE_INFO_MODAL_CLOSE_BUTTON}    data-testid=dhcp-infobox-modal-ok-button

${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT_TITLE}                          data-testid=ipv4-ip-address-input-title
${NETWORK_LAN_PAGE_IPV4_STATIC_IP_ADDRESS_INPUT}                                data-testid=ipv4-ip-address-input

${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT_TITLE}                                data-testid=ipv4-netmask-input-title
${NETWORK_LAN_PAGE_IPV4_SUBNET_MASK_INPUT}                                      data-testid=ipv4-netmask-input

${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT_TITLE}                            data-testid=ipv4-gateway-input-title
${NETWORK_LAN_PAGE_IPV4_DEFAULT_GATEWAY_INPUT}                                  data-testid=ipv4-gateway-input

##############
#    IPV6    #
##############
${NETWORK_LAN_PAGE_IPV6_SETTINGS_BUTTON}                                        data-testid=ipv6-settings-button

${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_TITLE}                               data-testid=ipv6-config-mode-select-title
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT}                                     data-testid=ipv6-config-mode-select
${NETWORK_LAN_PAGE_IPV6_CONFIG_TYPE_SELECT_DROPDOWN}                            data-testid=ipv6-config-mode-select >> ../../ul

${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TITLE}                                       data-testid=ipv6-link-local-title
${NETWORK_LAN_PAGE_IPV6_LINK_LOCAL_TEXT}                                        data-testid=ipv6-link-local

${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT_TITLE}                                 data-testid=ipv6-manual-ip-address-input-title
${NETWORK_LAN_PAGE_IPV6_IP_ADDRESS_INPUT}                                       data-testid=ipv6-manual-ip-address-input

${NETWORK_LAN_PAGE_IPV6_PREFIX_LENGTH_INPUT_TITLE}                              data-testid=ipv6-manual-prefix-length-input-title
${NETWORK_LAN_PAGE_IPV6_PREFIX_LENGTH_INPUT}                                    data-testid=ipv6-manual-prefix-length-input

${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT_TITLE}                            data-testid=ipv6-gateway-input-title
${NETWORK_LAN_PAGE_IPV6_DEFAULT_GATEWAY_INPUT}                                  data-testid=ipv6-gateway-input