*** Keywords ***

Get order number
    ${order_number}=  common.Wait element visible then get text  ${order_cf.order_number}
    RETURN  ${order_number}

Go to my order page
    common.Wait element visible then click  ${order_cf.btn_view_my_order}