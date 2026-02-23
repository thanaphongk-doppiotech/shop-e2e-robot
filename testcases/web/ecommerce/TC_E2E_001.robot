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
    # login_feature.Sign up with account data    full_name=${TC_E2E_001.user.full_name}               mobile_number=${random_mobile_number}           email=${generated_email}    password=${TC_E2E_001.user.password}
    login_feature.Login with email and password    email=${TC_E2E_001.test_user.email}    password=${TC_E2E_001.test_user.password}
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
    Debug