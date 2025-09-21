*** Keywords ***

Add new address
    [Arguments]     ${fname}  ${lname}  ${addr_no}  ${province}  ${district}  ${subdistrict}

    common.Wait element visible then click  ${checkout.btn_add_address}
    common.Wait page contain element then scroll to  ${checkout.btn_save_addr}

    common.Wait element visible then input  ${checkout.input_fname}  ${fname}
    common.Wait element visible then input  ${checkout.input_lname}  ${lname}
    common.Wait element visible then input  ${checkout.input_addr_detail}  ${addr_no}

    common.Wait element visible then select option by value  ${checkout.ddl_province}  ${province}
    common.Wait element visible then select option by value  ${checkout.ddl_district}  ${district}
    common.Wait element visible then select option by value  ${checkout.ddl_sub_disctrict}  ${subdistrict}

    Browser.Get Text    ${checkout.input_postcode}  !=  ${EMPTY}

    common.Wait element visible then click  ${checkout.btn_save_addr}

Add new credit card
    [Arguments]    ${card_number}  ${exp}  ${cvv}  ${card_holder_name}
    common.Wait page contain element then scroll to  ${checkout.tab_card}
    Browser.Click    ${checkout.tab_card}
    common.Wait element visible then input  ${checkout.input_card_number}    ${card_number}
    common.Wait element visible then input  ${checkout.input_card_exp}    ${exp}
    common.Wait element visible then input  ${checkout.input_card_cvv}    ${cvv}
    common.Wait element visible then input  ${checkout.input_card_holder_name}    ${card_holder_name}
    common.Wait element visible then click  ${checkout.btn_add_new_card}
 
Select credit card payment method
    common.Wait page contain element then scroll to  ${checkout.tab_card}
    Browser.Click    ${checkout.tab_card}

# Remove
Select first saved card
    common.Wait element visible then click  css=[data-testid="checkout-card-14"]

Select QR code payment method
    common.Wait element visible then click  ${checkout.tab_qr}

Place order
    common.Wait page contain element then scroll to  ${checkout.btn_pay}
    common.Short sleep
    common.Wait element visible then click  ${checkout.btn_pay}