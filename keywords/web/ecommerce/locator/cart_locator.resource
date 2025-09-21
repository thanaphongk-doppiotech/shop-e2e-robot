*** Variables ***

${cart.cb_select_all}           css=label:has(span:has-text("${REPLACE_TEXT}")) input[type="checkbox"]
${cart.ddl_coupon}              css=button:has(span:text("${REPLACE_TEXT}"))
${cart.input_coupon}            css=input[placeholder="${REPLACE_TEXT}"]
${cart.btn_apply_coupon}        css=[data-testid="cart-apply-coupon"]
${cart.btn_checkout}            css=[data-testid="cart-proceed"]

${cart.replacable_price}        css=span:text-is("${REPLACE_TEXT}") + span

#${checkout.btn_checkout}        css=[data-testid="go-checkout"]
#${checkout.chk_tick_all}        css=[data-testid="tick-all"]
#${checkout.input_coupon}        css=[data-testid="coupon-input"]
#${checkout.btn_apply_coupon}    css=[data-testid="apply-coupon"]

#${checkout.lbl_subtotal}         css=[data-testid="subtotal"]
# ${checkout.lbl_discount}        css=[data-testid="discount"]
# ${checkout.lbl_shipping}        css=[data-testid="shipping"]
# ${checkout.lbl_total}           css=[data-testid="total"]