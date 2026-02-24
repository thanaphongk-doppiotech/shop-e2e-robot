*** Settings ***
Library     Browser
Library     Collections
Library     String
Library     DebugLibrary

# Pages
Resource    ${CURDIR}/../../keywords/web/ecommerce/common.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/auth_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/signup_page.robot
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/checkout_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/header_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/product_detail_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/home_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/product_list_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/cart_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/order_comfirm_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/my_order_page.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/page/notification_page.robot

# Features
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/header_feature.robot
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/purchase_feature.resource
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/login_feature.robot
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/product_detail_feature.robot
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/checkout_feature.robot
Resource    ${CURDIR}/../../keywords/web/ecommerce/feature/cart_feature.robot

# Setting
Resource    ${CURDIR}/../settings/web_settings.resource

# Locator
Resource    ${CURDIR}/../locator/auth_locator.resource
Resource    ${CURDIR}/../locator/signup_locator.robot
Resource    ${CURDIR}/../locator/checkout_locator.resource
Resource    ${CURDIR}/../locator/header_locator.resource
Resource    ${CURDIR}/../locator/product_detail_locator.resource
Resource    ${CURDIR}/../locator/home_locator.resource
Resource    ${CURDIR}/../locator/product_list_locator.resource
Resource    ${CURDIR}/../locator/cart_locator.resource
Resource    ${CURDIR}/../locator/order_confirm_locator.resource
Resource    ${CURDIR}/../locator/my_order_locator.resource
Resource    ${CURDIR}/../locator/notification_locator.robot

# translation
Variables   ${CURDIR}/../translation/web/ecommerce.yaml