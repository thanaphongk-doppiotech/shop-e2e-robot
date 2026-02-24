*** Keywords ***
Change language
    [Documentation]     ${language} = en or th
    [Arguments]     ${language}
    header_page.Click language button
    ${locator}=         String.Replace string    string=${header_locator.btn_language_by_text}                          search_for=@#string@#    replace_with=${language}
    Browser.Click       selector=${locator}
    BuiltIn.Set test variable    ${LOCALE}      ${language}

Input search and click on suggest word
    [Arguments]     ${search_text}      ${suggest_text}
    header_page.Input search text  text=${search_text}
    ${locator}=    String.Replace string    string=${header_locator.txt_suggest_by_text}           search_for=@#string@#         replace_with=${suggest_text}
    Browser.Click   selector=${locator}

Click my account and click signin
    header_page.Click my account button
    Browser.Click       selector=${header_locator.btn_signin}
