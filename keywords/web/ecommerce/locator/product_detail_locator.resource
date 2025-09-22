*** Variables ***

${pdp.tile_name}            css=[data-testid="productdetail-title"]
${pdp.btn_add}              css=[data-testid="pd-add-to-cart"]

${pdp.color_picker}         css=label:has-text("Color")
${pdp.color_option_tpl}     css=[data-testid="pd-opt-color-${REPLACE_TEXT}"]
${pdp.color_option_index}   css=div:has(> label:has-text("Color")) [aria-label="productdetail-button-${REPLACE_TEXT}"]

${pdp.size_picker}          css=label:has-text("Size")
${pdp.size_option_tpl}      css=[data-testid="pd-opt-size--${REPLACE_TEXT}"]
${pdp.size_option_index}    css=div:has(> label:has-text("Size")) [aria-label="productdetail-button-${REPLACE_TEXT}"]

${pdp.qty_input}            css=[data-testid="pd-qty-input"]

${pdp.notification_msg}     css=div[role="status"] >> text="${REPLACE_TEXT}"