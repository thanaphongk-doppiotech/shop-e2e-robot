*** Keywords ***
Click doppee logo to go homepage
    Browser.Click       selector=${header_locator.btn_doppee_logo}
    Browser.Wait for load state

Click my account button
    Browser.Click       selector=${header_locator.btn_my_account}

Input search text
    [Arguments]     ${text}
    Browser.Fill text   selector=${header_locator.txt_search}     txt=${text}

Click search button
    Browser.Click   selector=${header_locator.btn_search}

Click cart button
    Browser.Click   selector=${header_locator.btn_cart}

Click language button
    Browser.Click   selector=${header_locator.btn_language}
