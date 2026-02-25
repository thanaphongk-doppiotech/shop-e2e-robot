*** Keywords ***
Click increase quantity button
    Browser.Click       selector=${product_detail_locator.btn_increase_qty}

Click decrease quantity button
    Browser.Click       selector=${product_detail_locator.btn_decrease_qty}

Get product price
    ${product_price_text}    Browser.Get text    selector=${product_detail_locator.txt_product_price}
    ${product_price_formatted}    common.Format baht currency to number    currency_text=${product_price_text}
    ${product_price}    BuiltIn.Convert to number    item=${product_price_formatted}
    RETURN      ${product_price}

Get product quantity
    [Documentation]     Get current product quantity amount
    ...                 Returns:
    ...                     -   ${quantity}     (number)    :   The amount of product quantity (e.g., 5)
    ${quantity}     Browser.Get text    selector=${product_detail_locator.txt_quantity}
    RETURN      ${quantity}

Select product color by color name
    [Documentation]     Select dropdown color as value equal to color name
    ...                 Arguments:
    ...                     -   ${color_name}   (string)    :   The color name to be selected (e.g., White)
    [Arguments]     ${color_name}
    ${locator}          String.Replace string    string=${product_detail_locator.opt_color_by_name}                     search_for=@#string@#    replace_with=${color_name}
    Browser.Click       selector=${locator}

Select product color by index
    [Arguments]     ${index}=0
    ${locator}          String.Replace string
    ...                 string=${product_detail_locator.opt_color_by_index}
    ...                 search_for=@#index@#
    ...                 replace_with=${index}
    Browser.Click       selector=${locator}

Select product size by index
    [Arguments]     ${index}=0
    ${locator}          String.Replace string
    ...                 string=${product_detail_locator.opt_size_by_index}
    ...                 search_for=@#index@#
    ...                 replace_with=${index}
    Browser.Click       selector=${locator}

Click add to cart button
    [Documentation]     Click at add to cart button
    Browser.Click       selector=${product_detail_locator.btn_add_to_cart}

Verify out of stock button is display
    ${locator}              String.Replace string
    ...                     string=${product_detail_locator.btn_out_of_stock}
    ...                     search_for=@#string_locale@#
    ...                     replace_with=${translation.button.text.out_of_stock.${LOCALE}}
    ${is_out_of_stock}      Run keyword and return status    Browser.Wait for elements state        selector=${locator}     state=visible
    RETURN      ${is_out_of_stock}
