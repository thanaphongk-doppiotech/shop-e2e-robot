*** Keywords ***

Add product with color and quantity
    [Arguments]    ${color}=${DEFAULT_COLOR}    ${qty}=1
    
    Browser.Wait For Elements State   ${pdp.color_picker}    timeout=${LONG_TIMEOUT}
    ${opt}=    String.Replace String    ${pdp.color_option_tpl}    ${REPLACE_TEXT}    ${color}
    Browser.Click    ${opt}

    # Set quantity (example: clear & type)
    product_detail_page.Add quantity  ${qty}
    product_detail_page.Click add to cart

Add quantity
    [Arguments]     ${qty}
    common.Wait element visible then input  ${pdp.qty_input}    ${qty}

Click add to cart
    common.Wait element visible then click  ${pdp.btn_add}

Add product given quantity
    [Arguments]    ${qty}=1
    ${color_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State   ${pdp.color_picker}    timeout=5s
    Run Keyword If    ${color_visible}    product_detail_page.Select color if exist by index  ${pdp.color_picker}

    ${size_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State   ${pdp.size_picker}    timeout=5s
    Run Keyword If    ${color_visible}    product_detail_page.Select size if exist by index  ${pdp.size_picker}

    product_detail_page.Add quantity  ${qty}
    product_detail_page.Click add to cart


Select color if exist by index
    [Documentation]     check picker state if exist then select option by given value
    [Arguments]     ${variant_loc}  ${color_index}=0

    ${state}=    Browser.Get Element States    ${variant_loc}
    IF    "visible" in ${state}
        BuiltIn.Log To Console    \nvaraint color exist
        ${opt}=    String.Replace String    ${pdp.color_option_index}    ${REPLACE_TEXT}    ${color_index}
        Browser.Click    ${opt}
    ELSE
        BuiltIn.Log To Console    \nvaraint color not exist
    END

Select size if exist by index
    [Documentation]     check picker state if exist then select option by given value
    [Arguments]     ${variant_loc}  ${size_index}=0

    ${state}=    Browser.Get Element States    ${variant_loc}
    IF    "visible" in ${state}
        BuiltIn.Log To Console    \nvaraint size exist
        ${opt}=    String.Replace String    ${pdp.size_option_index}    ${REPLACE_TEXT}    ${size_index}
        Browser.Click    ${opt}
    ELSE
        BuiltIn.Log To Console    \nvaraint size not exist
    END

Verify product added to card successfully
    ${locator}=    String.Replace String    ${pdp.notification_msg}    ${REPLACE_TEXT}    ${notifications.added_to_cart.${LOCALE}}
    Browser.Wait For Elements State     ${locator}     timeout=${LONG_TIMEOUT}
    # Browser.Get Element States      ${locator}  contains    visible

Verify is product out of stock
    ${btn_text}=    common.Wait element visible then get text  ${pdp.btn_add}
    BuiltIn.Should Be Equal     ${btn.text.out_of_stock${LOCALE}}   ${btn_text}  ignore_case=True  strip_spaces=True

