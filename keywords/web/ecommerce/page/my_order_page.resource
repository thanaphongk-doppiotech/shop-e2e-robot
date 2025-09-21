*** Keywords ***

Verify total price by order number
    [Arguments]     ${order_no}  ${expect_total_price}
    ${total_price_locator}=     String.Replace String   ${my_order.lbl_total_price}  ${REPLACE_TEXT}  ${order_no}
    ${total_price}=  common.Wait element visible then get text  ${total_price_locator}
    ${total_price}=    String.Replace String    ${total_price}    THB\xa0    ${EMPTY}
    ${total_price}=  String.Replace String    ${total_price}    ,    ${EMPTY}
    ${abs_price} =    BuiltIn.Evaluate    abs(${total_price})

    BuiltIn.Log To Console  \nExpect price = ${expect_total_price}, actual price = ${total_price}

    BuiltIn.Should Be Equal     ${expect_total_price}  ${abs_price}