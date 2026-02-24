*** Keywords ***
Verify total price of order number is match
    [Arguments]     ${order_id}     ${expect_total_price}
    # div:has( > div >  div:has-text("#505")) > div > div:has-text("783.00")
    ${expect_total_price}    BuiltIn.Convert to string    item=${expect_total_price}
    ${locator}      String.Replace string    string=${my_order_locator.lbl_total_price_of_order}    search_for=@#order@#    replace_with=${order_id}
    ${locator}      String.Replace string    string=${locator}      search_for=@#price@#    replace_with=${expect_total_price}
    Browser.Wait for elements state                 selector=${locator}    state=visible
    Browser.Highlight elements    selector=${locator}

# Fix me
Verify total price by order number
    [Arguments]     ${order_no}     ${expect_total_price}
    ${total_price_locator}=    String.Replace string                ${my_order_locator.lbl_total_price_of_order}    ${REPLACE_TEXT}         ${order_no}
    ${total_price}=     common.Wait element visible then get text    ${total_price_locator}
    ${total_price}=     String.Replace string    ${total_price}     THB\xa0                 ${EMPTY}
    ${total_price}=     String.Replace string    ${total_price}     ,                       ${EMPTY}
    ${abs_price} =      BuiltIn.Evaluate    abs(${total_price})

    BuiltIn.Log to console    \nExpect price = ${expect_total_price}, actual price = ${total_price}

    BuiltIn.Should be equal    ${expect_total_price}    ${abs_price}
