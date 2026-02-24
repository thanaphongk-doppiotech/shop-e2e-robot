*** Keywords ***
Calculate sum of each product in cart
    [Documentation]    คำนวณผลรวมของราคาสินค้าทั้งหมดในตะกร้า
    ${sum}=                 BuiltIn.Set variable    ${0}
    ${product_elements}=    Browser.Get elements    selector=${cart_locator.lbl_list_product_total_price}
    FOR    ${element}    IN    @{product_elements}
        ${raw_price}=       Browser.Get text    selector=${element}
        ${clean_price}=     common.Format baht currency to number    currency_text=${raw_price}
        ${sum}=             Evaluate            ${sum} + float(${clean_price})
    END
    RETURN                  ${sum}

Remove all item in cart
    ${product_elements}     Browser.Get elements    selector=${cart_locator.btn_remove_elements}
    ${product_elements_length}    BuiltIn.Get length    item=${product_elements}
    BuiltIn.Return from keyword if    ${product_elements_length} < 1
    FOR    ${i}    IN RANGE   ${product_elements_length}
        ${locator}          String.Replace string
        ...                 string=${cart_locator.btn_remove_by_index}
        ...                 search_for=@#index@#
        ...                 replace_with=0
        Browser.Click       selector=${locator}
        Browser.Click       selector=${cart_locator.btn_confirm_remove}
        notification_page.Click close notification button
    END
