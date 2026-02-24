*** Variables ***
${cart_locator.chk_select_all}                      css=label > input[type="checkbox"] + span
${cart_locator.lbl_total_price_of_order_by_product_name}     css=div:has(> div > [type=checkbox] + div > div:has-text("@#string@#")) > div > span
${cart_locator.lbl_summary_by_text}                 css=span:text-is("@#string@#") + span
${cart_locator.ddl_coupon}                          css=button:has(+[aria-label="Remove Coupon"])
${cart_locator.txt_coupon}                          css=input:has(+[data-testid="cart-apply-coupon"])
${cart_locator.btn_checkout}                        css=[data-testid="cart-proceed"]
${cart_locator.btn_apply_coupon}                    css=[data-testid="cart-apply-coupon"]

# Fix me
${cart_locator.cb_select_all}                       css=label:has(span:has-text("${REPLACE_TEXT}")) input[type="checkbox"]
${cart_locator.replacable_price}                    css=span:text-is("${REPLACE_TEXT}") + span

#${checkout_locator.btn_checkout}        css=[data-testid="go-checkout"]
#${checkout_locator.chk_tick_all}        css=[data-testid="tick-all"]
#${checkout_locator.txt_coupon}        css=[data-testid="coupon-input"]
#${checkout_locator.btn_apply_coupon}    css=[data-testid="apply-coupon"]

#${checkout_locator.lbl_subtotal}         css=[data-testid="subtotal"]
# ${checkout_locator.lbl_discount}        css=[data-testid="discount"]
# ${checkout_locator.lbl_shipping}        css=[data-testid="shipping"]
# ${checkout_locator.lbl_total}           css=[data-testid="total"]