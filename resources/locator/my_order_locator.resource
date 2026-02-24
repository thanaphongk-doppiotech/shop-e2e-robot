*** Variables ***
${my_order_locator.lbl_total_price_of_order}     css=div:has( > div >  div:has-text("@#order@#")) > div > div:has-text("@#price@#")
# ${my_order_locator.lbl_total_price_of_order}     css=div:has-text("Order ${REPLACE_TEXT}") + div div.font-semibold
