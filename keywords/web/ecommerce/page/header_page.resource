*** Keywords ***

Go to home page
    common.Wait element visible then click  ${header_locator.a_doppee_logo}
    Browser.Wait For Load State

Go to signin page
    common.Wait element visible then click  ${header_locator.btn_my_account}
    common.Wait element visible then click  ${header_locator.a_signin}

Partial search and select suggest word from autocomplete
    [Documentation]    Type 'mug' and click 'Ceramic Mug' in autocomplete
    [Arguments]     ${partial_word}     ${suggest_word}
    common.Wait element visible then input  ${header_locator.input_search}    ${partial_word}
    Browser.Wait For Elements State    ${header_locator.autocomplete_panel}    visible    ${LONG_TIMEOUT}

    ${ac_value_locator}=    String.Replace String   ${header_locator.autocomplete_value}  ${REPLACE_TEXT}  ${suggest_word}
    common.Wait element visible then click  ${ac_value_locator}

Search keyword ignoring autocomplete
    [Arguments]    ${query}
    [Documentation]    Type query and press Enter to search (ignore autocomplete)
    common.Wait element visible then input  ${header_locator.input_search}    ${query}
    common.Wait element visible then click  ${header_locator.btn_search}

Change language to thai
    [Documentation]    Switch UI language to Thai
    common.Wait element visible then click  ${header_locator.ddl_language}
    common.Wait element visible then click  ${header_locator.opt_lang_thai}

    BuiltIn.Log To Console  Current locale is ${LOCALE}
    BuiltIn.Set Test Variable   ${LOCALE}   th
    BuiltIn.Log To Console  Locale changed to ${LOCALE}

Go to cart page
    # common.Wait element visible then click  ${header_locator.btn_cart}
    header_page.Wait for notification disappear
    Browser.Click   ${header_locator.btn_cart}

Wait for notification disappear

    ${passed} = 	Run Keyword And Return Status 	Browser.Wait For Elements State     ${header_locator.notification}  visible     timeout=${SHORT_TIMEOUT}
    Run Keyword If 	${passed} 	Browser.Wait For Elements State     ${header_locator.notification}  detached     timeout=${LONG_TIMEOUT}
