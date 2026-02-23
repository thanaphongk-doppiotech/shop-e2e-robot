*** Keywords ***

Get order number
    ${order_number}=  common.Wait element visible then get text  ${order_confirm_locator.order_number}
    RETURN  ${order_number}

Go to my order page
    common.Wait element visible then click  ${order_confirm_locator.btn_view_my_order}

Click QR paid button
    common.Wait element visible then click  ${order_confirm_locator.paid_success}