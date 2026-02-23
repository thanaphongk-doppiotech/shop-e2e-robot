*** Variables ***

${cart_locator.cb_select_all}           css=label:has(span:has-text("${REPLACE_TEXT}")) input[type="checkbox"]
${cart_locator.ddl_coupon}              css=button:has(span:text("${REPLACE_TEXT}"))
${cart_locator.input_coupon}            css=input[placeholder="${REPLACE_TEXT}"]
${cart_locator.btn_apply_coupon}        css=[data-testid="cart-apply-coupon"]
${cart_locator.btn_checkout}            css=[data-testid="cart-proceed"]

${cart_locator.replacable_price}        css=span:text-is("${REPLACE_TEXT}") + span

#${checkout_locator.btn_checkout}        css=[data-testid="go-checkout"]
#${checkout_locator.chk_tick_all}        css=[data-testid="tick-all"]
#${checkout_locator.input_coupon}        css=[data-testid="coupon-input"]
#${checkout_locator.btn_apply_coupon}    css=[data-testid="apply-coupon"]

#${checkout_locator.lbl_subtotal}         css=[data-testid="subtotal"]
# ${checkout_locator.lbl_discount}        css=[data-testid="discount"]
# ${checkout_locator.lbl_shipping}        css=[data-testid="shipping"]
# ${checkout_locator.lbl_total}           css=[data-testid="total"]