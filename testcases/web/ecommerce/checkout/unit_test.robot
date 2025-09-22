*** Settings ***
Resource        ../../../../resources/import/common_import.resource
Test Setup      common.Open website
Test Teardown   common.Test Teardown

*** Test Cases ***

Unit Test random index
    header_page.Go to signin page
    auth_page.Login with email and password  ${test_user.email}  ${test_user.password}

    home_page.Try to add random product until success

    # purchase_feature.Buy random products with qr  ${coupon}

    debug