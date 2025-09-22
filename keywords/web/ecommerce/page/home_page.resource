*** Keywords ***

Verify suggested products are 8
    [Documentation]    Count product cards and assert = 8; iterate to verify visibility
    Browser.Wait For Elements State    ${home.suggested_grid}    visible    timeout=${LONG_TIMEOUT}
    
    ${cards}=    Browser.Get Elements    ${home.suggested_cards}
    ${count}=    BuiltIn.Get Length      ${cards}

    BuiltIn.Log To Console  \nSuggest product length = ${count}
    
    BuiltIn.Should Be Equal As Integers    ${count}    8
    
    FOR    ${card}    IN    @{cards}
        # Expect    To Be Visible    ${card}
        common.Wait page contain element then scroll to  ${card}
        Browser.Get Element States  ${card}     contains  visible
    END

Click on suggest product by random index
    
    ${index}=   BuiltIn.Evaluate    random.randint(0, 7)    random
    ${index}=   BuiltIn.Convert To String   ${index}
    BuiltIn.Log To Console    \nGenerated number: ${index}

    ${home.suggested_cards_index}=  String.Replace String  ${home.suggested_cards_index}  ${REPLACE_TEXT}  ${index}
    common.Wait page contain element then scroll to  ${home.suggested_cards_index}
    Browser.Click   ${home.suggested_cards_index}

Try to add random product until success
    [Arguments]     ${qty}
    ${result} = 	Wait Until Keyword Succeeds     3x  1000ms  Add random one suggest product from home page   ${qty}
    BuiltIn.Log To Console  ${result}

Add random one suggest product from home page
    [Arguments]     ${qty}
    header_page.Go to home page
    home_page.Click on suggest product by random index
    product_detail_page.Add product given quantity  ${qty}