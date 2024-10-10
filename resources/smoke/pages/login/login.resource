*** Settings ***
Library     Browser
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${LOGIN_PAGE_TITLE}                                     Intelbras

${LOGIN_PAGE_BANNER}                                    id=inmaster-logo
${ITB_OFFICIAL_LOGIN_BANNER_IMG_PATH}                   ${CURDIR}/images/banner.png
${ITB_OFFICIAL_LOGIN_LANGUAGE_BRAZIL_FLAG_IMG_PATH}     ${CURDIR}/images/language_brazil_flag.png
${ITB_OFFICIAL_LOGIN_LANGUAGE_USA_FLAG_IMG_PATH}        ${CURDIR}/images/language_usa_flag.png
${ITB_OFFICIAL_LOGIN_LANGUAGE_SPANISH_FLAG_IMG_PATH}    ${CURDIR}/images/language_spanish_flag.png

${LOGIN_PAGE_FORM_TITLE}                                xpath=//*[@id="root"]/div[2]/div[2]/div/span
${LOGIN_PAGE_USERNAME_INPUT_TITLE}                      xpath=//*[@id="login-form"]/div[1]/div
${LOGIN_PAGE_USERNAME_INPUT}                            id=login
${LOGIN_PAGE_PASSWORD_INPUT_TITLE}                      xpath=//*[@id="login-form"]/div[2]/div
${LOGIN_PAGE_PASSWORD_INPUT}                            id=password
${LOGIN_PAGE_PASSWORD_INPUT_REVEAL_ICON}                xpath=//*[@id="login-form"]/div[2]/div/div[2]/span[2]
${LOGIN_PAGE_LOGIN_BUTTON}                              id=submitBtn

${LOGIN_PAGE_LANGUAGE_SELECT_TITLE}                     xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div
${LOGIN_PAGE_LANGUAGE_SELECT}                           xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div/div/div/input
${LOGIN_PAGE_LANGUAGE_SELECT_COUNTRY_FLAG_IMG}          xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div/div/div/span[1]/div/img
${LOGIN_PAGE_LANGUAGE_SELECT_OPTIONS_DROPDOWN}          xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div/div/ul
${LOGIN_PAGE_LANGUAGE_SELECT_OPTION_EN}                 xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div/div/ul/li[1]/div
${LOGIN_PAGE_LANGUAGE_SELECT_OPTION_PT}                 xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div/div/ul/li[2]/div
${LOGIN_PAGE_LANGUAGE_SELECT_OPTION_ES}                 xpath=//*[@id="root"]/div[2]/div[2]/div/div/div/div/div/ul/li[3]/div

${LOGIN_PAGE_ERROR_MSG_POPUP}                           xpath=//*[@id="root"]/div[1]/div/div/div[1]/div
${LOGIN_PAGE_ERROR_MSG_POPUP_CLOSE_BUTTON}              xpath=//*[@id="root"]/div[1]/div/div/div[2]
${LOGIN_PAGE_ERROR_MSG_POPUP_INCORRECT_CREDENTIALS}     O usuário e/ou senha está incorreto.


*** Keywords ***
Advertising banner should be displayed
    Wait until HTML element screenshot matches reference image
    ...    ${LOGIN_PAGE_BANNER}
    ...    ${ITB_OFFICIAL_LOGIN_BANNER_IMG_PATH}

Login form should be in Portuguese
    [Tags]    robot:continue-on-failure
    Get text    ${LOGIN_PAGE_FORM_TITLE}    ==    Entrar
    Get text    ${LOGIN_PAGE_LANGUAGE_SELECT_TITLE}    ==    Idioma
    Get text    ${LOGIN_PAGE_LANGUAGE_SELECT}    ==    Português

    Wait until HTML element screenshot matches reference image
    ...    ${LOGIN_PAGE_LANGUAGE_SELECT_COUNTRY_FLAG_IMG}
    ...    ${ITB_OFFICIAL_LOGIN_LANGUAGE_BRAZIL_FLAG_IMG_PATH}

    Get text    ${LOGIN_PAGE_USERNAME_INPUT_TITLE}    ==    Usuário
    Get attribute
    ...    ${LOGIN_PAGE_USERNAME_INPUT}
    ...    placeholder    ==    Nome do usuário

    Get text    ${LOGIN_PAGE_PASSWORD_INPUT_TITLE}    ==    Senha
    Get attribute
    ...    ${LOGIN_PAGE_PASSWORD_INPUT}
    ...    placeholder    ==    Digite sua senha

Username input should be "${username}"
    Get text    ${LOGIN_PAGE_USERNAME_INPUT}    ==    ${username}

Password input should be "${password}"
    Get text    ${LOGIN_PAGE_PASSWORD_INPUT}    ==    ${password}

Password text should be hidden
    Get attribute    ${LOGIN_PAGE_PASSWORD_INPUT}    type    ==    password

Password text should not be hidden
    Get attribute    ${LOGIN_PAGE_PASSWORD_INPUT}    type    ==    text

Enter username "${username}"
    Type text    ${LOGIN_PAGE_USERNAME_INPUT}    ${username}

Enter password "${password}"
    Type secret    ${LOGIN_PAGE_PASSWORD_INPUT}    $password

Click login button
    Click    ${LOGIN_PAGE_LOGIN_BUTTON}

First access webpage should be displayed
    Wait until network is idle
    Get url    *=    /login_first_access

Dashboard webpage should be displayed
    Wait until network is idle
    Get url    *=    /dashboard

Open language selection dropdown menu
    ${elem_states}    Get element states    ${LOGIN_PAGE_LANGUAGE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}    Click    ${LOGIN_PAGE_LANGUAGE_SELECT}

Select English language
    Click    ${LOGIN_PAGE_LANGUAGE_SELECT_OPTION_EN}

Select Portuguese language
    Click    ${LOGIN_PAGE_LANGUAGE_SELECT_OPTION_PT}

Select Spanish language
    Click    ${LOGIN_PAGE_LANGUAGE_SELECT_OPTION_ES}
