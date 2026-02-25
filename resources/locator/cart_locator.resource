*** Variables ***
${cart_locator.chk_select_all}                              css=label > input[type="checkbox"] + span
${cart_locator.lbl_total_price_of_order_by_product_name}    css=div:has(> div > [type=checkbox] + div > div:has-text("@#string@#")) > div > span
${cart_locator.lbl_summary_by_text}                         css=span:text-is("@#string@#") + span
${cart_locator.ddl_coupon}                                  css=button:has(+[aria-label="Remove Coupon"])
${cart_locator.txt_coupon}                                  css=input:has(+[data-testid="cart-apply-coupon"])
${cart_locator.btn_checkout}                                css=[data-testid="cart-proceed"]
${cart_locator.btn_apply_coupon}                            css=[data-testid="cart-apply-coupon"]
${cart_locator.txt_qty_by_index}                            css=[id^="qty-"] >> nth=@#index@#
${cart_locator.btn_remove_elements}                         css=[id^="btn-remove-"]
${cart_locator.btn_remove_by_index}                         css=[id^="btn-remove-"] >> nth=@#index@#
${cart_locator.lbl_list_product_total_price}                css=[id^="qty-"] + span
${cart_locator.lbl_price_of_total_price}                    css=span:has-text("@#string_locale@#") + span:has-text("@#price@#")
${cart_locator.btn_confirm_remove}                          css=p + div > .btn-ghost + .btn-danger
