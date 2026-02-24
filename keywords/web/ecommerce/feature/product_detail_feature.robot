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

Adjust quantity by number
    [Arguments]     ${number}
    ${current_qty}      product_detail_page.Get product quantity
    ${click_diff}       BuiltIn.Evaluate    ${number} - ${current_qty}
    ${is_negative}      BuiltIn.Evaluate    ${click_diff} < 0
    ${click_needed}     BuiltIn.Evaluate    abs(${click_diff})
    FOR     ${i}	IN RANGE	${click_needed}
        IF  ${is_negative}
            product_detail_page.Click decrease quantity button
        ELSE
            product_detail_page.Click increase quantity button
        END
    END
    ${current_qty}      product_detail_page.Get product quantity
    BuiltIn.Should be equal as numbers    first=${number}    second=${current_qty}

Add product to cart by random from homepage
    [Arguments]     ${retry_times}=10
    ${is_done}=             Set variable        ${FALSE}
    WHILE    not ${is_done}    limit=${retry_times}
        header_page.Click doppee logo to go homepage
        home_page.Click on suggest product by random
        ${is_out_of_stock}=     product_detail_page.Verify out of stock button is display
        IF    not ${is_out_of_stock}
            Run keyword and ignore error    product_detail_page.Select product color by index    index=0
            Run keyword and ignore error    product_detail_page.Select product size by index    index=0
            ${qty}          String.Generate random string           length=1    chars=23
            product_detail_feature.Adjust quantity by number    number=${qty}
            product_detail_page.Click add to cart button
            notification_page.Click close notification button
            ${is_done}=     Set variable    ${TRUE}
        ELSE
            BuiltIn.Log     message=Product out of stock, trying next one...
        END
    END
    Run keyword if          not ${is_done}      BuiltIn.Fail    Product is out of stock
