*** Keywords ***

Scroll to product card by product name
    [Arguments]     ${product_name}
    ${product_locator}=  String.Replace String   ${plp.product_name}     ${REPLACE_TEXT}     ${product_name}
    common.Wait page contain element then scroll to  ${product_locator}

Click product name to product details
    [Arguments]     ${product_name}
    ${product_locator}=  String.Replace String   ${plp.product_name}     ${REPLACE_TEXT}     ${product_name}
    common.Wait element visible then click  ${product_locator}