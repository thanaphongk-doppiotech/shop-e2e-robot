*** Keywords ***
Click select all checkbox
    Browser.Click       selector=${cart_locator.chk_select_all}

Get product total price by product name
    [Arguments]     ${product_name}
    ${locator}      String.Replace string    string=${cart_locator.lbl_total_price_of_order_by_product_name}    search_for=@#string@#    replace_with=${product_name}
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

Click remove button by product index
    [Arguments]     ${index}
    ${locator}          String.Replace string
    ...                 string=${cart_locator.btn_remove_by_index}
    ...                 search_for=@#index@#
    ...                 replace_with=${index}
    Browser.Click       selector=${locator}
    Browser.Click       selector=${cart_locator.btn_confirm_remove}
    notification_page.Click close notification button

Press up arrow key to increase quantity by index
    [Arguments]     ${index}
    ${locator}              String.Replace string
    ...                     string=${cart_locator.txt_qty_by_index}
    ...                     search_for=@#index@#
    ...                     replace_with=${index}
    Browser.Press keys      ${locator}              ArrowUp
    notification_page.Click close notification button

Press down arrow key to decrease quantity by index
    [Arguments]     ${index}
    ${locator}              String.Replace string
    ...                     string=${cart_locator.txt_qty_by_index}
    ...                     search_for=@#index@#
    ...                     replace_with=${index}
    Browser.Press keys      ${locator}              ArrowDown
    notification_page.Click close notification button

Verify total price is match
    [Arguments]     ${expect_total_price}
    ${expect_total_price}    common.Format number to currency    number=${expect_total_price}
    ${expect_total_price}    BuiltIn.Convert to string    item=${expect_total_price}
    ${locator}      String.Replace string
    ...             string=${cart_locator.lbl_price_of_total_price}
    ...             search_for=@#string_locale@#
    ...             replace_with=${translation.cart.total.${LOCALE}}
    ${locator}      String.Replace string
    ...             string=${locator}
    ...             search_for=@#price@#
    ...             replace_with=${expect_total_price}
    Browser.Wait for elements state    selector=${locator}          state=visible
    common.Highlight elements    locator=${locator}
