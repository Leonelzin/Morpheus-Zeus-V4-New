*** Settings ***
Library     Browser
Library     ../../../../.venv/lib/python3.11/site-packages/RPA/Desktop/__init__.py
Resource    ../../../../resources/common/common_resources.resource


*** Variables ***
${ITB_OFFICIAL_FIRST_ACCESS_BANNER_IMG_PATH}                    ${CURDIR}/images/banner.png
${ITB_OFFICIAL_FIRST_ACCESS_LANGUAGE_BRAZIL_FLAG_IMG_PATH}      ${CURDIR}/images/language_brazil_flag.png
${ITB_OFFICIAL_FIRST_ACCESS_LANGUAGE_USA_FLAG_IMG_PATH}         ${CURDIR}/images/language_usa_flag.png
${ITB_OFFICIAL_FIRST_ACCESS_LANGUAGE_SPANISH_FLAG_IMG_PATH}     ${CURDIR}/images/language_spanish_flag.png

${FIRST_ACCESS_PAGE_BANNER}                                     id=inmaster-logo

${FIRST_ACCESS_PAGE_FORM_TITLE}                                 xpath=//*[@id="root"]/div[2]/div[2]/div/span
${FIRST_ACCESS_PAGE_FORM_SUBTITLE}                              xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/span

${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_TITLE}                      xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div
${FIRST_ACCESS_PAGE_LANGUAGE_SELECT}                            xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div/div/div/input
${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_COUNTRY_FLAG_IMG}           xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div/div/div/span[1]/div/img
${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTIONS_DROPDOWN}           xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div/div/ul
${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTION_EN}                  xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div/div/ul/li[1]/div
${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTION_PT}                  xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div/div/ul/li[2]/div
${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTION_ES}                  xpath=//*[@id="root"]/div[2]/div[2]/div/div[1]/div/div/div/ul/li[3]/div

${FIRST_ACCESS_PAGE_USERNAME_TITLE}                             xpath=//*[@id="first-login"]/div[1]/div
${FIRST_ACCESS_PAGE_USERNAME_INPUT}                             xpath=//*[@id="input-7"]

${FIRST_ACCESS_PAGE_PASSWORD_TITLE}                             xpath=//*[@id="first-login"]/div[2]/div
${FIRST_ACCESS_PAGE_PASSWORD_INPUT}                             xpath=//*[@id="password"]
${FIRST_ACCESS_PAGE_PASSWORD_INPUT_REVEAL_ICON}                 xpath=//*[@id="first-login"]/div[2]/div/div[2]/span[2]
${FIRST_ACCESS_PAGE_PASSWORD_RULES_HELP_TEXT}                   xpath=//*[@id="first-login"]/div[3]

${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_TITLE}                     xpath=//*[@id="first-login"]/div[4]/div
${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}                     xpath=//*[@id="confirm_password"]
${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT_REVEAL_ICON}         xpath=//*[@id="first-login"]/div[4]/div/div[2]/span[2]

${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE}                        xpath=//*[@id="terms"]
${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_CLICKABLE}              xpath=//*[@id="first-login"]/label/span
${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_TEXT}                   xpath=//*[@id="first-login"]/span

${FIRST_ACCESS_PRIVACY_POLICY_HYPERLINK}                        xpath=//*[@id="first-login"]/span/a[1]
${FIRST_ACCESS_PRIVACY_POLICY_MODAL_TITLE}                      xpath=//*[@id="overlay-cntse"]/div/div/div[1]/div
${FIRST_ACCESS_PRIVACY_POLICY_MODAL_TEXT}                       xpath=//*[@id="overlay-cntse"]/div/div/div[2]/div[1]/p

${FIRST_ACCESS_TERMS_OF_USE_HYPERLINK}                          xpath=//*[@id="first-login"]/span/a[2]
${FIRST_ACCESS_TERMS_OF_USE_MODAL_TITLE}                        xpath=//*[@id="overlay-cntse"]/div/div/div[1]/div
${FIRST_ACCESS_TERMS_OF_USE_MODAL_TEXT}                         xpath=//*[@id="overlay-cntse"]/div/div/div[2]/div/p

${FIRST_ACCESS_PAGE_LOGIN_BUTTON}                               xpath=//*[@id="submitBtn"]

${FIRST_ACCESS_PAGE_ITB_COPYRIGHT_FOOTER}                       xpath=//*[@id="root"]/div[2]/div[2]/div/div[2]

