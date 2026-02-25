*** Keywords ***
Click product name to view detail
    [Arguments]     ${product_name}
    ${locator}          String.Replace string    string=${product_list_locator.lnk_product_by_name}                     search_for=@#string@#    replace_with=${product_name}
    Browser.Hover       selector=${locator}
    Browser.Click       selector=${locator}
