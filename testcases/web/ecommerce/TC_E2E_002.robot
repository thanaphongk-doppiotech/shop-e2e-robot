*** Settings ***
Resource            ${CURDIR}/../../../resources/import/common_import.resource
Variables           ${CURDIR}/../../../resources/testdata/uat/web/ecommerce/TC_E2E_001_002.yaml
Test Setup          common.Open website
Test Teardown       common.Test teardown

*** Test Cases ***
TC_E2E_002 - Verify customer can buy a random product successfully
    [Tags]      test_id:tc_e2e_002      platform:web    status:ready    test_type:smoke
    # prepare test data
    ${generated_email}      common.Get generated email
    ${random_mobile_number}    common.Get random mobile number
    # Extra Test – Repeat with random products and pay via QR Code
    # เพิ่ม: ทดสอบสุ่มสินค้า + จ่ายด้วย QR; และทดสอบแก้ไขตะกร้า (เพิ่ม/ลด/ลบ) พร้อมตรวจยอดรวมอัปเดตถูกต้อง
    # start test case
    # Sign up → login
    # login_feature.Sign up with account data    full_name=${TC_E2E_001.user.full_name}                       mobile_number=${random_mobile_number}                       email=${generated_email}    password=${TC_E2E_001.user.password}
    login_feature.Login with email and password    email=${TC_E2E_001.test_user.email}    password=${TC_E2E_001.test_user.password}
    header_page.Click cart button
    cart_feature.Remove all item in cart
    # add random product
    product_detail_feature.Add product to cart by random from homepage    retry_times=${DEFAULT_RETRY_TIMES}
    # Change UI language to Thai
    header_feature.Change language    language=${LOCALE_TH}
    # add another second random product
    product_detail_feature.Add product to cart by random from homepage    retry_times=${DEFAULT_RETRY_TIMES}
    # add another third random product
    product_detail_feature.Add product to cart by random from homepage    retry_times=${DEFAULT_RETRY_TIMES}
    # go cart page, select all, add coupon and verify price on cart
    header_page.Click cart button
    cart_page.Click select all checkbox
    ${shipping_price}       cart_page.Get shipping price in cart summary
    ${actual_cart_total_price}    cart_feature.Calculate sum of each product in cart
    ${expect_total_price}    BuiltIn.Evaluate       ${actual_cart_total_price} + ${shipping_price}
    cart_page.Verify total price is match    expect_total_price=${expect_total_price}
    # increase first product qty
    cart_page.Press up arrow key to increase quantity by index    index=0
    # decrease last product qty
    cart_page.Press down arrow key to decrease quantity by index    index=-1
    # remove second product from cart
    cart_page.Click remove button by product index    index=1
    ${shipping_price}       cart_page.Get shipping price in cart summary
    ${actual_cart_total_price}    cart_feature.Calculate sum of each product in cart
    ${expect_total_price}    BuiltIn.Evaluate       ${actual_cart_total_price} + ${shipping_price}
    cart_page.Verify total price is match    expect_total_price=${expect_total_price}
    # Apply coupon
    cart_page.Click coupon dropdown
    cart_page.Input coupon    coupon=${TC_E2E_001.coupon}
    cart_page.Click apply coupon button
    notification_page.Click close notification button
    # paid by QR
    cart_page.Click checkout button
    checkout_feature.Add new address if empty
    ...                     first_name=${TC_E2E_001.address.fname}
    ...                     last_name=${TC_E2E_001.address.lname}
    ...                     addr_no=${TC_E2E_001.address.addr_no}
    ...                     province=${TC_E2E_001.address.province}
    ...                     district=${TC_E2E_001.address.district}
    ...                     subdistrict=${TC_E2E_001.address.subdistrict}
    checkout_page.Select pay by qr code
    checkout_page.Click place order button
    order_comfirm_page.Verify qr code image is display
    order_comfirm_page.Click qr paid button
    ${order_number}         order_comfirm_page.Get order number
    # verify price on my order page
    order_comfirm_page.Click view my order button
    my_order_page.Verify total price of order number is match               order_id=${order_number}    expect_total_price=${expect_total_price}
