*** Variables ***

# shadow piercing In Console
# document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-payment-success^="payment-success-"]')

${header_locator.a_doppee_logo}         css=[data-testid="nav-logo"]
${header_locator.input_search}          css=[data-testid="nav-search-input"]
${header_locator.ddl_language}          css=[data-testid="nav-lang-button"]
${header_locator.opt_lang_thai}         css=[data-testid="nav-lang-opt-th"]
${header_locator.opt_lang_eng}          css=[data-testid="nav-lang-opt-en"]

${header_locator.autocomplete_panel}    css=[data-testid="nav-search-suggest"]
${header_locator.autocomplete_value}    css=div[data-testid="nav-search-suggest"] span:has-text("${REPLACE_TEXT}")
#${header_locator.opt_ceramic_mug}       text=Ceramic Mug
${header_locator.btn_cart}              css=[data-testid="nav-cart"]
#${header_locator.badge_cart_count}      css=[data-testid="cart-count"]
${header_locator.btn_search}            css=[data-testid="nav-search-submit"]
${header_locator.btn_my_account}        css=[data-testid="nav-account-button"]
${header_locator.a_signin}              css=[data-testid="nav-account-signin"]

${header_locator.notification}          css=div[role="status"]