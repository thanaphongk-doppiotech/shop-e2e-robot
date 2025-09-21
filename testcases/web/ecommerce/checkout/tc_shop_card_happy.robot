*** Settings ***
Documentation   TC_UI:TC10001 - Card checkout flow — Sign up, add mug+keyboard, coupon, pay by card
Resource        ../../../../resources/import/common_import.resource
Test Setup      common.Open website
Test Teardown   common.Test Teardown

*** Test Cases ***
TC_UI:TC10001 - Verify card checkout end-to-end
    [Tags]    case_key:SHOP-001    platform:web    status:ready    test_type:smoke
    # Precondition: sign up + login
    purchase_feature.Sign up and login    ${user.email}    ${user.password}
    purchase_feature.Buy mug and keyboard with card
    ...     ${products.ceramic_mug.query}  ${products.ceramic_mug.name}  ${products.ceramic_mug.color}  ${products.ceramic_mug.qty}
    ...     ${products.keyboard.query}  ${products.keyboard.name}  ${products.keyboard.qty}  ${coupon}

    debug