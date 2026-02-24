*** Keywords ***
Verify suggested products are match with expect
    [Documentation]    Count product cards and assert = 8; iterate to verify visibility
    [Arguments]     ${expect_amount}
    ${cards}=           Browser.Get elements    ${home_locator.dti_suggest_item}
    ${card_count}=      BuiltIn.Get length      ${cards}
    BuiltIn.Should be equal as integers    ${card_count}    ${expect_amount}

Click on suggest product by random
    ${index}            String.Generate random string    length=1       chars=01234567
    ${locator}          String.Replace string
    ...                 string=${home_locator.suggested_cards_index}
    ...                 search_for=${REPLACE_TEXT}
    ...                 replace_with=${index}
    Browser.Hover       selector=${locator}
    Browser.Click       selector=${locator}

# Fix me
Try to add random product until success
    [Arguments]     ${qty}
    ${result} =     Wait until keyword succeeds    3x    1000ms     Add random one suggest product from home page    ${qty}
    BuiltIn.Log to console    ${result}

Add random one suggest product from home page
    [Arguments]     ${qty}
    header_page.Click doppee logo to go homepage
    home_page.Click on suggest product by random
    product_detail_page.Add product given quantity    ${qty}
