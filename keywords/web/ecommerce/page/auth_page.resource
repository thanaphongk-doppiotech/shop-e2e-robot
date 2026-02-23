*** Keywords ***

Sign up with generated email and password
    [Arguments]    ${email}    ${password}
    common.Wait element visible then click  ${auth_locator.a_sign_up}
    common.Wait element visible then input  ${auth_locator.signup.input_full_name}  ${user.full_name}
    common.Wait element visible then input  ${auth_locator.signup.input_mobile_phone}  ${user.mobile_phone}

    ${time}     BuiltIn.Get Time    format=epoch
    ${time_str}    BuiltIn.Convert To String    ${time}
    ${random_email}     String.Replace String   ${email}  ${lbl_random}   ${time_str}

    common.Wait element visible then input  ${auth_locator.signup.input_email}  ${random_email}

    common.Wait element visible then input  ${auth_locator.signup.input_password}  ${password}
    common.Wait element visible then input  ${auth_locator.signup.input_cf_password}  ${password}

    common.Wait element visible then click  ${auth_locator.signup.btn_create_account}

Login with email and password
    [Arguments]    ${email}    ${password}

    common.Wait element visible then input  ${auth_locator.input_email}  ${email}
    common.Wait element visible then input  ${auth_locator.input_password}  ${password}
    common.Wait element visible then click  ${auth_locator.btn_sign_in}
    common.Short sleep