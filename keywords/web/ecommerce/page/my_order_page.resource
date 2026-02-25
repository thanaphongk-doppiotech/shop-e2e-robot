*** Keywords ***
Verify total price of order number is match
    [Arguments]     ${order_id}     ${expect_total_price}
    # div:has( > div >  div:has-text("#505")) > div > div:has-text("783.00")
    ${expect_total_price}    common.Format number to currency    number=${expect_total_price}
    ${expect_total_price}    BuiltIn.Convert to string    item=${expect_total_price}
    ${locator}      String.Replace string    string=${my_order_locator.lbl_total_price_of_order}    search_for=@#order@#    replace_with=${order_id}
    ${locator}      String.Replace string    string=${locator}      search_for=@#price@#    replace_with=${expect_total_price}
    Browser.Wait for elements state                 selector=${locator}    state=visible
    common.Highlight elements    locator=${locator}
