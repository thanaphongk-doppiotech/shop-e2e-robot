*** Variables ***

${home_locator.suggested_grid}          css=[data-testid="home-featured-list"]
${home_locator.suggested_cards}         css=[data-testid="home-featured-list"] > [data-testid^="home-featured-item-"]
${home_locator.suggested_cards_index}   css=[aria-label="home-li-${REPLACE_TEXT}"]