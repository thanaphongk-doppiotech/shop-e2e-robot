*** Variables ***

# shadow piercing In Console 
# document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-payment-success^="payment-success-"]')

${header.a_doppee_logo}         css=[data-testid="nav-logo"]
${header.input_search}          css=[data-testid="nav-search-input"]
${header.ddl_language}          css=[data-testid="nav-lang-button"]
${header.opt_lang_thai}         css=[data-testid="nav-lang-opt-th"]
${header.opt_lang_eng}          css=[data-testid="nav-lang-opt-en"]

${header.autocomplete_panel}    css=[data-testid="nav-search-suggest"]
${header.autocomplete_value}    css=div[data-testid="nav-search-suggest"] span:has-text("${REPLACE_TEXT}")
#${header.opt_ceramic_mug}       text=Ceramic Mug
${header.btn_cart}              css=[data-testid="nav-cart"]
#${header.badge_cart_count}      css=[data-testid="cart-count"]
${header.btn_search}            css=[data-testid="nav-search-submit"]
${header.btn_my_account}        css=[data-testid="nav-account-button"]
${header.a_signin}              css=[data-testid="nav-account-signin"]

${header.notification}          css=div[role="status"]