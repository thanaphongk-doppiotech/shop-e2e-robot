*** Settings ***
Library     Browser
Library     Collections
Library     String
# Library     SeleniumLibrary
Library     DebugLibrary

# Pages
Resource    ${CURDIR}/../../keywords/web/ecommerce/common.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/auth_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/checkout_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/header_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/product_detail_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/home_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/product_list_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/cart_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/order_comfirm_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/my_order_page.resource

# Features
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/purchase_feature.resource

# Setting
Resource    ${CURDIR}/../settings/web_settings.resource

# Locator
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/auth_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/checkout_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/header_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/product_detail_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/home_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/product_list_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/cart_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/order_confirm_locator.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/locator/my_order_locator.resource

# Test data
Variables   ${CURDIR}/../../testdata/uat/web/ecommerce/checkout/tc_shop_card_happy.yaml
Variables   ${CURDIR}/../../testdata/uat/web/ecommerce/checkout/tc_shop_qr_random.yaml

# translation
Variables   ${CURDIR}/../translation/web/ecommerce.yaml