${LOGIN_PAGE_USERNAME_INPUT}                                    id=login
${LOGIN_PAGE_PASSWORD_INPUT}                                    id=password
${LOGIN_PAGE_LOGIN_BUTTON}                                      id=submitBtn


*** Keywords ***
Login with first access
    Type Text      ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}            ${DUT_MGMT_PASSWORD}
    Type Text      ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    ${DUT_MGMT_PASSWORD}
    Click          ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_CLICKABLE}
    Click          ${FIRST_ACCESS_PAGE_LOGIN_BUTTON}
    Wait until network is idle    30s
    

Wait until first access webpage is displayed
    Wait for condition    url    contains    /login_first_access
    Wait until network is idle

Advertising banner should be displayed
    Wait until HTML element screenshot matches reference image
    ...    ${FIRST_ACCESS_PAGE_BANNER}
    ...    ${ITB_OFFICIAL_FIRST_ACCESS_BANNER_IMG_PATH}

Open language selection dropdown menu
    ${elem_states}    Get element states    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTIONS_DROPDOWN}
    IF    "hidden" in ${elem_states}
        Click    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT}
    END

Select English language
    Click    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTION_EN}

Select Spanish language
    Click    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_OPTION_ES}

Username input should be "${username}"
    Get text    ${FIRST_ACCESS_PAGE_USERNAME_INPUT}    ==    ${username}

Username input should be disabled
    Get attribute    ${FIRST_ACCESS_PAGE_USERNAME_INPUT}    disabled

Enter password "${password}"
    Type secret    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    $password

Enter password confirmation "${confirmation_password}"
    Type secret    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    $confirmation_password

Password input should be "${password}"
    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    ==    ${password}

Password text should be hidden
    Get attribute    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    type    ==    password

Password text should not be hidden
    Get attribute    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    type    ==    text

Password confirmation input should be "${password}"
    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    ==    ${password}

Password confirmation text should be hidden
    Get attribute    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    type    ==    password

Password confirmation text should not be hidden
    Get attribute    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    type    ==    text

Accept Privacy Policy and Terms of Use
    ${checked}    Get checkbox state    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE}
    IF    ${checked} == ${false}
        Click    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE}    checked

Unaccept privacy policy and terms of use
    ${checked}    Get checkbox state    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE}
    IF    ${checked} == ${true}
        Click    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_CLICKABLE}
    END
    Wait for elements state    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE}    unchecked

Privacy policy and terms of use should not be accepted
    Get checkbox state    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE}    !=    checked

Open privacy policy hyperlink
    Click    ${FIRST_ACCESS_PRIVACY_POLICY_HYPERLINK}
    Wait for elements state    ${FIRST_ACCESS_PRIVACY_POLICY_MODAL_TEXT}    visible
    # Wait for response    **/services/compliance?language=*

Close privacy policy modal
    Click    xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/div/button

Close terms of use modal
    Click    xpath=//*[@id="overlay-cntse"]/div/div/div[3]/div/div/button

Open terms of use hyperlink
    Click    ${FIRST_ACCESS_TERMS_OF_USE_HYPERLINK}
    Wait for elements state    ${FIRST_ACCESS_TERMS_OF_USE_MODAL_TEXT}    visible

Click login button
    Click    ${FIRST_ACCESS_PAGE_LOGIN_BUTTON}

Wait until dashboard webpage is displayed
    Wait for condition    url    contains    /dashboard
    Wait until network is idle
    ${elem_classes}    Get classes    ${SIDEMENU_DASHBOARD}
    FOR    ${class}    IN    @{elem_classes}
        ${matched}    Run keyword and return status
        ...    Should match regexp    ${class}    style_active.*
        IF    ${matched}    RETURN
    END
    Fail    Dashboard sidebar menu was not active (selected).

Privacy policy text should be displayed in Portuguese
    [Tags]    robot:continue-on-failure
    Get text    ${FIRST_ACCESS_PRIVACY_POLICY_MODAL_TITLE}    ==    Política de Privacidade
    ${privacy_policy}    Get text    ${FIRST_ACCESS_PRIVACY_POLICY_MODAL_TEXT}
    Text should contain    ${privacy_policy}
    ...    Versão atualizada em 06.01.2020
    ...    1. Informações Importantes
    ...    2. Introdução
    ...    3. Seus Dados Pessoais e como os Utilizamos
    ...    4. Transferência de Dados para Terceiros
    ...    5. Armazenamento e Deleção de Dados Pessoais
    ...    6. Alterações a Política de Privacidade
    ...    7. Seus Direitos
    ...    8. Cookies, Identificadores, Rastreadores e Informações de Terceiros
    ...    9. Publicidade Comportamental Online
    ...    10. Incidentes
    ...    11. Nossos Dados
    ...    12. Comitê de Privacidade

