*** Keywords ***
Login with email and password
    [Arguments]     ${email}    ${password}
    header_feature.Click my account and click signin
    auth_page.Input email    email=${email}
    auth_page.Input password    password=${password}
    auth_page.Select remember me checkbox
    auth_page.Click signin button
    notification_page.Click close notification button

Sign up with account data
    [Arguments]     ${full_name}    ${mobile_number}    ${email}    ${password}
    header_feature.Click my account and click signin
    auth_page.Click signup button
    signup_page.Input fullname    fullname=${full_name}
    signup_page.Input mobile phone    mobile_phone=${mobile_number}
    signup_page.Input email    email=${email}
    signup_page.Input password    password=${password}
    signup_page.Input confirm password    confirm_password=${password}
    signup_page.Click create account button
    header_page.Click doppee logo to go homepage
