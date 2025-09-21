*** Keywords ***

Add product with color and quantity
    [Arguments]    ${color}=${DEFAULT_COLOR}    ${qty}=1
    [Documentation]    Choose color then set quantity and add to cart
    
    Browser.Wait For Elements State     ${pdp.color_picker}     timeout=${LONG_TIMEOUT}
    ${opt}=    String.Replace String    ${pdp.color_option_tpl}    ${REPLACE_TEXT}    ${color}
    Browser.Click    ${opt}
    # # Set quantity (example: clear & type)
    Browser.Fill Text     ${pdp.qty_input}    ${qty}
    Browser.Click         ${pdp.btn_add}

Verify product added to card successfully
    ${locator}=    String.Replace String    ${pdp.notification_msg}    ${REPLACE_TEXT}    ${notifications.added_to_cart.${LOCALE}}
    Browser.Wait For Elements State     ${locator}     timeout=${LONG_TIMEOUT}
    # Browser.Get Element States      ${locator}  contains    visible