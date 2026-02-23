*** Variables ***

${checkout_locator.btn_add_address}             css=[data-testid="checkout-add-address-toggle"]
${checkout_locator.input_fname}                 css=[data-testid="checkout-form-first-name"]
${checkout_locator.input_lname}                 css=[data-testid="checkout-form-last-name"]
${checkout_locator.input_addr_detail}           css=[data-testid="checkout-form-detail"]
${checkout_locator.ddl_province}                css=[data-testid="checkout-form-province"]
${checkout_locator.ddl_district}                css=[data-testid="checkout-form-district"]
${checkout_locator.ddl_sub_disctrict}           css=[data-testid="checkout-form-subdistrict"]
${checkout_locator.input_postcode}              css=[data-testid="checkout-form-postal"]
${checkout_locator.btn_save_addr}               css=[data-testid="checkout-form-save"]

${checkout_locator.opt_replace}                 css=[value="${REPLACE_TEXT}"]

${checkout_locator.tab_card}                    css=[data-testid="checkout-pay-card"]
${checkout_locator.tab_qr}                      css=[data-testid="checkout-pay-qr"]
${checkout_locator.input_card_number}           css=[data-testid="checkout-card-number"]
${checkout_locator.input_card_exp}              css=[data-testid="checkout-card-exp"]
${checkout_locator.input_card_cvv}              css=[data-testid="checkout-card-cvv"]
${checkout_locator.input_card_holder_name}      css=[data-testid="checkout-card-name"]
${checkout_locator.btn_add_new_card}            css=[data-testid="checkout-add-card"]


${checkout_locator.btn_pay}                     css=[data-testid="checkout-place-order"]
${checkout_locator.alert_success}               css=[role="alert"] >> text=Success
${checkout_locator.link_orders}                 css=[data-testid="nav-orders"]