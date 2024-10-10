*** Settings ***
Library     Browser
Library     Process
Library     String
Library     OperatingSystem
Resource    ../../../resources/common/common_resources.resource


*** Variables ***
# NAVIGATION
${ADD_BUTTON}                                                                        data-testid=add-button
${SAVE_BUTTON}                                                                       data-testid=add-ssid-button
${SSIDS_TABLE_HEADER}                                                                data-testid=table-ssid-header
${APPLYING_MODAL}                                                                    id=response_undefined

# FORM
${SSID_INPUT_NAME}                                                                   data-testid=ssid-input

# COMANDS
${COMMAND}                                                                           nmcli -f SSID,CHAN,BSSID,ACTIVE,SIGNAL,BARS,SECURITY device wifi list


*** Keywords ***
Go to new wireless SSID page
    Click    ${SIDE_MENU_WIRELESS}
    Click    ${SIDE_SUBMENU_WIRELESS}
    Sleep    2s
    Click    ${ADD_BUTTON}

Create open ssid "${NAME}"
    Wait Until Network Is Idle
    Click      ${SSID_INPUT_NAME}
    Sleep      5s
    Type Text  ${SSID_INPUT_NAME}  ${NAME}
    Click      ${SAVE_BUTTON}

    Wait for elements state    ${SSIDS_TABLE_HEADER}    visible
    Click      ${HEADER_SETTINGS_ICON}
    Click      ${HEADER_SETTINGS_APPLY_SETTINGS_BUTTON} 
    Click      ${HEADER_SETTINGS_APPLY_SETTINGS_MODAL_CONFIRM_BUTTON}
    Wait for elements state    ${APPLYING_MODAL}    hidden

Verify created SSID "${NAME}"
    Wait until DUT system is ready
    Log To Console    Verifying created SSID "${NAME}"
    Regressive counter    10
    ${result}    Run Process    ${COMMAND}    shell=True    stdout=stdout.txt    stderr=stderr.txt
    ${output}    Get File    stdout.txt
    ${error}     Get File    stderr.txt
    Log To Console    ${output}
    Should Contain    ${output}    ${NAME}
