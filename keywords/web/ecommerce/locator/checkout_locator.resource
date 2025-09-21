*** Variables ***

${checkout.btn_add_address}             css=[data-testid="checkout-add-address-toggle"]
${checkout.input_fname}                 css=[data-testid="checkout-form-first-name"]
${checkout.input_lname}                 css=[data-testid="checkout-form-last-name"]
${checkout.input_addr_detail}           css=[data-testid="checkout-form-detail"]
${checkout.ddl_province}                css=[data-testid="checkout-form-province"]
${checkout.ddl_district}                css=[data-testid="checkout-form-district"]
${checkout.ddl_sub_disctrict}           css=[data-testid="checkout-form-subdistrict"]
${checkout.input_postcode}              css=[data-testid="checkout-form-postal"]
${checkout.btn_save_addr}               css=[data-testid="checkout-form-save"]

${checkout.opt_replace}                 css=[value="${REPLACE_TEXT}"]

${checkout.tab_card}                    css=[data-testid="checkout-pay-card"]
${checkout.tab_qr}                      css=[data-testid="checkout-pay-qr"]
${checkout.input_card_number}           css=[data-testid="checkout-card-number"]
${checkout.input_card_exp}              css=[data-testid="checkout-card-exp"]
${checkout.input_card_cvv}              css=[data-testid="checkout-card-cvv"]
${checkout.input_card_holder_name}      css=[data-testid="checkout-card-name"]
${checkout.btn_add_new_card}            css=[data-testid="checkout-add-card"]


${checkout.btn_pay}                     css=[data-testid="checkout-place-order"]
${checkout.alert_success}               css=[role="alert"] >> text=Success
${checkout.link_orders}                 css=[data-testid="nav-orders"]