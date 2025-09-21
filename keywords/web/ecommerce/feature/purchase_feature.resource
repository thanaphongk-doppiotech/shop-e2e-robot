*** Keywords ***
Sign up and login
    [Arguments]    ${email}    ${password}
    header_page.Go to signin page
    auth_page.Sign up with generated email and password    ${email}    ${password}
    common.Short sleep
    
Buy mug and keyboard with card
    [Arguments]     ${mug_word}  ${mug_suggest_word}  ${mug_color}  ${mug_qty}
    ...     ${keyboard_query}  ${keyboard_name}  ${keyboard_qty}  ${coupon}

    header_page.Go to home page

    home_page.Verify suggested products are 8

    header_page.Partial search and select suggest word from autocomplete  ${mug_word}  ${mug_suggest_word}
    
    product_detail_page.Add product with color and quantity  ${mug_color}  ${mug_qty}
    product_detail_page.Verify product added to card successfully

    header_page.Search keyword ignoring autocomplete  ${keyboard_query}
    header_page.Change language to thai

    product_list_page.Scroll to product card by product name  ${keyboard_name}
    product_list_page.Click product name to product details  ${keyboard_name}
    product_detail_page.Add product with color and quantity  qty=${keyboard_qty}
    product_detail_page.Verify product added to card successfully

    header_page.Go to cart page
    cart_page.Click select all checkbox
    cart_page.Apply coupon  ${coupon}
    cart_page.Verify price calculation
    ${total}=  cart_page.Get price from price break down word  ${cart.total.${LOCALE}}
    cart_page.Proceed to checkout page

    checkout_page.Add new address  ${address.fname}  ${address.lname}  ${address.addr_no}
    ...     ${address.province}  ${address.district}  ${address.subdistrict}
    checkout_page.Add new credit card  ${payment.card_number}  ${payment.exp}  ${payment.cvv}  ${payment.card_holder_name}
 
    checkout_page.Place order

    ${order_no}=  order_comfirm_page.Get order number
    order_comfirm_page.Go to my order page

    my_order_page.Verify total price by order number  ${order_no}  ${total}


Buy random products with qr
    [Arguments]    ${coupon}
    # Example approach: iterate N products on current list and add 1 each
    ${cards}=    Get Elements    ${header.suggested_cards}
    FOR    ${i}    IN RANGE    0    2
        Click    ${cards}[${i}] >> ${pdp.btn_add}
    END
    Go to checkout and tick all
    Verify price calculation
    Apply coupon    ${coupon}
    Pay by qr code
    Go to orders and verify latest