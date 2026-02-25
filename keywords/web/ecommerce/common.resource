*** Keywords ***
Open website
    [Documentation]    Open base URL and ensure home is visible
    Browser.New browser     headless=${HEADLESS}    slowMo=${DEFAULT_KEYWORD_DELAY}
    Browser.New context     locale=${LOCALE_EN}
    Browser.New page        url=${LOCAL_URL}    # ${BASE_URL}   ${LOCAL_URL}
    BuiltIn.Set test variable    ${LOCALE}          ${LOCALE_EN}

Test teardown
    Browser.Close browser

Get generated email
    ${time}                 BuiltIn.Get time        format=epoch
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
    ${cleaned_text}     String.Remove string    ${currency_text}    THB     ,       ${SPACE}    \xa0
    ${number_value}     BuiltIn.Convert to number    item=${cleaned_text}
    RETURN          ${number_value}

Format number to currency
    [Arguments]     ${number}               ${decimal_place}=2
    ${formatted_number}=    BuiltIn.Evaluate    f"{float($number):,.{int($decimal_place)}f}"
    RETURN          ${formatted_number}

Format number to baht currency without comma
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

Highlight elements
    [Arguments]     ${locator}      ${duration}=${DEFAULT_HIGHLIGHT_DURATION}
    Browser.Highlight elements    selector=${locator}    duration=${duration}
    BuiltIn.Sleep       time_=${duration}
