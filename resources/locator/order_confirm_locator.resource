*** Variables ***

${order_confirm_locator.lbl_order_number}       css=span:has-text("#")
${order_confirm_locator.btn_view_my_order}      css=[data-testid="payment-success-view-orders"]
${order_confirm_locator.btn_paid_success}       css=[data-testid="payment-confirm-qr"]
${order_confirm_locator.img_qr_code}            css=canvas[data-testid="mockqr-canvas"]
