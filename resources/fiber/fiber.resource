*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     Telnet
Resource    ../../resources/common/common_resources.resource


*** Variables ***
${HTTP_REQUEST_TIMEOUT_SECONDS}     10


*** Keywords ***
Get API authorization token
    ${payload}    Create dictionary
    ...    login=${DUT_MGMT_USER}
    ...    password=${DUT_MGMT_PASSWORD}

    ${response}    POST
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/sessions
    ...    json=${payload}
    ...    expected_status=any
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    IF    ${response.status_code} != 201
        Set to dictionary
        ...    ${payload}
        ...    password=${DUT_MGMT_FIRST_ACCESS_PASSWORD}

        ${response}    POST
        ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/sessions
        ...    json=${payload}
        ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}
    END

    RETURN    ${response.json()}[token]

DUT is accepting HTTP requests
    [Arguments]    ${fail_if_false}=${false}

    ${is_accepting}    Run keyword and return status
    ...    Open connection    ${DUT_MGMT_IPV4_ADDRESS}    port=${DUT_MGMT_HTTP_PORT}
    IF    ${is_accepting}    RETURN    ${true}
    IF    ${fail_if_false} and not ${is_accepting}
        Fail    DUT is not accepting HTTP requests.
    END
    RETURN    ${false}
    [Teardown]    Close all connections

Wait until DUT stops accepting HTTP requests
    [Arguments]    ${timeout}=1min    ${retry_interval}=5s

    Wait until keyword succeeds    ${timeout}    ${retry_interval}
    ...    Run keyword and expect error
    ...    DUT is not accepting HTTP requests.
    ...    DUT is accepting HTTP requests    fail_if_false=${true}

Reset DUT settings to factory default
    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${payload}    Create dictionary    type=factory_default
    ${response}    POST
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/actions
    ...    headers=${headers}
    ...    json=${payload}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}
    Wait until DUT stops accepting HTTP requests

DUT system is ready
    [Arguments]    ${fail_if_false}=${false}

    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${response}    GET
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/status
    ...    headers=${headers}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    ${response}    Set variable    ${response.json()}

    IF    ${response}[firewall] and ${response}[wireless] and ${response}[network] and ${response}[ready]
        RETURN    ${true}
    ELSE IF    ${fail_if_false}
        Fail    DUT system is not ready.
    END

    RETURN    ${false}
    [Teardown]    DELETE    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/sessions/${token}    headers=${headers}

Wait until DUT system is ready
    Wait until keyword succeeds    5min    10s    DUT system is ready    fail_if_false=${true}

Reset DUT settings to factory default if first access password has been changed
    ${password_changed}    DUT first access password has been changed

    IF    ${password_changed}
        Log
        ...    First access password has been changed, restoring DUT settings to factory default. Please, wait...
        ...    console=${true}
        Reset DUT settings to factory default
        Wait until DUT system is ready
    END

DUT first access password has been changed
    [Arguments]    ${fail_if_false}=${false}

    ${payload}    Create dictionary
    ...    login=${DUT_MGMT_USER}
    ...    password=${DUT_MGMT_FIRST_ACCESS_PASSWORD}

    ${response}    POST
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/sessions
    ...    json=${payload}
    ...    expected_status=any
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    IF    ${response.status_code} != 201    RETURN    ${true}
    IF    ${fail_if_false}
        Fail    DUT first access password has been changed.
    END
    RETURN    ${False}

Get DUT default management user ID
    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${response}    GET
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/users
    ...    headers=${headers}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}
    FOR    ${user}    IN    @{response.json()}
        IF    "${user}[login]" == "${DUT_MGMT_USER}"    RETURN    ${user}[id]
    END
    Fail    DUT default management user ID not found.

Change DUT first access password
    [Arguments]    ${new_password}=${DUT_MGMT_PASSWORD}

    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${user_id}    Get DUT default management user ID

    ${payload}    Create dictionary
    ...    login=${DUT_MGMT_USER}
    ...    current_password=${DUT_MGMT_FIRST_ACCESS_PASSWORD}
    ...    new_password=${DUT_MGMT_PASSWORD}
    ...    new_password_verify=${DUT_MGMT_PASSWORD}

    ${response}    PUT
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/users/${user_id}
    ...    headers=${headers}
    ...    json=${payload}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

Change DUT first access password if it has not been changed
    ${password_changed}    DUT first access password has been changed
    IF    not ${password_changed}    Change DUT first access password

Get DUT model name
    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${response}    GET
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/brief
    ...    headers=${headers}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    RETURN    ${response.json()}[model]

Get DUT firmware version
    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${response}    GET
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/system/brief
    ...    headers=${headers}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    ${response_json}    Set Variable    ${response.json()}

    Log To Console    Full Response: ${response_json}

    ${fw_version}    Get From Dictionary    ${response_json}    fw_version

    Log To Console    Firmware Version: ${fw_version}
    [Return]    ${fw_version}

Get CRONOS latest firmware version
    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${response}    GET
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/services/firmware/versions/latest?pt-br
    ...    headers=${headers}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    ${response_json}    Set Variable    ${response.json()}

    Log To Console    Full Response: ${response_json}

    ${version}    Get From Dictionary    ${response_json}    version

    Log To Console    Changelog: ${version}
    [Return]    ${version}

Get DUT hostname
    ${token}    Get API authorization token
    ${headers}    Create dictionary    Authorization=Token ${token}
    ${response}    GET
    ...    ${DUT_MGMT_URL}/cgi-bin/api/v4/network
    ...    headers=${headers}
    ...    timeout=${HTTP_REQUEST_TIMEOUT_SECONDS}

    RETURN    ${response.json()}[hostname]
