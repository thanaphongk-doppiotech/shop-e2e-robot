*** Keywords ***

Go to home page
    common.Wait element visible then click  ${header.a_doppee_logo}

Go to signin page
    common.Wait element visible then click  ${header.btn_my_account}
    common.Wait element visible then click  ${header.a_signin}

Partial search and select suggest word from autocomplete
    [Documentation]    Type 'mug' and click 'Ceramic Mug' in autocomplete
    [Arguments]     ${partial_word}     ${suggest_word}
    common.Wait element visible then input  ${header.input_search}    ${partial_word}
    Browser.Wait For Elements State    ${header.autocomplete_panel}    visible    ${LONG_TIMEOUT}

    ${ac_value_locator}=    String.Replace String   ${header.autocomplete_value}  ${REPLACE_TEXT}  ${suggest_word} 
    common.Wait element visible then click  ${ac_value_locator}

Search keyword ignoring autocomplete
    [Arguments]    ${query}
    [Documentation]    Type query and press Enter to search (ignore autocomplete)
    common.Wait element visible then input  ${header.input_search}    ${query}
    common.Wait element visible then click  ${header.btn_search}
    
Change language to thai
    [Documentation]    Switch UI language to Thai
    common.Wait element visible then click  ${header.ddl_language}    
    common.Wait element visible then click  ${header.opt_lang_thai}

    BuiltIn.Log To Console  Current locale is ${LOCALE}
    BuiltIn.Set Test Variable   ${LOCALE}   th
    BuiltIn.Log To Console  Locale changed to ${LOCALE}

Go to cart page
    # common.Wait element visible then click  ${header.btn_cart}
    header_page.Wait for notification disappear
    Browser.Click   ${header.btn_cart}

Wait for notification disappear
    Browser.Wait For Elements State     ${header.notification}  visible     timeout=${LONG_TIMEOUT}
    Browser.Wait For Elements State     ${header.notification}  detached     timeout=${LONG_TIMEOUT}