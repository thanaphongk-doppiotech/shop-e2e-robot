*** Keywords ***
Wait for notification disappear
    ${passed} =         Run keyword and return status                   Browser.Wait for elements state                 ${header_locator.notification}    visible       timeout=${SHORT_TIMEOUT}
    Run keyword if      ${passed}       Browser.Wait for elements state                 ${header_locator.notification}    detached      timeout=${LONG_TIMEOUT}

Verify notification message is display
    [Arguments]     ${message}
    ${locator}      String.Replace string    string=${notification_locator.txt_notification_message}                search_for=@#string@#    replace_with=${message}
    Browser.Wait for elements state                 selector=${locator}    state=visible

Click close notification button
    Browser.Click       selector=${notification_locator.btn_close_notification}
