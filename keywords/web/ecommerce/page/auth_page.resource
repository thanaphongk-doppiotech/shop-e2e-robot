*** Keywords ***
Click signup button
    Browser.Click       selector=${auth_locator.btn_signup}

Input email
    [Arguments]     ${email}
    Browser.Fill text       selector=${auth_locator.txt_email}    txt=${email}

Input password
    [Arguments]     ${password}
    Browser.Fill text       selector=${auth_locator.txt_password}    txt=${password}

Select remember me checkbox
    Browser.Check checkbox    selector=${auth_locator.chk_remember_me}

Click signin button
    Browser.Click       selector=${auth_locator.btn_signin}
