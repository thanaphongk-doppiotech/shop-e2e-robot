*** Variables ***
# shadow piercing In Console
# document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-payment-success^="payment-success-"]')
${header_locator.btn_doppee_logo}           id=nav-logo
${header_locator.txt_search}                css=[data-testid="nav-search-input"]
${header_locator.txt_suggest_by_text}       css=div[data-testid="nav-search-suggest"] span:has-text("@#string@#")
${header_locator.btn_search}                css=[data-testid="nav-search-submit"]
${header_locator.btn_my_account}            css=[data-testid="nav-account-button"]
${header_locator.btn_signin}                css=[data-testid="nav-account-signin"]
${header_locator.btn_cart}                  css=[data-testid="nav-cart"]
${header_locator.btn_language}              css=[data-testid="nav-lang-button"]
${header_locator.btn_language_by_text}      css=[data-testid="nav-lang-menu"] button[data-testid="nav-lang-opt-@#string@#"]
