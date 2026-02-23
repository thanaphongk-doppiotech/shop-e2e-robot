*** Variables ***
${product_detail_locator.btn_increase_qty}          css=[data-testid="pd-qty-inc"]
${product_detail_locator.txt_product_price}         css=[data-testid="productdetail-price"]
${product_detail_locator.txt_quantity}              css=[data-testid="pd-qty-input"]
${product_detail_locator.ddl_color}                 css=select.color
${product_detail_locator.btn_add_to_cart}           css=[data-testid="pd-add-to-cart"]
${product_detail_locator.lnk_product_by_name}       css=li[data-testid^="product-card-"] a:has-text("@#string@#")
${product_detail_locator.btn_color_by_name}         css=.chip[data-testid^="pd-opt-color-"]:has-text("@#string@#")

# Fix me
${product_detail_locator.tile_name}                 css=[data-testid="productdetail-title"]
${product_detail_locator.btn_add}                   css=[data-testid="pd-add-to-cart"]

${product_detail_locator.color_picker}              css=label:has-text("Color")
${product_detail_locator.color_option_tpl}          css=[data-testid="pd-opt-color-${REPLACE_TEXT}"]
${product_detail_locator.color_option_index}        css=div:has(> label:has-text("Color")) [aria-label="productdetail-button-${REPLACE_TEXT}"]

${product_detail_locator.size_picker}               css=label:has-text("Size")
${product_detail_locator.size_option_tpl}           css=[data-testid="pd-opt-size--${REPLACE_TEXT}"]
${product_detail_locator.size_option_index}         css=div:has(> label:has-text("Size")) [aria-label="productdetail-button-${REPLACE_TEXT}"]

${product_detail_locator.qty_input}                 css=[data-testid="pd-qty-input"]

${product_detail_locator.notification_msg}          css=div[role="status"] >> text="${REPLACE_TEXT}"
