*** Keywords ***

Open website
    [Documentation]    Open base URL and ensure home is visible
    Browser.New browser     headless=${HEADLESS}    slowMo=${DELAY}
    Browser.New context     locale=${LOCALE_EN}
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

Format baht currency to number
    [Documentation]     Formats a currency string into an integer value
    ...                 This keyword removes currency symbols, commas, space from product price
    ...                 Arguments:
    ...                     - ${currency_text}  (string):   The currency text to be formatted (e.g., ฿1,890.00).
    ...                 Returns:
    ...                     - ${number_value}  (number):   The number that was formatted (e.g., 1890.00)
    [Arguments]     ${currency_text}
    ${cleaned_text}     String.Remove string    ${currency_text}    ฿       ,       ${SPACE}
    ${number_value}     BuiltIn.Convert to number    item=${cleaned_text}
    RETURN          ${number_value}

Format number to baht currecy without comma
    [Documentation]     Formats a numeric value into a currency string format.
    ...                 This keyword rounds the input number to 2 decimal places and prepends
    ...                 the currency symbol (฿).
    ...                 Arguments:
    ...                     - ${number}             (string): The number to be formatted (e.g., 1890.5421).
    ...                     - ${decimal_place}      (number): The amount of decimal place to be formatted (e.g., 4 default is 2).
    ...                 Returns:
    ...                     - ${formatted_number}   (string): The formatted currency string (e.g., ฿1890.54).
    [Arguments]     ${number}               ${decimal_place}=2
    ${formatted_number}=    BuiltIn.Evaluate    "฿{:.${decimal_place}f}".format(float('${number}'))
    RETURN          ${formatted_number}

# not use
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
