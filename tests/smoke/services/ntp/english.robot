*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/services/ntp.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=english
...                     AND    Access NTP service settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=english
...                     AND    Access NTP service settings page

Force Tags          lang-en    ntp


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Date and time"
    Page inner subtitle should be "The device keeps the correct time through synchronization with NTP servers"

    NTP client toggle switch text should be "Enable NTP client"
    NTP client toggle switch should be on

    Server 1 input title should be "NTP server 1"
    Server 1 input should be enabled
    Server 1 should be "a.ntp.br"

    Server 2 input title should be "NTP server 1"
    Server 2 input should be enabled
    Server 2 should be "b.ntp.br"

    Timezone select option should be "(GMT-03:00) São Paulo"

    Daylight saving time toggle switch text should be "Daylight saving time"
    Daylight saving time toggle switch should be off

    Save settings button text should be "SAVE"

Four timezones are available: Bogotá, Manaus, São Paulo and Fernando de Noronha
    [Tags]    robot:continue-on-failure    smoke
    There should be "4" timezones available
    Timezone "(GMT-05:00) Bogota" should be available
    Timezone "(GMT-04:00) Manaus" should be available
    Timezone "(GMT-03:00) São Paulo" should be available
    Timezone "(GMT-02:00) Fernando de Noronha" should be available

Validate form interaction after disabling NTP client
    [Tags]    robot:continue-on-failure    smoke
    Open timezone selection dropdown menu
    Select timezone "(GMT-04:00) Manaus"

    Enable daylight saving time

    Disable NTP client

    Server 1 input should be disabled
    Server 1 should be "a.ntp.br"

    Server 2 input should be disabled
    Server 2 should be "b.ntp.br"

    Timezone select option should be "(GMT-04:00) Manaus"
    Timezone select should be disabled

    Daylight saving time toggle switch should be on
    Daylight saving time toggle switch should be disabled
