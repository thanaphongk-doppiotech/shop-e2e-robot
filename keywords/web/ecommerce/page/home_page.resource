*** Keywords ***

Verify suggested products are 8
    [Documentation]    Count product cards and assert = 8; iterate to verify visibility
    Browser.Wait For Elements State    ${home.suggested_grid}    visible    timeout=${LONG_TIMEOUT}
    
    ${cards}=    Browser.Get Elements    ${home.suggested_cards}
    ${count}=    BuiltIn.Get Length      ${cards}

    BuiltIn.Log To Console  \nSuggest product length = ${count}
    
    BuiltIn.Should Be Equal As Integers    ${count}    8
    
    FOR    ${card}    IN    @{cards}
        # Expect    To Be Visible    ${card}
        common.Wait page contain element then scroll to  ${card}
        Browser.Get Element States  ${card}     contains  visible
    END