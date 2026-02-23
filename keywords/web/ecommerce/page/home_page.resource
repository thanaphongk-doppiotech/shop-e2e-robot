*** Keywords ***
Verify suggested products are match with expect
    [Documentation]    Count product cards and assert = 8; iterate to verify visibility
    [Arguments]     ${expect_amount}
    ${cards}=           Browser.Get elements    ${home_locator.dti_suggest_item}
    ${card_count}=      BuiltIn.Get length      ${cards}
    BuiltIn.Should be equal as integers    ${card_count}    ${expect_amount}

# Fix me
Click on suggest product by random index
    ${index}=           BuiltIn.Evaluate    random.randint(0, 7)    random
    ${index}=           BuiltIn.Convert to string    ${index}
    BuiltIn.Log to console    \nGenerated number: ${index}

    ${home_locator.suggested_cards_index}=                          String.Replace string               ${home_locator.suggested_cards_index}           ${REPLACE_TEXT}    ${index}
    common.Wait page contain element then scroll to    ${home_locator.suggested_cards_index}
    Browser.Click       ${home_locator.suggested_cards_index}

Try to add random product until success
    [Arguments]     ${qty}
    ${result} =     Wait until keyword succeeds    3x    1000ms     Add random one suggest product from home page    ${qty}
    BuiltIn.Log to console    ${result}

Add random one suggest product from home page
    [Arguments]     ${qty}
    header_page.Click doppee logo to go homepage
    home_page.Click on suggest product by random index
    product_detail_page.Add product given quantity    ${qty}
