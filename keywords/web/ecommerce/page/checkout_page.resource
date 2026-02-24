*** Keywords ***
Click add new address button
    Browser.Click       selector=${checkout_locator.btn_add_address}

Input first name
    [Arguments]     ${first_name}
    Browser.Fill text       selector=${checkout_locator.txt_first_name}    txt=${first_name}

Input last name
    [Arguments]     ${last_name}
    Browser.Fill text       selector=${checkout_locator.txt_last_name}    txt=${last_name}

Input address detail
    [Arguments]     ${address_detail}
    Browser.Fill text       selector=${checkout_locator.txt_address_detail}    txt=${address_detail}

Select province by province name
    [Arguments]     ${province_name}
    Browser.Select options by    ${checkout_locator.ddl_province}           text                    ${province_name}

Select district by district name
    [Arguments]     ${district_name}
    Browser.Select options by    ${checkout_locator.ddl_district}           text                    ${district_name}

Select subdistrict by subdistrict name
    [Arguments]     ${subdistrict_name}
    Browser.Select options by    ${checkout_locator.ddl_sub_disctrict}      text                    ${subdistrict_name}

Select default address checkbox
    Browser.Check checkbox    selector=${checkout_locator.chk_save_default}

Click save address button
    Browser.Click       selector=${checkout_locator.btn_save_addr}

Select pay by qr code
    Browser.Hover       selector=${checkout_locator.rdo.qr_code}
    Browser.Click       selector=${checkout_locator.rdo.qr_code}

Select pay by credit card
    Browser.Hover       selector=${checkout_locator.rdo_credit_card}
    Browser.Click       selector=${checkout_locator.rdo_credit_card}

Input credit card number
    [Arguments]     ${credit_card_number}
    Browser.Fill text       selector=${checkout_locator.txt_card_number}    txt=${credit_card_number}

Input credit card expiry date
    [Arguments]     ${credit_card_expire_date}
    Browser.Fill text       selector=${checkout_locator.txt_card_exp}    txt=${credit_card_expire_date}

Input credit card cvv
    [Arguments]     ${credit_card_cvv}
    Browser.Fill text       selector=${checkout_locator.txt_card_cvv}    txt=${credit_card_cvv}

Input credit card holder name
    [Arguments]     ${credit_card_holder_name}
    Browser.Fill text       selector=${checkout_locator.txt_card_holder_name}    txt=${credit_card_holder_name}

Click add new credit card button
    Browser.Click       selector=${checkout_locator.btn_add_new_card}

Click place order button
    Browser.Hover       selector=${checkout_locator.btn_place_order}
    Browser.Click       selector=${checkout_locator.btn_place_order}
