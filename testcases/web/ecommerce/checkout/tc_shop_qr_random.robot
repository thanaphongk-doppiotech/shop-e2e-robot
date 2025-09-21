*** Settings ***
Documentation    TC_UI:TC10002 - Random products + QR payment
Resource         ../../../resources/import/common_import.resource

*** Test Cases ***
TC_UI:TC10002 - Verify QR checkout with random pick
    [Tags]    case_key:SHOP-002    platform:web    status:ready    test_type:regression
    purchase_feature.Sign up and login    ${user.email}    ${user.password}
    purchase_feature.Buy random products with qr    ${coupon}