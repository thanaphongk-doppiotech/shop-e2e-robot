*** Variables ***
${product_detail_locator.btn_increase_qty}          css=[data-testid="pd-qty-inc"]
${product_detail_locator.btn_decrease_qty}          css=[data-testid="pd-qty-dec"]
${product_detail_locator.txt_product_price}         css=[data-testid="productdetail-price"]
${product_detail_locator.txt_quantity}              css=[data-testid="pd-qty-input"]
${product_detail_locator.ddl_color}                 css=select.color
${product_detail_locator.btn_add_to_cart}           css=[data-testid="pd-add-to-cart"]
${product_detail_locator.lnk_product_by_name}       css=li[data-testid^="product-card-"] a:has-text("@#string@#")
${product_detail_locator.opt_color_by_name}         css=.chip[data-testid^="pd-opt-color-"]:has-text("@#string@#")
${product_detail_locator.btn_out_of_stock}          css=[data-testid="pd-add-to-cart"]:has-text("@#string_locale@#")
${product_detail_locator.opt_color_by_index}        css=div > button[data-testid^="pd-opt-color-"] >> nth=@#index@#
${product_detail_locator.opt_size_by_index}         css=div > button[data-testid^="pd-opt-size-"] >> nth=@#index@#