Terms of use text should be displayed in Portuguese
    [Tags]    robot:continue-on-failure
    Get text    ${FIRST_ACCESS_TERMS_OF_USE_MODAL_TITLE}    ==    Termos de Uso
    ${terms_of_use}    Get text    ${FIRST_ACCESS_TERMS_OF_USE_MODAL_TEXT}
    Text should contain    ${terms_of_use}
    ...    Versão atualizada em 06.01.2020
    ...    é indispensável a aceitação dos termos descritos a seguir.
    ...    1. Aceitação do contrato
    ...    2. Do Cadastro
    ...    3. Licença limitada
    ...    4. Direitos autorais
    ...    5. Alterações, modificações e rescisão
    ...    6. Indenização
    ...    7. Consentimento para coleta e proteção do uso de dados
    ...    8. Marcas Registradas e Direitos de Propriedade Intelectual da INTELBRAS
    ...    9. Isenção de garantias e limitações de responsabilidade
    ...    10. Validade técnica
    ...    11. Rescisão
    ...    12. Foro para dirimir controvérsias

First access login form should be in Portuguese
    [Tags]    robot:continue-on-failure
    Get text    ${FIRST_ACCESS_PAGE_FORM_TITLE}    ==    Primeiro acesso
    Get text
    ...    ${FIRST_ACCESS_PAGE_FORM_SUBTITLE}
    ...    ==
    ...    Por motivos de segurança, altere a senha para acessar o equipamento.
    Get text    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_TITLE}    ==    Idioma
    Get text    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT}    ==    Português

    Wait until HTML element screenshot matches reference image
    ...    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_COUNTRY_FLAG_IMG}
    ...    ${ITB_OFFICIAL_FIRST_ACCESS_LANGUAGE_BRAZIL_FLAG_IMG_PATH}

    Get text    ${FIRST_ACCESS_PAGE_USERNAME_TITLE}    ==    Usuário
    Get text    ${FIRST_ACCESS_PAGE_USERNAME_INPUT}    ==    admin

    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_TITLE}    ==    Senha
    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    ==    ${EMPTY}
    Get attribute    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    placeholder    ==    Digite sua senha

    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_TITLE}    ==    Confirmar senha
    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    ==    ${EMPTY}

    Get attribute
    ...    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}
    ...    placeholder
    ...    ==
    ...    Confirmação de senha

    ${PASSWORD_RULES_HELP_TEXT}    Catenate    SEPARATOR=${\n}
    ...    Senha deve ter de 8 a 63 caracteres;
    ...    Conter pelo menos 1 (um) número;
    ...    Conter pelo menos 1 (uma) letra maiúscula;
    ...    Conter pelo menos 1 (uma) letra minúscula;
    ...    Conter pelo menos 1 (um) caractere especial (Ex: #, *, !, @).

    Get text
    ...    ${FIRST_ACCESS_PAGE_PASSWORD_RULES_HELP_TEXT}
    ...    ==
    ...    ${PASSWORD_RULES_HELP_TEXT}

    Get text
    ...    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_TEXT}
    ...    ==
    ...    Li e concordo com a Política de Privacidade e os Termos de Uso

    Get text    ${FIRST_ACCESS_PAGE_LOGIN_BUTTON}    ==    ENTRAR

    Get text
    ...    ${FIRST_ACCESS_PAGE_ITB_COPYRIGHT_FOOTER}
    ...    ==
    ...    Intelbras © 2023 - Privacidade - Termos

