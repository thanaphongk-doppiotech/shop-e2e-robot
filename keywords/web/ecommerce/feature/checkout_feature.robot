*** Keywords ***
Add new address
    [Arguments]     ${first_name}       ${last_name}    ${addr_no}      ${province}     ${district}     ${subdistrict}      ${is_default_addr}=${TRUE}
    checkout_page.Click add new address button
    checkout_page.Input first name    first_name=${first_name}
    checkout_page.Input last name    last_name=${last_name}
    checkout_page.Input address detail    address_detail=${addr_no}
    checkout_page.Select province by province name    province_name=${province}
    checkout_page.Select district by district name    district_name=${district}
    checkout_page.Select subdistrict by subdistrict name    subdistrict_name=${subdistrict}
    BuiltIn.Run keyword if    ${is_default_addr}    checkout_page.Select default address checkbox
    checkout_page.Click save address button

Add new credit card
    [Arguments]     ${card_number}      ${exp}      ${cvv}      ${card_holder_name}
    Browser.Hover       selector=${checkout_locator.rdo_credit_card}
    checkout_page.Select pay by credit card
    checkout_page.Input credit card number    credit_card_number=${card_number}
    checkout_page.Input credit card expiry date    credit_card_expire_date=${exp}
    checkout_page.Input credit card cvv    credit_card_cvv=${cvv}
    checkout_page.Input credit card holder name    credit_card_holder_name=${card_holder_name}
    checkout_page.Click add new credit card button

Verify address is empty
    ${product_elements}     Browser.Get elements    selector=${cart_locator.btn_remove_elements}
    ${product_elements_length}    BuiltIn.Get length    item=${product_elements}
    ${is_address_empty}     Builtin.Evaluate        ${product_elements_length} < 1
    RETURN      ${is_address_empty}

Add new address if empty
    [Arguments]     ${first_name}       ${last_name}    ${addr_no}      ${province}     ${district}     ${subdistrict}      ${is_default_addr}=${TRUE}
    ${is_address_empty}     checkout_feature.Verify address is empty
    BuiltIn.Return from keyword if    ${is_address_empty}
    checkout_feature.Add new address
    ...                     first_name=${first_name}
    ...                     last_name=${last_name}
    ...                     addr_no=${addr_no}
    ...                     province=${province}
    ...                     district=${district}
    ...                     subdistrict=${subdistrict}
    ...                     is_default_addr=${is_default_addr}
