*** Settings ***
Documentation   TC_UI:TC10001 - Card checkout flow — Sign up, add mug+keyboard, coupon, pay by card
Resource        ${CURDIR}/../../../resources/import/common_import.resource
Test Setup      common.Open website
Test Teardown   common.Test Teardown

*** Test Cases ***
TC_UI:TC10001 - Verify card checkout end-to-end
    [Tags]    case_key:SHOP-001    platform:web    status:ready    test_type:smoke
    debug
    # Step 1 – Sign up → login
    purchase_feature.Sign up and login    ${user.email}    ${user.password}
    # Step 2 – Ensure 8 suggested products are displayed (use loop + list + count)
    # Step 3 – Search “mug” and click autocomplete “Ceramic Mug”
    # Step 4 – Add 3× Ceramic Mug to cart (select color)
    # Step 5 – Search “keyboard” (ignore autocomplete; use normal search)
    # Step 6 – Change UI language to Thai
    # Step 7 – Add 2× keyboard to cart
    # Step 8 – Go to checkout, tick all agreements, verify price calculation
    # Step 9 – Apply coupon
    # Step 10 – Checkout with Credit Card 411111111111111 (+ any other fields OK)
    # Step 11 – Open Orders page and verify order summary is correct
    # Extra Test – Repeat with random products and pay via QR Code