First access login form should be in English
    [Tags]    robot:continue-on-failure
    Get text    ${FIRST_ACCESS_PAGE_FORM_TITLE}    ==    First access
    Get text
    ...    ${FIRST_ACCESS_PAGE_FORM_SUBTITLE}
    ...    ==
    ...    For security reasons, change the password to access the equipment.
    Get text    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_TITLE}    ==    Language
    Get text    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT}    ==    English

    Wait until HTML element screenshot matches reference image
    ...    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_COUNTRY_FLAG_IMG}
    ...    ${ITB_OFFICIAL_FIRST_ACCESS_LANGUAGE_USA_FLAG_IMG_PATH}

    Get text    ${FIRST_ACCESS_PAGE_USERNAME_TITLE}    ==    User
    Get text    ${FIRST_ACCESS_PAGE_USERNAME_INPUT}    ==    admin

    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_TITLE}    ==    Password
    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    ==    ${EMPTY}
    Get attribute
    ...    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}
    ...    placeholder
    ...    ==
    ...    Type your password

    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_TITLE}    ==    Confirm password
    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    ==    ${EMPTY}

    Get attribute
    ...    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}
    ...    placeholder
    ...    ==
    ...    Password confirmation

    ${PASSWORD_RULES_HELP_TEXT}    Catenate    SEPARATOR=${\n}
    ...    Password must be between 8 and 63 characters;
    ...    Contain at least 1 (one) number;
    ...    Contain at least 1 (one) uppercase letter;
    ...    Contain at least 1 (one) lowercase letter;
    ...    Contain at least 1 (one) special character (e.g.: #, *, !, @).

    Get text
    ...    ${FIRST_ACCESS_PAGE_PASSWORD_RULES_HELP_TEXT}
    ...    ==
    ...    ${PASSWORD_RULES_HELP_TEXT}

    Get text
    ...    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_TEXT}
    ...    ==
    ...    I have read and agree with the Privacy Policy and the Terms of Use

    Get text    ${FIRST_ACCESS_PAGE_LOGIN_BUTTON}    ==    LOGIN

    Get text
    ...    ${FIRST_ACCESS_PAGE_ITB_COPYRIGHT_FOOTER}
    ...    ==
    ...    Intelbras © 2023 - Privacy - Terms

First access login form should be in Spanish
    Get text    ${FIRST_ACCESS_PAGE_FORM_TITLE}    ==    Primer acceso
    Get text
    ...    ${FIRST_ACCESS_PAGE_FORM_SUBTITLE}
    ...    ==
    ...    Por razones de seguridad, cambie la contraseña para acceder al equipo.
    Get text    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_TITLE}    ==    Idioma
    Get text    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT}    ==    Español

    Wait until HTML element screenshot matches reference image
    ...    ${FIRST_ACCESS_PAGE_LANGUAGE_SELECT_COUNTRY_FLAG_IMG}
    ...    ${ITB_OFFICIAL_FIRST_ACCESS_LANGUAGE_SPANISH_FLAG_IMG_PATH}

    Get text    ${FIRST_ACCESS_PAGE_USERNAME_TITLE}    ==    Usuario
    Get text    ${FIRST_ACCESS_PAGE_USERNAME_INPUT}    ==    admin

    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_TITLE}    ==    Contraseña
    Get text    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}    ==    ${EMPTY}

    Get attribute
    ...    ${FIRST_ACCESS_PAGE_PASSWORD_INPUT}
    ...    placeholder
    ...    ==
    ...    Escribe tu contraseña

    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_TITLE}    ==    Confirmar contraseña
    Get text    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}    ==    ${EMPTY}

    Get attribute
    ...    ${FIRST_ACCESS_PAGE_CONFIRM_PASSWORD_INPUT}
    ...    placeholder
    ...    ==
    ...    Confirmación de contraseña

    ${PASSWORD_RULES_HELP_TEXT}    Catenate    SEPARATOR=${\n}
    ...    La contraseña debe tener entre 8 y 63 caracteres;
    ...    Contener al menos 1 (un) número;
    ...    Contener por lo menos 1 (una) letra mayúscula;
    ...    Contener al menos 1 (una) letra minúscula;
    ...    Contener al menos 1 (un) carácter especial (Ej: #, *, !, @).

    Get text
    ...    ${FIRST_ACCESS_PAGE_PASSWORD_RULES_HELP_TEXT}
    ...    ==
    ...    ${PASSWORD_RULES_HELP_TEXT}

    Get text
    ...    ${FIRST_ACCESS_PAGE_ACCEPT_TERMS_TOGGLE_TEXT}
    ...    ==
    ...    He leído y estoy de acuerdo con la Política de Privacidad y los Términos de Uso

    Get text    ${FIRST_ACCESS_PAGE_LOGIN_BUTTON}    ==    ACCESO

    Get text
    ...    ${FIRST_ACCESS_PAGE_ITB_COPYRIGHT_FOOTER}
    ...    ==
    ...    Intelbras © 2023 - Privacidad - Términos

Error message "${msg}" is displayed for password input
    Get text    xpath=//*[@id="first-login"]/div[2]/div/div[3]    ==    ${msg}

Error message "${msg}" is displayed for password confirmation input
    Get text    xpath=//*[@id="first-login"]/div[4]/div/div[3]    ==    ${msg}

Error message "${msg}" is displayed for privacy and terms toggle switch
    Get text    xpath=//*[@id="first-login"]/div[5]    ==    ${msg}
