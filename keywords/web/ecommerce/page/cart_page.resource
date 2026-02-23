*** Keywords ***

Click select all checkbox
    ${locator} =    String.Replace String  ${cart_locator.cb_select_all}    ${REPLACE_TEXT}  ${cart_locator.tick_all.${LOCALE}}
    common.Wait element visible then click  ${locator}

Apply coupon
    [Arguments]    ${coupon}

    ${ddl_locator} =    String.Replace String  ${cart_locator.ddl_coupon}    ${REPLACE_TEXT}  ${cart_locator.coupon.${LOCALE}}
    common.Wait element visible then click  ${ddl_locator}

    ${input_locator} =    String.Replace String  ${cart_locator.input_coupon}    ${REPLACE_TEXT}  ${cart_locator.coupon.${LOCALE}}
    common.Wait element visible then input  ${input_locator}    ${coupon}
    common.Wait element visible then click  ${cart_locator.btn_apply_coupon}

Verify price calculation
    [Documentation]    subtotal + shipping - discount + VAT == total

    ${subtotal}=    cart_page.Get price from price break down word  ${cart_locator.sub_total.${LOCALE}}
    ${shipping}=    cart_page.Get price from price break down word  ${cart_locator.shipping.${LOCALE}}
    ${VAT}=    cart_page.Get price from price break down word  ${cart_locator.VAT.${LOCALE}}
    ${discount}=    cart_page.Get price from price break down word  ${cart_locator.discount.${LOCALE}}
    ${total}=    cart_page.Get price from price break down word  ${cart_locator.total.${LOCALE}}

    ${expected}=    BuiltIn.Evaluate    ${subtotal} + ${shipping} + ${VAT} - ${discount}

    BuiltIn.Log To Console  \nExpect price = ${expected}, actual price = ${total}
    BuiltIn.Should Be Equal As Numbers    ${total}    ${expected}

Get price from price break down word
    [Arguments]     ${break_down_word}

    ${new_locator}    String.Replace String   ${cart_locator.replacable_price}    ${REPLACE_TEXT}     ${break_down_word}
    ${raw_price} =    Get Text    ${new_locator}
    ${price} =    String.Replace String    ${raw_price}    THB\xa0    ${EMPTY}
    ${price} =    String.Replace String    ${price}    ,    ${EMPTY}
    ${abs_price} =    BuiltIn.Evaluate    abs(${price})
    RETURN  ${abs_price}

Proceed to checkout page
    common.Wait element visible then click  ${cart_locator.btn_checkout}
