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
    ...                 string=${home_locator.dti_suggest_product_by_index}
    ...                 search_for=@#index@#
    ...                 replace_with=${index}
    Browser.Hover       selector=${locator}
    Browser.Click       selector=${locator}
