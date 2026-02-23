*** Settings ***
Documentation       TC_UI:TC10001 - Card checkout flow — Sign up, add mug+keyboard, coupon, pay by card
Resource            ${CURDIR}/../../../resources/import/common_import.resource
Variables           ${CURDIR}/../../../resources/testdata/uat/web/ecommerce/TC_E2E_001.yaml
Test Setup          common.Open website
Test Teardown       common.Test teardown

*** Test Cases ***
TC_E2E_001 - Verify new register customer can buy product successfully
    [Tags]      test_id:tc_e2e_001      platform:web    status:ready    test_type:smoke
    # prepare test data
    ${generated_email}      common.Get generated email
    ${random_mobile_number}    common.Get random mobile number
    # start test case
    # Step 1 – Sign up → login
    login_feature.Sign up with account data    full_name=${TC_E2E_001.user.full_name}               mobile_number=${random_mobile_number}           email=${generated_email}    password=${TC_E2E_001.user.password}
    # login_feature.Login with email and password    email=${TC_E2E_001.test_user.email}    password=${TC_E2E_001.test_user.password}
    # Step 2 – Ensure 8 suggested products are displayed (use loop + list + count)
    home_page.Verify suggested products are match with expect    expect_amount=${TC_E2E_001.home_page.suggest_product.amount}
    # Step 3 – Search “mug” and click autocomplete “Ceramic Mug”
    header_feature.Input search and click on suggest word           search_text=${TC_E2E_001.products.ceramic_mug.query}    suggest_text=${TC_E2E_001.products.ceramic_mug.name}
    # Step 4 – Add 3× Ceramic Mug to cart (select color)
    ${mug_price}            product_detail_page.Get product price
    product_detail_feature.Click increase quantity button to add product by number    number=${TC_E2E_001.products.ceramic_mug.qty}
    product_detail_page.Select product color by color name    color_name=${TC_E2E_001.products.ceramic_mug.color}
    product_detail_page.Click add to cart button
    notification_page.Click close notification button
    # Step 5 – Search “keyboard” (ignore autocomplete; use normal search)
    header_page.Input search text    text=${TC_E2E_001.products.keyboard.query}
    header_page.Click search button
    # Step 6 – Change UI language to Thai
    header_feature.Change language    language=${LOCALE_TH}
    # Step 7 – Add 2× keyboard to cart
    product_detail_page.Click product name to view detail    product_name=${TC_E2E_001.products.keyboard.name}
    ${keyboard_price}       product_detail_page.Get product price
    product_detail_feature.Click increase quantity button to add product by number    number=${TC_E2E_001.products.keyboard.qty}
    product_detail_page.Select product color by color name    color_name=${TC_E2E_001.products.keyboard.color}
    product_detail_page.Click add to cart button
    notification_page.Click close notification button
    # Step 8 – Go to checkout, tick all agreements, verify price calculation
    header_page.Click cart button
    cart_page.Click select all checkbox
    ${mug_total_price}      BuiltIn.Evaluate    ${mug_price} * ${TC_E2E_001.products.ceramic_mug.qty}
    ${keyboard_total_price}    BuiltIn.Evaluate    ${keyboard_price} * ${TC_E2E_001.products.keyboard.qty}
    ${shipping}             cart_page.Get shipping price in cart summary
    ${actual_total_price}    cart_page.Get total price in cart summary
    ${expect_total_price}    BuiltIn.Evaluate    ${mug_total_price} + ${keyboard_total_price} + ${shipping}
    BuiltIn.Should be equal as numbers    first=${actual_total_price}    second=${expect_total_price}
    # Step 9 – Apply coupon
    cart_page.Click coupon dropdown
    cart_page.Input coupon    coupon=${TC_E2E_001.coupon}
    cart_page.Click apply coupon button
    notification_page.Click close notification button
    # Step 10 – Checkout with Credit Card 411111111111111 (+ any other fields OK)
    cart_page.Click checkout button
    checkout_feature.Add new address
    ...                     first_name=${TC_E2E_001.address.fname}
    ...                     last_name=${TC_E2E_001.address.lname}
    ...                     addr_no=${TC_E2E_001.address.addr_no}
    ...                     province=${TC_E2E_001.address.province}
    ...                     district=${TC_E2E_001.address.district}
    ...                     subdistrict=${TC_E2E_001.address.subdistrict}
    checkout_feature.Add new credit card
    ...                     card_number=${TC_E2E_001.payment.card_number}
    ...                     exp=${TC_E2E_001.payment.exp}
    ...                     cvv=${TC_E2E_001.payment.cvv}
    ...                     card_holder_name=${TC_E2E_001.payment.card_holder_name}
    checkout_page.Click place order button
    ${order_number}     order_comfirm_page.Get order number
    # Step 11 – Open Orders page and verify order summary is correct
    order_comfirm_page.Click view my order button
    # Extra Test – Repeat with random products and pay via QR Code
    Debug