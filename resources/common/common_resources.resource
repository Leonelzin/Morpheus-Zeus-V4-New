*** Settings ***
Library     Browser
Library     ../../libraries/ImageCompareLibrary.py
Resource    ../../resources/smoke/pages/login/login.resource
Resource    ../../resources/fiber/fiber.resource
Resource    ../../resources/common/common_variables.resource
Resource    ../smoke/pages/network/captive_portal.resource
Resource    ../smoke/pages/wireless/wireless_ssid/wireless_ssid_keywords.resource

*** Keywords ***
#################
#    Browser    #
#################

Setup browser
    [Arguments]    ${url}=${none}
    ${GLOBAL_DEBUG_BROWSER}    Convert to boolean    ${GLOBAL_DEBUG_BROWSER}
    IF    not ${GLOBAL_DEBUG_BROWSER}
        New page    ${url}
    ELSE
        Open browser    ${url}    pause_on_failure=${false}
    END

Clear browser storages
    Localstorage clear
    Sessionstorage clear

################
#    Images    #
################

Take HTML element screenshot and check if it matches reference image
    [Arguments]    ${elem_selector}    ${ref_img_path}
    ${elem_screenshot_img_path}    Take screenshot    elem_screenshot    ${elem_selector}
    Images are similar
    ...    ${elem_screenshot_img_path}
    ...    ${ref_img_path}

Wait until HTML element screenshot matches reference image
    [Arguments]    ${elem_selector}    ${ref_img_path}
    Wait until keyword succeeds
    ...    10s
    ...    0.5s
    ...    Take HTML element screenshot and check if it matches reference image
    ...    ${elem_selector}
    ...    ${ref_img_path}

#################
#    Strings    #
#################

Text should contain
    [Tags]    robot:continue-on-failure
    [Arguments]    ${text}    @{strings}
    FOR    ${string}    IN    @{strings}
        Should contain    ${text}    ${string}
    END

###############
#    Login    #
###############

Go to DUT login webpage
    Log To Console      Logging into DUT
    Go to               ${DUT_LOGIN_WEBPAGE_URL}
    Wait until network is idle    20s

Login to DUT
    [Arguments]    ${language}=portuguese

    Go to DUT login webpage
    login.Open language selection dropdown menu

    IF    "${language}" == "portuguese"
        Select Portuguese language
    ELSE IF    "${language}" == "english"
        Select English language
    ELSE IF    "${language}" == "spanish"
        Select Spanish language
    END

    login.Enter username "${DUT_MGMT_USER}"
    login.Enter password "${DUT_MGMT_PASSWORD}"
    login.Click login button
    Sleep    3s
    ${submenu_is_visible}    Run keyword and return status
    ...    Get element states
    ...    ${MODAL_PASSWORD_ERROR}
    ...    contains
    ...    visible

    IF    ${submenu_is_visible}
        Try first access password
    END
    Wait until network is idle    5s
    Check If Current URL Is First Access
    # Wait until keyword succeeds    3x    1s    Side menu is opened

Try first access password
    login.Enter password "${DUT_MGMT_FIRST_ACCESS_PASSWORD}"
    login.Click login button

Check If Current URL Is First Access
    Sleep    3s
    ${current_url}    Get Url
    Run Keyword If    '${current_url}' == '${FIRST_ACCESS_URL}'    Set Global Variable    ${IS_LOGIN_FIRST_ACCESS}    True
    Log    ${IS_LOGIN_FIRST_ACCESS}

Close atualization modal
    ${element_present}=    Run Keyword And Return Status    Wait For Elements State    ${MODAL_ATUALIZATION_CLOSE}    visible    10s
    Run Keyword If    ${element_present}    Click    ${MODAL_ATUALIZATION_CLOSE}

###############
#   Settings  #
###############

Side menu is opened
    Get element states
    ...    xpath=//*[@id="sidebar-options-menu"]/div[1]/div/div/div/div
    ...    contains
    ...    visible

Wait until message "${text}" is displayed
    Get element by
    ...    selection_strategy=text
    ...    text=${text}
    ...    exact=${true}

Save settings
    # get DUT current language from session storage
    ${dut_language}    Localstorage get item    lang

    IF    "${dut_language}" == "pt-BR"
        ${save_settings_button_text}    Set variable    Salvar
        ${save_settings_success_msg}    Set variable    Configurações salvas com sucesso.
    ELSE IF    "${dut_language}" == "en"
        ${save_settings_button_text}    Set variable    Save
        ${save_settings_success_msg}    Set variable    Settings saved successfully.
    ELSE IF    "${dut_language}" == "es"
        ${save_settings_button_text}    Set variable    Guardar
        ${save_settings_success_msg}    Set variable    Configuraciones guardadas exitosamente.
    ELSE
        Fail
        ...    message=It was not possible to save settings. DUT language could not be determined from local storage key 'lang'.
    END

    ${save_settings_button}    Get element by    text    ${save_settings_button_text}    exact=${true}

    ${el_states}    Get element states    ${save_settings_button}
    IF    "disabled" not in ${el_states}
        Log    Save settings button is enabled (settings are going to be discarded).
        Click    ${save_settings_button}
        Wait until message "${save_settings_success_msg}" is displayed
    ELSE
        Log    Save settings button is disabled (no settings to discard).
    END
	
Confirm saved settings
    Click    ${HEADER_SETTINGS_CONFIRM_SETTINGS_BUTTON} 

Discard saved settings
    Click    ${HEADER_SETTINGS_ICON}
    Wait for elements state    ${HEADER_SETTINGS_DROPDOWN}    visible
    Click    ${HEADER_SETTINGS_DISCARD_SETTINGS_BUTTON}
    Wait for elements state    ${HEADER_SETTINGS_DISCARD_SETTINGS_MODAL_CONFIRM_BUTTON}    visible
    Click    ${HEADER_SETTINGS_DISCARD_SETTINGS_MODAL_CONFIRM_BUTTON}
    Sleep    1s
    Wait until network is idle    30s

Apply saved settings
    Click    ${HEADER_SETTINGS_ICON}
    Wait for elements state    ${HEADER_SETTINGS_DROPDOWN}    visible
    Click    ${HEADER_SETTINGS_APPLY_SETTINGS_BUTTON}
    Wait for elements state    ${HEADER_SETTINGS_APPLY_SETTINGS_MODAL_CONFIRM_BUTTON}    visible
    Click    ${HEADER_SETTINGS_APPLY_SETTINGS_MODAL_CONFIRM_BUTTON}
    Sleep    2s
    Wait until network is idle    30s
    Wait for elements state    ${APLLYING_CONFIGURATION_ALERT}  not visible
    Wait until DUT system is ready

Active SSH connection
    Click    ${SIDE_MENU_SYSTEM}
    Click    ${SIDE_SUBMENU_MANAGEMENT}
    Click    ${SYSTEM_TAB_SSH}
    Click    ${ENABLE_SSH_CHECKBOX}
    ${ENABLE_SSH_CHECKBOX}    Checkbox is checked    

Regressive counter
    [Arguments]    ${inicio}
    FOR    ${i}    IN RANGE    ${inicio}    0    -1
        Log To Console    ${i}
        Sleep    1s
    END
