*** Keywords ***
Click increase quantity button
    Browser.Click       selector=${product_detail_locator.btn_increase_qty}

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
    ${locator}          String.Replace string    string=${product_detail_locator.btn_color_by_name}                     search_for=@#string@#    replace_with=${color_name}
    Browser.Click       selector=${locator}

Click add to cart button
    [Documentation]     Click at add to cart button
    Browser.Click       selector=${product_detail_locator.btn_add_to_cart}

Click product name to view detail
    [Arguments]     ${product_name}
    ${locator}          String.Replace string    string=${product_detail_locator.lnk_product_by_name}                   search_for=@#string@#    replace_with=${product_name}
    Browser.Hover       selector=${locator}
    Browser.Click       selector=${locator}

# Fix me
Add product with color and quantity
    [Arguments]     ${color}=${DEFAULT_COLOR}    ${qty}=1

    Browser.Wait for elements state    ${product_detail_locator.color_picker}    timeout=${LONG_TIMEOUT}
    ${opt}=             String.Replace string               ${product_detail_locator.color_option_tpl}      ${REPLACE_TEXT}    ${color}
    Browser.Click       ${opt}

    # Set quantity (example: clear & type)
    product_detail_page.Add quantity    ${qty}
    product_detail_page.Click add to cart

Add quantity
    [Arguments]     ${qty}
    common.Wait element visible then input    ${product_detail_locator.qty_input}    ${qty}

Click add to cart
    common.Wait element visible then click    ${product_detail_locator.btn_add}

Add product given quantity
    [Arguments]     ${qty}=1
    ${color_visible}=       Run keyword and return status    Browser.Wait for elements state                ${product_detail_locator.color_picker}    timeout=5s
    Run keyword if          ${color_visible}    product_detail_page.Select color if exist by index    ${product_detail_locator.color_picker}

    ${size_visible}=        Run keyword and return status    Browser.Wait for elements state                ${product_detail_locator.size_picker}    timeout=5s
    Run keyword if          ${color_visible}    product_detail_page.Select size if exist by index    ${product_detail_locator.size_picker}

    product_detail_page.Add quantity    ${qty}
    product_detail_page.Click add to cart


Select color if exist by index
    [Documentation]     check picker state if exist then select option by given value
    [Arguments]     ${variant_loc}      ${color_index}=0

    ${state}=           Browser.Get element states    ${variant_loc}
    IF    "visible" in ${state}
        BuiltIn.Log to console    \nvaraint color exist
        ${opt}=             String.Replace string               ${product_detail_locator.color_option_index}    ${REPLACE_TEXT}    ${color_index}
        Browser.Click       ${opt}
    ELSE
        BuiltIn.Log to console    \nvaraint color not exist
    END

Select size if exist by index
    [Documentation]     check picker state if exist then select option by given value
    [Arguments]     ${variant_loc}      ${size_index}=0

    ${state}=           Browser.Get element states    ${variant_loc}
    IF    "visible" in ${state}
        BuiltIn.Log to console    \nvaraint size exist
        ${opt}=             String.Replace string               ${product_detail_locator.size_option_index}     ${REPLACE_TEXT}    ${size_index}
        Browser.Click       ${opt}
    ELSE
        BuiltIn.Log to console    \nvaraint size not exist
    END

Verify product added to card successfully
    ${locator}=     String.Replace string    ${product_detail_locator.notification_msg}             ${REPLACE_TEXT}    ${notifications.added_to_cart.${LOCALE}}
    Browser.Wait for elements state                 ${locator}      timeout=${LONG_TIMEOUT}
    # Browser.Get Element States      ${locator}  contains    visible

Verify is product out of stock
    ${btn_text}=    common.Wait element visible then get text    ${product_detail_locator.btn_add}
    BuiltIn.Should be equal    ${btn.text.out_of_stock${LOCALE}}    ${btn_text}     ignore_case=True    strip_spaces=True

