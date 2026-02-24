*** Keywords ***
Get order number
    ${lbl_order_number}     Browser.Get text    selector=${order_confirm_locator.lbl_order_number}
    RETURN      ${lbl_order_number}

Click view my order button
    Browser.Click       selector=${order_confirm_locator.btn_view_my_order}

Verify qr code image is display
    Browser.Wait for elements state    selector=${order_confirm_locator.img_qr_code}    state=visible
    common.Highlight elements    locator=${order_confirm_locator.img_qr_code}

Click qr paid button
    Browser.Click       selector=${order_confirm_locator.btn_paid_success}
