*** Keywords ***

Open website
    [Documentation]    Open base URL and ensure home is visible
    Browser.New browser     headless=${HEADLESS}    slowMo=${DELAY}
    Browser.New context     locale=${LOCALE}
    Browser.New page        ${LOCAL_URL}

Test teardown
    Browser.Close browser

Get generated email
    ${time}                 BuiltIn.Get time    format=epoch
    ${generated_email}      BuiltIn.Set variable    thanaphong.k+${time}@doppiotech.com
    RETURN      ${generated_email}

Get random mobile number
    ${prefix_list}      BuiltIn.Create list     06      08      09
    ${prefix}=          BuiltIn.Evaluate        random.choice(${prefix_list})    random
    ${number}           String.Generate random string    length=8    chars=[NUMBERS]
    ${random_mobile_number}    BuiltIn.Set variable    ${prefix}${number}
    RETURN      ${random_mobile_number}

Wait element visible then input
    [Arguments]     ${locator}      ${text}     ${timeout}=${LONG_TIMEOUT}
    # wait element
    Browser.Wait for elements state    ${locator}    timeout=${timeout}
    # input
    Browser.Fill text       ${locator}      ${text}

Wait element visible then click
    [Arguments]     ${locator}      ${timeout}=${LONG_TIMEOUT}
    # wait element
    Browser.Wait for elements state    ${locator}    timeout=${timeout}
    # click
    Browser.Click       ${locator}

Wait element visible then get text
    [Arguments]     ${locator}              ${timeout}=${LONG_TIMEOUT}
    Browser.Wait for elements state    ${locator}    timeout=${timeout}
    ${payment_result}       Browser.Get text    ${locator}
    RETURN          ${payment_result}

Wait page contain element then scroll to
    [Arguments]     ${locator}      ${timeout}=${LONG_TIMEOUT}
    Browser.Wait for elements state    ${locator}    state=attached         timeout=${timeout}
    Browser.Scroll to element    ${locator}

Wait element visible then select option by value
    [Arguments]     ${locator}      ${value}    ${timeout}=${LONG_TIMEOUT}
    Browser.Wait for elements state    ${locator}    timeout=${timeout}
    Browser.Select options by    ${locator}         value                   ${value}

Short sleep
    BuiltIn.Sleep       3s
