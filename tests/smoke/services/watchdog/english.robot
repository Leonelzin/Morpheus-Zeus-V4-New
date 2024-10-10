*** Settings ***
Library             Browser
Resource            ../../../../resources/common/common_resources.resource
Resource            ../../../../resources/fiber/fiber.resource
Resource            ../../../../resources/smoke/pages/services/watchdog.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=english
...                     AND    Access watchdog service settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=english
...                     AND    Access watchdog service settings page

Force Tags          lang-en    watchdog


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Watchdog"
    Page inner subtitle should be "Automatic equipment reboot in case of communication interruption with other devices"

    Toggle switch text should be "Enable Watchdog"
    Toggle switch should be off

    Address 1 input title should be "Address 1"
    Address 1 input should be disabled
    Address 1 should be "192.168.1.1"

    Address 2 input title should be "Address 2"
    Address 2 input should be disabled
    Address 2 should be ""

    Check interval input title should be "Check time (seconds)"
    Check interval input should be disabled
    Check interval should be "30"

    Save settings button text should be "SAVE"

Validate form interaction after enabling watchdog service
    [Tags]    robot:continue-on-failure    smoke
    Enable watchdog service
    Address 1 input should be enabled
    Address 1 should be "192.168.1.1"

    Address 2 input should be enabled
    Address 2 should be ""
    Address 2 placeholder should be "Domain or IP address"

    Check interval input should be enabled
    Check interval should be "30"
    Check interval placeholder should be "20 to 99999"
