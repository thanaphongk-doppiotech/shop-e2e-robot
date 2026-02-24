*** Keywords ***
Click select all checkbox
    Browser.Click       selector=${cart_locator.chk_select_all}

Get product total price by product name
    [Arguments]     ${product_name}
    ${locator}      String.Replace string    string=${cart_locator.lbl_total_price_of_order_by_product_name}             search_for=@#string@#    replace_with=${product_name}
    ${price}        Browser.Get text    selector=${locator}
    RETURN          ${price}

Get total price in cart summary
    ${locator}      String.Replace string    string=${cart_locator.lbl_summary_by_text}                         search_for=@#string@#    replace_with=${translation.cart.total.${LOCALE}}
    ${price}        Browser.Get text    selector=${locator}
    ${price}        common.Format baht currency to number    currency_text=${price}
    RETURN      ${price}

Get shipping price in cart summary
    ${locator}      String.Replace string    string=${cart_locator.lbl_summary_by_text}                         search_for=@#string@#    replace_with=${translation.cart.shipping.${LOCALE}}
    ${price}        Browser.Get text    selector=${locator}
    ${price}        common.Format baht currency to number    currency_text=${price}
    RETURN      ${price}

Click coupon dropdown
    Browser.Click       selector=${cart_locator.ddl_coupon}

Input coupon
    [Arguments]     ${coupon}
    Browser.Fill text       selector=${cart_locator.txt_coupon}    txt=${coupon}

Click checkout button
    Browser.Click       selector=${cart_locator.btn_checkout}

Click apply coupon button
    Browser.Click       selector=${cart_locator.btn_apply_coupon}

#   Fix me
Apply coupon
    [Arguments]     ${coupon}

    ${ddl_locator} =        String.Replace string    ${cart_locator.ddl_coupon}                     ${REPLACE_TEXT}         ${cart_locator.coupon.${LOCALE}}
    common.Wait element visible then click    ${ddl_locator}

    ${input_locator} =      String.Replace string    ${cart_locator.txt_coupon}                     ${REPLACE_TEXT}         ${cart_locator.coupon.${LOCALE}}
    common.Wait element visible then input    ${input_locator}    ${coupon}
    common.Wait element visible then click    ${cart_locator.btn_apply_coupon}

Verify price calculation
    [Documentation]    subtotal + shipping - discount + VAT == total

    ${subtotal}=    cart_page.Get price from price break down word    ${cart_locator.sub_total.${LOCALE}}
    ${shipping}=    cart_page.Get price from price break down word    ${cart_locator.shipping.${LOCALE}}
    ${VAT}=         cart_page.Get price from price break down word    ${cart_locator.VAT.${LOCALE}}
    ${discount}=    cart_page.Get price from price break down word    ${cart_locator.discount.${LOCALE}}
    ${total}=       cart_page.Get price from price break down word    ${cart_locator.total.${LOCALE}}

    ${expected}=    BuiltIn.Evaluate    ${subtotal} + ${shipping} + ${VAT} - ${discount}

    BuiltIn.Log to console    \nExpect price = ${expected}, actual price = ${total}
    BuiltIn.Should be equal as numbers    ${total}          ${expected}

Get price from price break down word
    [Arguments]     ${break_down_word}

    ${new_locator}      String.Replace string    ${cart_locator.replacable_price}    ${REPLACE_TEXT}    ${break_down_word}
    ${raw_price} =      Get text            ${new_locator}
    ${price} =          String.Replace string    ${raw_price}    THB\xa0            ${EMPTY}
    ${price} =          String.Replace string    ${price}       ,                   ${EMPTY}
    ${abs_price} =      BuiltIn.Evaluate    abs(${price})
    RETURN          ${abs_price}

