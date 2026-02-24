*** Keywords ***
Input fullname
    [Arguments]     ${fullname}
    Browser.Fill text       selector=${signup_locator.txt_full_name}    txt=${fullname}

Input mobile phone
    [Arguments]     ${mobile_phone}
    Browser.Fill text       selector=${signup_locator.txt_mobile_phone}    txt=${mobile_phone}

Input email
    [Arguments]     ${email}
    Browser.Fill text       selector=${signup_locator.txt_email}    txt=${email}

Input password
    [Arguments]     ${password}
    Browser.Fill text       selector=${signup_locator.txt_password}    txt=${password}

Input confirm password
    [Arguments]     ${confirm_password}
    Browser.Fill text       selector=${signup_locator.txt_cf_password}    txt=${confirm_password}

Click create account button
    Browser.Click       selector=${signup_locator.btn_create_account}
