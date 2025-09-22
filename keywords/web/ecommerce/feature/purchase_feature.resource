*** Keywords ***
Sign up and login
    [Arguments]    ${email}    ${password}
    header_page.Go to signin page
    auth_page.Sign up with generated email and password    ${email}    ${password}
    common.Short sleep
    
Buy mug and keyboard with card
    [Arguments]     ${mug_word}  ${mug_suggest_word}  ${mug_color}  ${mug_qty}
    ...     ${keyboard_query}  ${keyboard_name}  ${keyboard_qty}  ${coupon}

    # Go to home page, verify 8 suggest product
    header_page.Go to home page
    home_page.Verify suggested products are 8

    # Search mug and click autocomplete
    header_page.Partial search and select suggest word from autocomplete  ${mug_word}  ${mug_suggest_word}

    # add mug to cart
    product_detail_page.Add product with color and quantity  ${mug_color}  ${mug_qty}
    product_detail_page.Verify product added to card successfully

    # search keyboard
    header_page.Search keyword ignoring autocomplete  ${keyboard_query}
    header_page.Change language to thai

    # add keyboard
    product_list_page.Scroll to product card by product name  ${keyboard_name}
    product_list_page.Click product name to product details  ${keyboard_name}
    product_detail_page.Add product with color and quantity  qty=${keyboard_qty}
    product_detail_page.Verify product added to card successfully

    # go cart page, select all, add coupon and verify price break down
    header_page.Go to cart page
    cart_page.Click select all checkbox
    cart_page.Apply coupon  ${coupon}
    cart_page.Verify price calculation
    ${total}=  cart_page.Get price from price break down word  ${cart.total.${LOCALE}}
    cart_page.Proceed to checkout page

    # add new address and credit card
    checkout_page.Add new address  ${address.fname}  ${address.lname}  ${address.addr_no}
    ...     ${address.province}  ${address.district}  ${address.subdistrict}
    checkout_page.Add new credit card  ${payment.card_number}  ${payment.exp}  ${payment.cvv}  ${payment.card_holder_name}
 
    checkout_page.Place order

    ${order_no}=  order_comfirm_page.Get order number
    order_comfirm_page.Go to my order page

    # compare total price from cart vs my order
    my_order_page.Verify total price by order number  ${order_no}  ${total}


Buy random products with qr
    [Arguments]    ${coupon}

    # add random product
    home_page.Try to add random product until success  3

    header_page.Change language to thai

    # add another random product
    home_page.Try to add random product until success  2

    # go cart page, select all, add coupon and verify price break down
    header_page.Go to cart page
    cart_page.Click select all checkbox
    cart_page.Apply coupon  ${coupon}
    cart_page.Verify price calculation
    ${total}=  cart_page.Get price from price break down word  ${cart.total.${LOCALE}}
    cart_page.Proceed to checkout page

    # add new address and paid by QR 
    checkout_page.Add new address  ${address.fname}  ${address.lname}  ${address.addr_no}
    ...     ${address.province}  ${address.district}  ${address.subdistrict}
    checkout_page.Select QR code payment method
    checkout_page.Place order

    order_comfirm_page.Click QR paid button
    ${order_no}=  order_comfirm_page.Get order number
    order_comfirm_page.Go to my order page

    # compare total price from cart vs my order
    my_order_page.Verify total price by order number  ${order_no}  ${total}