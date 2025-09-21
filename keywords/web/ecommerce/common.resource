*** Keywords ***

Open website
    [Documentation]    Open base URL and ensure home is visible
    Browser.New Browser     headless=${HEADLESS}    slowMo=${DELAY}
    Browser.New Context     locale=${LOCALE}
    Browser.New Page        ${BASE_URL}

Test Teardown
    Browser.Close browser

Wait element visible then input
    [Arguments]     ${locator}  ${text}     ${timeout}=${LONG_TIMEOUT}
    # wait element
    Browser.Wait For Elements State   ${locator}  timeout=${timeout}
    # input
    Browser.Fill Text      ${locator}  ${text}

Wait element visible then click
    [Arguments]     ${locator}      ${timeout}=${LONG_TIMEOUT}
    # wait element
    Browser.Wait For Elements State   ${locator}  timeout=${timeout}
    # click
    Browser.Click      ${locator}

Wait element visible then get text
    [Arguments]     ${locator}      ${timeout}=${LONG_TIMEOUT}
    Browser.Wait For Elements State   ${locator}  timeout=${timeout}
    ${payment_result}    Browser.Get Text   ${locator}
    RETURN      ${payment_result}

Wait page contain element then scroll to
    [Arguments]     ${locator}      ${timeout}=${LONG_TIMEOUT}
    Browser.Wait For Elements State   ${locator}    state=attached   timeout=${timeout}
    Browser.Scroll To Element        ${locator}

Wait element visible then select option by value
    [Arguments]     ${locator}  ${value}      ${timeout}=${LONG_TIMEOUT}
    Browser.Wait For Elements State   ${locator}  timeout=${timeout}
    Browser.Select Options By   ${locator}  value   ${value}

Short sleep
    BuiltIn.Sleep   3s