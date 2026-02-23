*** Keywords ***
Click increase quantity button to add product by number
    [Documentation]     Adjusts the product quantity to the target number by clicking the increase button.
    ...                 This keyword calculates the difference between the target `${number}` and the
    ...                 current quantity, clicks the button accordingly, and verifies the final result.
    ...                 Arguments:
    ...                     - ${number}     (integer):  The total target quantity desired (e.g., 5).
    [Arguments]     ${number}
    ${current_qty}      product_detail_page.Get product quantity
    ${click_needed}     BuiltIn.Evaluate    ${number} - ${current_qty}
    FOR     ${i}	IN RANGE	${click_needed}
        product_detail_page.Click increase quantity button
    END
    ${current_qty}      product_detail_page.Get product quantity
    BuiltIn.Should be equal as numbers    first=${number}    second=${current_qty}
